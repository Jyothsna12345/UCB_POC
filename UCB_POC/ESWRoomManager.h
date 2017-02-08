//
//  ESWRoomManager.h
//  SimplicITy
//
//  Created by Varghese Simon on 3/25/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESWPropertyCreater.h"

@class CalendarEvent;
@class ESWRoomManager;
@class PasswordManager;

typedef void(^SuccessBlock)(NSString *itemId, NSString *changeKey);
typedef void(^FailureBlock)(NSError *error);

@protocol ESWRoomManagerDelegate <NSObject>

- (void)ESWRoomManager:(ESWRoomManager *)manager foundListsOfRooms:(NSArray *)rooms;
- (void)ESWRoomManager:(ESWRoomManager *)manager FoundRooms:(NSArray *)rooms;

- (void)ESWRoomManager:(ESWRoomManager *)manager foundSlotsAvailable:(NSDictionary *)dictOfAllRooms;
- (void)ESWRoomManager:(ESWRoomManager *)manager foundAvailableRooms:(NSArray *)availableRooms;

- (void)ESWRoomManager:(ESWRoomManager *)manager createdRoomWith:(NSString *)eventID;

- (void)ESWRoomManager:(ESWRoomManager *)manager failedWithError:(NSError *)error;

- (void)ESWRoomManager:(ESWRoomManager *)manager successfullYGotContacts:(NSArray *)foundContacts;

- (void)ESWRoomManager:(ESWRoomManager *)manager gotPassword:(PasswordManager *)passwordManager;
- (void)ESWRoomManager:(ESWRoomManager *)manager failedToGetPassword:(PasswordManager *)passwordManager;

//my created Delegate

-(void)ESWRoomManager:(ESWRoomManager *)manager gotCalenderEvent:(NSMutableArray *)calenderEvent;


@end

@interface ESWRoomManager : NSObject
{
    
}

@property (weak, nonatomic) id<ESWRoomManagerDelegate> delegate;

- (void)getRoomsList;
- (void)getRoomsForRoomsLists:(NSArray *)roomListsList;
- (void)getRoomsForRoomList:(t_EmailAddressType *)emailID;

- (void)findFreeSlotsOfRooms:(NSArray *)rooms forStart:(NSDate *)startDate toEnd:(NSDate *)endDate;

- (void)findEventForRoom:(NSString *)room forDate:(NSDate *)requestedDate;
- (void)availablityOfRooms:(NSArray *)rooms forStart:(NSDate *)startDate toEnd:(NSDate *)endDate;

- (void)createCalendarEvent:(CalendarEvent *)event;

//- (void)getContactsForEntry:(NSString *)entry withSuccess:(void (^)(BOOL foundContacts ,NSArray *contactsFound))success;
- (void)getContactsForEntry:(NSString *)entry;


// My Created

- (void)findAllMyEvents:(NSArray *)emailID forStart:(NSDate *)startDate toEnd:(NSDate *)endDate;



@end
