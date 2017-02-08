//
//  DateConverter.h
//  ExchangeWebServiceApp
//
//  Created by Varghese Simon on 3/19/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExchangeWebService.h"

@interface ESWPropertyCreater : NSObject

- (t_SerializableTimeZone *)timeZone;
- (NSArray *)mailBoxArrayWithEmailIDS:(NSArray *)mailIDS;
- (t_FreeBusyViewOptionsType *)freeBusyViewOptionsWith:(NSDate *)startDate andEndsAt:(NSDate *)endDate;

- (t_BodyType *)bodyForValue:(NSString *)bodyString;
- (NSArray *)attendeesForMailIDs:(NSArray *)mailIDs;
@end
