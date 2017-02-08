//
//  CalendarEvent.h
//  SimplicITy
//
//  Created by Varghese Simon on 4/7/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarEvent : NSObject

@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSArray *resources;//emailIDs
@property (strong, nonatomic) NSArray *requiredAttendees; //emailIDs

@end
