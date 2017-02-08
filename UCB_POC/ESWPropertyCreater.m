//
//  DateConverter.m
//  ExchangeWebServiceApp
//
//  Created by Varghese Simon on 3/19/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import "ESWPropertyCreater.h"
#import "NSDateFormatter+Locale.h"

@implementation ESWPropertyCreater
{
    NSTimeZone *defaulTimeZone;
    NSDateFormatter *dateFormatter;
    NSCalendar *gregorianCalender;
}

- (instancetype)init
{
    if (self = [super init])
    {
        defaulTimeZone = [NSTimeZone defaultTimeZone];
        gregorianCalender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        dateFormatter = [[NSDateFormatter alloc] initWithSafeLocale];
//        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        defaulTimeZone = [NSTimeZone defaultTimeZone];
    }
    
    return self;
}

- (t_SerializableTimeZone *)timeZone
{
    t_SerializableTimeZone *currentTimeZone = [[t_SerializableTimeZone alloc] init];
    currentTimeZone.Bias = [self minsOffsetFromUTC];
    currentTimeZone.StandardTime = [self standardTime];
    currentTimeZone.DaylightTime = [self daylightTime];
    return currentTimeZone;
}

- (t_SerializableTimeZoneTime *)standardTime
{
    NSDate *currentDate = [NSDate date];
    t_SerializableTimeZoneTime *standardTime = [self timeZoneTimeForDate:currentDate];
    //if daylight svaing is not there for a country, we have to set the MONTH of "Standard" time to ZERO
    if (defaulTimeZone.nextDaylightSavingTimeTransition == nil)
    {
        standardTime.Month = [NSNumber numberWithInteger:0];
    }
    return standardTime;
}


- (t_SerializableTimeZoneTime *)daylightTime
{
    NSDate *nextDaylightSavingDate = defaulTimeZone.nextDaylightSavingTimeTransition;
    
    //    if (defaulTimeZone.isDaylightSavingTime)
    //    {
    //        //current date using daylight saving means next transition is END DATE of DST. So we have to get the current years START date by substracting ONE YEAR from END DATE of DST and ask for next transition Date (START DATE of DST). But for some case substracting ONE YEAR wont give correct results. So its better to reduce 357 days.
    //
    //        NSDate *startingDateOfDST = [nextDaylightSavingDate dateByAddingTimeInterval:-60*60*24*357];
    //        nextDaylightSavingDate = [defaulTimeZone nextDaylightSavingTimeTransitionAfterDate:startingDateOfDST];
    //    }
    
    t_SerializableTimeZoneTime *nextDayLightTime = [self timeZoneTimeForDate:nextDaylightSavingDate];
    nextDayLightTime.Bias = [NSNumber numberWithInteger:defaulTimeZone.daylightSavingTimeOffset/60];
    return nextDayLightTime;
}

- (NSArray *)mailBoxArrayWithEmailIDS:(NSArray *)mailIDS
{
    NSMutableArray *mailBoxArray = [[NSMutableArray alloc] initWithCapacity:mailIDS.count];
    
    for (NSString *mailID in mailIDS)
    {
        t_MailboxData *mailBoxObj = [[t_MailboxData alloc] init];
        t_EmailAddress *email = [[t_EmailAddress alloc] init];
        email.Address = mailID;
        mailBoxObj.Email = email;
        mailBoxObj.AttendeeType = t_MeetingAttendeeType_Required;
        mailBoxObj.ExcludeConflicts = [NSNumber numberWithBool:false];
        
        [mailBoxArray addObject:mailBoxObj];
    }
    
    return mailBoxArray;
}

- (t_FreeBusyViewOptionsType *)freeBusyViewOptionsWith:(NSDate *)startDate andEndsAt:(NSDate *)endDate
{
    t_FreeBusyViewOptionsType *freeBusy = [[t_FreeBusyViewOptionsType alloc] init];
    t_Duration *timeWindow = [[t_Duration alloc] init];
    timeWindow.StartTime = startDate;
    timeWindow.EndTime = endDate;
    freeBusy.TimeWindow = timeWindow;
    freeBusy.MergedFreeBusyIntervalInMinutes = [NSNumber numberWithInteger:5];
    freeBusy.RequestedView = @"DetailedMerged";
    
    return freeBusy;
}





- (NSNumber *)minsOffsetFromUTC
{
    return [NSNumber numberWithInteger:-defaulTimeZone.secondsFromGMT/60];
}

- (t_SerializableTimeZoneTime *)timeZoneTimeForDate:(NSDate *)date
{
    t_SerializableTimeZoneTime *timeZoneTime = [[t_SerializableTimeZoneTime alloc] init];
    
    NSDateComponents *currentComponet;
    if (date != nil)
    {
        currentComponet = [self componentsOfDate:date];
    }
    
    timeZoneTime.Bias = [NSNumber numberWithInteger:0]; //Check this in internet
    timeZoneTime.Time = [[self hhmmssFormatter] stringFromDate:[NSDate date]];
    timeZoneTime.DayOrder = [NSNumber numberWithInteger:currentComponet.weekOfMonth];
    timeZoneTime.Month = [NSNumber numberWithInteger:currentComponet.month];
    timeZoneTime.DayOfWeek = [self dayOfWeekForDate:date]?:t_DayOfWeekType_Sunday;
    //    timeZoneTime.Year = [NSString stringWithFormat:@"%li", (long)currentComponet.year];
    
    return timeZoneTime;
}

- (NSDateFormatter *)hhmmssFormatter
{
    [dateFormatter setDateFormat:@"hh:mm:ss"];
    return dateFormatter;
}

- (NSDateComponents *)componentsOfDate:(NSDate *)date
{
    unsigned componentReqirement = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour |  NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday;
    
    NSDateComponents *components = [gregorianCalender components:componentReqirement fromDate:date];
    return components;
}

- (t_DayOfWeekTypeEnum)dayOfWeekForDate:(NSDate *)date
{
//    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    dateFormatter.dateFormat = @"EEEE";
    NSString * dayString = [[dateFormatter stringFromDate:date] capitalizedString];
    
    return [t_DayOfWeekType valueFromString:dayString];
}

- (t_BodyType *)bodyForValue:(NSString *)bodyString
{
    if (bodyString == nil)
    {
        return nil;
    }
    t_BodyType *body = [[t_BodyType alloc] init];
    body._content = bodyString;
    body.BodyType = t_BodyTypeType_Text;
    
    return body;
}

- (NSArray *)attendeesForMailIDs:(NSArray *)mailIDs
{
    if (mailIDs.count == 0 | mailIDs == nil)
    {
        return nil;
    }
    
    NSMutableArray *array = [[NSMutableArray alloc] init];

    for (NSString *aMailID in mailIDs)
    {
        t_EmailAddressType *emailID = [[t_EmailAddressType alloc] init];
        emailID.EmailAddress = aMailID;
        
        t_AttendeeType *attendee = [[t_AttendeeType alloc] init];
        attendee.Mailbox = emailID;
        
        [array addObject:attendee];
    }
    
    return array;
}

@end
