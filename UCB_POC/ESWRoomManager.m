//
//  ESWRoomManager.m
//  SimplicITy
//
//  Created by Varghese Simon on 3/25/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import "ESWRoomManager.h"
#import "ExchangeWebService.h"
#import "RoomModel.h"
#import "Constant.h"
#import "UserInfo.h"
#import "CalendarEvent.h"
#import "ContactDetails.h"
#import "TimeWindow.h"
#import "PasswordManager.h"
#import <sqlite3.h>
#import "Constant.h"
#import "MyEventModel.h"
#define MIN_TIME_SLOT_FOR_SEARCH 10*60

@interface ESWRoomManager() <SSLCredentialsManaging,PasswordManagerDelegate>

@end

@implementation ESWRoomManager 
{
    NSMutableArray *roomsListsArray;
    ExchangeWebService_ExchangeServiceBinding *binding;
    ESWPropertyCreater *propertyCreater;
    
    NSDateFormatter *dateFormatter;
    
    NSString *EWSUserName, *EWSPassword;
    
    NSInteger noOfFailedAuth;
    
    PasswordManager *passwordManager;
    sqlite3 *database;
    NSMutableArray *calenderEventsArr;
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    NSString *ewsRequestURL = EWS_REQUSET_URL;
    NSTimeZone *defaultTimeZone = [NSTimeZone defaultTimeZone];
    NSString *timeZoneFullName = [defaultTimeZone localizedName:NSTimeZoneNameStyleStandard locale:([[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"])];
    timeZoneFullName = [self microsoftZoneFor:timeZoneFullName];
    NSLog(@"%@", timeZoneFullName);
    //this is fix for a bug in TimeZone name compatability. In IOS timeZone name is "Eastern European Standard Time" but Microsoft expects @"E. Europe Standard Time". Simliary for the rest too.
//    if ([timeZoneFullName isEqualToString:@"Eastern European Standard Time"])
//    {
//        timeZoneFullName = @"E. Europe Standard Time";
//        
//    }else if ([timeZoneFullName isEqualToString:@"East Africa Time"])
//    {
//        timeZoneFullName = @"E. Africa Standard Time";
//        
//    }else if ([timeZoneFullName isEqualToString:@"Australian Eastern Standard Time"])
//    {
//        timeZoneFullName = @"E. Australia Standard Time";
//        
//    }else if ([timeZoneFullName isEqualToString:@"Eastern South America Standard Time"])
//    {
//        timeZoneFullName = @"E. South America Standard Time";
//    }
    
    t_TimeZoneDefinitionType *timeZoneDefinition = [[t_TimeZoneDefinitionType alloc] init];
    timeZoneDefinition.Id_ = timeZoneFullName;
    t_TimeZoneContextType *timeZoneContext = [[t_TimeZoneContextType alloc] init];
    timeZoneContext.TimeZoneDefinition = timeZoneDefinition;
    
    binding  = [[ExchangeWebService ExchangeServiceBinding] initWithAddress:ewsRequestURL];
    
    binding.logXMLInOut = YES;
    
    t_ElementRequestServerVersion *serverVersion = [[t_ElementRequestServerVersion alloc] init];
    serverVersion.Version = t_ExchangeVersionType_Exchange2010;
    binding.RequestServerVersionHeader = serverVersion;
    binding.TimeZoneContextHeader = timeZoneContext;
    binding.sslManager = self;
    //dateFormatter = [[NSDateFormatter alloc] initWithSafeLocale];
    noOfFailedAuth = 0;
    
    passwordManager = [[PasswordManager alloc] init];
    passwordManager.delegate = self;

    calenderEventsArr =[[NSMutableArray alloc]init];

}

- (void)getRoomsList
{
    noOfFailedAuth = 0;
    
    ExchangeWebService_GetRoomListsType *request = [[ExchangeWebService_GetRoomListsType alloc] init];

    [binding GetRoomLists:request
                  success:^(NSArray *headers, NSArray *bodyParts) {
                      
                      [self createRoomListForResponse:bodyParts];
                      
                  } error:^(NSError *error) {
                      
                      NSLog(@"Get Room List Error: %@", error);
                      
                  }];
}
- (void)createRoomListForResponse:(NSArray *)bodyParts
{
    for (id resp in bodyParts)
    {
        if ([resp isKindOfClass:[ExchangeWebService_GetRoomListsResponseMessageType class]])
        {
            NSLog(@"Yes...");
            roomsListsArray = [[NSMutableArray alloc] init];
            
            ExchangeWebService_GetRoomListsResponseMessageType *roomListsObj = (ExchangeWebService_GetRoomListsResponseMessageType *)resp;
            
            NSArray *arrayOfListRooms = roomListsObj.RoomLists;
//Here we will be getting List of List of Rooms. eg) We will be getting List of location and a Location will have list of rooms.
//After getting  List of list of Rooms, we have to call the API with EMAIL ID of LIST to get the list of ROOMS of that particular LIST
            
            for (t_EmailAddressType *anEmailIDObj in arrayOfListRooms)
            {
                [roomsListsArray addObject:anEmailIDObj];
            }
            
            [self.delegate ESWRoomManager:self foundListsOfRooms:roomsListsArray];
//            [self getRoomsForRoomsLists:roomsListsArray];
        }
    }
}

- (void)getRoomsForRoomsLists:(NSArray *)roomListsList
{
    for (t_EmailAddressType *anEmailID in roomListsList)
    {
        [self getRoomsForRoomList:anEmailID];
    }
}

- (void)getRoomsForRoomList:(t_EmailAddressType *)emailID
{
    noOfFailedAuth = 0;

    ExchangeWebService_GetRoomsType *requestRooms = [[ExchangeWebService_GetRoomsType alloc] init];
    requestRooms.RoomList = emailID;
    roomsListsArray = [[ NSMutableArray alloc] init];
    [binding GetRooms:requestRooms
              success:^(NSArray *headers, NSArray *bodyParts) {
                  
                  for (id resp in bodyParts)
                  {
                      if ([resp isKindOfClass:[ExchangeWebService_GetRoomsResponseMessageType class]])
                      {
                          ExchangeWebService_GetRoomsResponseMessageType *roomsListObj = (ExchangeWebService_GetRoomsResponseMessageType *)resp;
                          
                          for (t_RoomType *aRoom in roomsListObj.Rooms)
                          {
                              RoomModel *roomModel = [[RoomModel alloc] init];
                              roomModel.nameOfRoom = [self nameOfRoomAfterRemovingCountryCode:aRoom.Id.Name];
                              roomModel.emailIDOfRoom = aRoom.Id.EmailAddress;
                              roomModel.emailIDEWS = aRoom.Id;
                              
                              [roomsListsArray addObject:roomModel];
                          }
                          
                          [self.delegate ESWRoomManager:self FoundRooms:roomsListsArray];
                      }
                  }
              } error:^(NSError *error) {
                  
                  [self.delegate ESWRoomManager:self failedWithError:error];

              }];
    
}

- (void)findAllMyEvents:(NSArray *)emailID forStart:(NSDate *)startDate toEnd:(NSDate *)endDate
{
   
    if (emailID.count == 0 | emailID == nil)
    {
        
        NSLog(@"There should be atleast one Email ID in the list");
        return;
    }
    
    noOfFailedAuth = 0;
    
    if (propertyCreater == nil)
    {
        propertyCreater = [[ESWPropertyCreater alloc] init];
    }
    ExchangeWebService_GetUserAvailabilityRequestType *request = [[ExchangeWebService_GetUserAvailabilityRequestType alloc] init];
    request.TimeZone = [propertyCreater timeZone];
    request.MailboxDataArray = [propertyCreater mailBoxArrayWithEmailIDS:emailID];
    request.FreeBusyViewOptions = [propertyCreater freeBusyViewOptionsWith:startDate andEndsAt:endDate];
    
    [binding GetUserAvailabilityUsingGetUserAvailabilityRequest:request
                                                        success:^(NSArray *headers, NSArray *bodyParts) {
                                                                                                                           [self findAvailabilityForResponse:bodyParts OfRooms:emailID];
                                                            
                                                        }
                                                          error:^(NSError *error) {
                                                              [self.delegate ESWRoomManager:self failedWithError:error];
                                                          
                                                          }];



}







- (NSString *)nameOfRoomAfterRemovingCountryCode:(NSString *)initialRoomName
{
//For UCB first 8 letter will represent location eg)"* BLR - KRISHNA - Board Room" . We are removing this to get actual name of rooms
    NSRange firstOccurance = [initialRoomName rangeOfString:@" - "];
    if (firstOccurance.location == NSNotFound)
    {
        return initialRoomName;
    }
    
    NSRange rangeToBeRemove;
    rangeToBeRemove.location = 0;
    rangeToBeRemove.length = firstOccurance.location + firstOccurance.length;
    

    
    return [[initialRoomName mutableCopy] stringByReplacingCharactersInRange:rangeToBeRemove withString:@""];
}



- (void)findFreeSlotsForResponse:(NSArray *)bodyParts OfRooms:(NSArray *)rooms forStart:(NSDate *)startDate toEnd:(NSDate *)endDate
{
    for (id resp in bodyParts)
    {
        if ([resp isKindOfClass:[ExchangeWebService_GetUserAvailabilityResponseType class]])
        {
            ExchangeWebService_GetUserAvailabilityResponseType *availabilityResp = (ExchangeWebService_GetUserAvailabilityResponseType *)resp;
            
            NSArray *freeBusyArray = availabilityResp.FreeBusyResponseArray;
            
            NSMutableDictionary *dictOfAllRooms = [[NSMutableDictionary alloc] init];
            
            for (int i = 0; i < freeBusyArray.count; i++)
            {
                ExchangeWebService_FreeBusyResponseType *freeBusyResponse = freeBusyArray[i];
                NSArray *calenderEvents = freeBusyResponse.FreeBusyView.CalendarEventArray;
                
                NSArray *freeSlots = [self findAvailableTimeFromEvents:calenderEvents forDate:startDate and:endDate];
                NSString *emailIDOfRoom = rooms[i];
                dictOfAllRooms[emailIDOfRoom] = freeSlots;
            }
            
            [self.delegate ESWRoomManager:self foundSlotsAvailable:dictOfAllRooms];
        }
    }
    
}

- (NSArray *)findAvailableTimeFromEvents:(NSArray *)events forDate:(NSDate *)durationStart and:(NSDate *)durationEnd
{
    NSMutableArray *avaliableTimeSlots = [[NSMutableArray alloc] init];
    
    if (events == nil || events.count == 0)
    {
        [avaliableTimeSlots addObject:[self timeDurationForStart:durationStart andEnd:durationEnd]];
        return avaliableTimeSlots;
    }
    
    //first slot will be duratoin start time to startTime of FIRST EVENT
    t_CalendarEvent *previousEvent = [events firstObject];
    TimeWindow *timeWindow = [self timeDurationForStart:durationStart andEnd:previousEvent.StartTime];
    if (timeWindow)
    {
        [avaliableTimeSlots addObject:timeWindow];
    }
    
    //Now onwards, a rest slot will be Duration starts at END_TIME of PREVIOUS_EVENT and ends at START_TIME of NEXT_EVENT
    for (int i = 1; i < events.count; i++)
    {
        t_CalendarEvent *nextEvent = events[i];
        
        timeWindow = [self timeDurationForStart:previousEvent.EndTime andEnd:nextEvent.StartTime];
        if (timeWindow)
        {
            [avaliableTimeSlots addObject:timeWindow];
        }
        
        previousEvent = nextEvent;
    }
    
    timeWindow = [self timeDurationForStart:previousEvent.EndTime andEnd:durationEnd];
    if (timeWindow)
    {
        [avaliableTimeSlots addObject:timeWindow];
    }
    
    return avaliableTimeSlots;
}

- (TimeWindow *)timeDurationForStart:(NSDate *)durationStart andEnd:(NSDate *)durationEnd
{
    NSTimeInterval intervel = [durationEnd timeIntervalSinceDate:durationStart];
    if (intervel <  MIN_TIME_SLOT_FOR_SEARCH)
    {
        return nil;
    }
    TimeWindow *duration = [[TimeWindow alloc] init];
    duration.startDate = durationStart;
    duration.endDate = durationEnd;
    
    return duration;
}

// my method
- (void)findAvailabilityForResponse:(NSArray *)bodyParts OfRooms:(NSArray *)rooms
{
    NSMutableArray *availableRooms;

    for (id resp in bodyParts)
    {
        if ([resp isKindOfClass:[SOAPFault class]])
        {
            [self.delegate ESWRoomManager:self failedWithError:nil];
        }
        
        if ([resp isKindOfClass:[ExchangeWebService_GetUserAvailabilityResponseType class]])
        {
            ExchangeWebService_GetUserAvailabilityResponseType *availabilityResp = (ExchangeWebService_GetUserAvailabilityResponseType *)resp;
            
            NSArray *freeBusyArray = availabilityResp.FreeBusyResponseArray;
            availableRooms = [[NSMutableArray alloc] init];
            
            for (int i = 0; i < freeBusyArray.count; i++)
            {
                ExchangeWebService_FreeBusyResponseType *freeBusyResponse = freeBusyArray[i];
                NSArray *calenderEvents = freeBusyResponse.FreeBusyView.CalendarEventArray;
                for (int i =0 ; i<calenderEvents.count; i++) {
                    MyEventModel *eventModel = [[MyEventModel alloc]init];
                    t_CalendarEvent *calenderEvent= calenderEvents[i];
                   t_CalendarEventDetails * calenderEventDetails = calenderEvent.CalendarEventDetails;
                    eventModel.startTime = calenderEvent.StartTime;
                   eventModel.endTime = calenderEvent.EndTime;
                    eventModel.location = calenderEventDetails.Location;
                    eventModel.meetingTitle = calenderEventDetails.Subject;
                    
                    [calenderEventsArr addObject:eventModel];
                }
            }
             [self.delegate ESWRoomManager:self gotCalenderEvent:calenderEventsArr];
           
        }
    }
    NSLog(@"Available Rooms %@", availableRooms);
}






- (void)createCalendarEvent:(CalendarEvent *)event
{
    if (propertyCreater == nil)
    {
        propertyCreater = [[ESWPropertyCreater alloc] init];
    }
    t_CalendarItemType *calenderEvent = [[t_CalendarItemType alloc] init];
    calenderEvent.Subject = event.subject;
    calenderEvent.Body = [propertyCreater bodyForValue:event.body];
    calenderEvent.ReminderMinutesBeforeStart = @"60";
    calenderEvent.LegacyFreeBusyStatus = t_LegacyFreeBusyType_Busy;
    calenderEvent.Start = event.startDate;
    calenderEvent.End = event.endDate;
    calenderEvent.Location = event.location;
    calenderEvent.Resources = [propertyCreater attendeesForMailIDs:event.resources];
    calenderEvent.RequiredAttendees = [propertyCreater attendeesForMailIDs:event.requiredAttendees];
    
    //    calenderEvent.MeetingTimeZone = meetingTimeZone;
    
    ExchangeWebService_CreateItemType *bookARoomRequest = [[ExchangeWebService_CreateItemType alloc] init];
    bookARoomRequest.SendMeetingInvitations = t_CalendarItemCreateOrDeleteOperationType_SendToAllAndSaveCopy;
    bookARoomRequest.Items = @[calenderEvent];
    
    [binding CreateItem:bookARoomRequest success:^(NSArray *headers, NSArray *bodyParts) {
        
        NSLog(@"Success yeahaaaaa");
        [self.delegate ESWRoomManager:self createdRoomWith:@""];
        
    } error:^(NSError *error) {
        
        NSLog(@"Ayoo Error; %@", error);
        [self.delegate ESWRoomManager:self failedWithError:error];

    }];
}

- (void)getContactsForEntry:(NSString *)entry
{
    if (entry == nil | entry.length == 0)
    {
        [self.delegate ESWRoomManager:self failedWithError:nil];
        return;
    }
    ExchangeWebService_ResolveNamesType *request = [[ExchangeWebService_ResolveNamesType alloc] init];
    request.UnresolvedEntry = entry;
    request.ReturnFullContactData = @YES;
    
    [binding ResolveNames:request
                  success:^(NSArray *headers, NSArray *bodyParts) {
                      
                      NSArray *foundContacts = [self parseResolutionResponse:bodyParts];
                      NSLog(@"Yeahaaaaa ");
                      
//                      BOOL isValidName = foundContacts.count > 0;
                      
//                      success(isValidName, foundContacts);
                      [self.delegate ESWRoomManager:self successfullYGotContacts:foundContacts];

                  } error:^(NSError *error) {
                      NSLog(@"%@", error);
                      [self.delegate ESWRoomManager:self failedWithError:error];
                  }];
}

- (NSArray *)parseResolutionResponse:(NSArray *)bodyParts
{
    NSMutableArray *foundContactsArray;

    if (bodyParts.count > 0)
    {
        id body = [bodyParts firstObject];
        
        if ([body isKindOfClass:[ExchangeWebService_ResolveNamesResponseType class]])
        {
            ExchangeWebService_ResolveNamesResponseType *responseType = (ExchangeWebService_ResolveNamesResponseType *)body;
            
            if (responseType.ResponseMessages.count > 0)
            {
                id value = [responseType.ResponseMessages firstObject];
                
                if ([value isKindOfClass:[ExchangeWebService_ResolveNamesResponseMessageType class]])
                {
                    ExchangeWebService_ResolveNamesResponseMessageType *insideResponse = (ExchangeWebService_ResolveNamesResponseMessageType *)value;
                    NSArray *contactsFound = insideResponse.ResolutionSet.Resolution;
                    
                    if (contactsFound.count > 0)
                    {
                        foundContactsArray = [[NSMutableArray alloc] init];
                        
                        for (t_ResolutionType *aResolvedContact in contactsFound)
                        {
                            ContactDetails *aContact =[[ContactDetails alloc] init];
                            
                            if (aResolvedContact.Mailbox != nil)
                            {
                                aContact.emailIDOfContact = aResolvedContact.Mailbox.EmailAddress;
                            }
                            
                            if (aResolvedContact.Contact != nil)
                            {
                                aContact.displayName = aResolvedContact.Contact.DisplayName;
                                aContact.nameOfContact = [NSString stringWithFormat:@"%@ %@", aResolvedContact.Contact.GivenName, aResolvedContact.Contact.Surname];
                            }
                            
                            [foundContactsArray addObject:aContact];
                        }
                        
                        NSLog(@"Found %li contacts", (unsigned long)contactsFound.count);
                    }else
                    {
                        return nil;
                        NSLog(@"No contacts found");
                    }
                }
            }
        }
    }
    
    return foundContactsArray;
}


- (BOOL)canAuthenticateForAuthenticationMethod:(NSString *)authMethod
{
    return YES;
}

- (BOOL)authenticateForChallenge:(NSURLAuthenticationChallenge *)challenge
{
    
   
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:EWS_REQUSET_USERID_KEY];
  //  NSString *userName = [UserInfo sharedUserInfo].cropID;
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:EWS_USERS_PASSWORD_KEY];
    

    
    EWSUserName = userName;
    EWSPassword = password;
    
    
    
    
    NSURLCredential *newCredential = [NSURLCredential
                                      credentialWithUser:EWSUserName
                                      password:EWSPassword
                                      persistence:NSURLCredentialPersistenceForSession];
    
    [[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
    
    noOfFailedAuth++;
    return YES;

    
    
    if ([passwordManager passwordForUser].length <= 0)
    {
        [passwordManager showAlertWithDefaultMessage];
        [self.delegate ESWRoomManager:self failedWithError:nil];

        return NO;
    }

//This method will be called TWO times for proper Credentials. BUT it will be called COUNTINOUSLY (INFINTE TIMES) if credentials are WRONG.
    if (noOfFailedAuth > 1)
    {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning"
//                                                            message:@"Please check Password given in settings page"
//                                                           delegate:self
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles: nil];
//        [alertView show];
        
        [passwordManager showAlertForPasswordWithMessage:@"Password given is wrong. Please enter the correct one"];
        [self.delegate ESWRoomManager:self failedWithError:nil];

        return NO;
    }
    
//    NSLog(@"Auth called");
//    
//    EWSUserName = [UserInfo sharedUserInfo].cropID;
//    EWSPassword = [passwordManager passwordForUser];
//    
//   
//    
//    
//    NSURLCredential *newCredential = [NSURLCredential
//                                      credentialWithUser:EWSUserName
//                                      password:EWSPassword
//                                      persistence:NSURLCredentialPersistenceForSession];
//    
//    [[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
//    
//    noOfFailedAuth++;
    return YES;
}

- (void)passwordManagerFailedToGetPassoword:(PasswordManager *)manager
{
    [self.delegate ESWRoomManager:self gotPassword:passwordManager];
}

- (void)passwordManagerGotPassword:(PasswordManager *)manager
{
    [self.delegate ESWRoomManager:self failedToGetPassword:passwordManager];
}

- (NSString *)microsoftZoneFor:(NSString *)iosZone
{
    NSString *dataBasePath = [[NSBundle mainBundle] pathForResource:@"TimeZoneList.db" ofType:@""];
    const char *dbPath = [dataBasePath UTF8String];
    NSString *microsftZone = iosZone;
    if (sqlite3_open(dbPath, &database) == SQLITE_OK)
    {
        NSString *query = [NSString stringWithFormat:@"SELECT * FROM TimeZones WHERE iOSZone = '%@'", iosZone];
        const char *insert_stmt = [query UTF8String];
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                microsftZone = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                if (microsftZone.length == 0)
                {
                    microsftZone = iosZone;
                }
            }
//            [self.delegate DBManager:self gotSqliteStatment:statement];
            sqlite3_finalize(statement);
        }else
        {
//            microsftZone = @"";
        }
        
        sqlite3_close(database);
    }else
    {
//        microsftZone = @"";
    }
    
    return microsftZone;
    
}

@end
