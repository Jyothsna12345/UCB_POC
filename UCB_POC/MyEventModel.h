//
//  MyEventModel.h
//  UCB_POC
//
//  Created by Saurabh on 8/10/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyEventModel : NSObject

@property(nonatomic,strong)NSDate *startTime;
@property(nonatomic,strong)NSDate *endTime;
@property(nonatomic,strong)NSString *location;
@property(nonatomic,strong)NSString *meetingDetails;
@property(nonatomic,strong)NSString *meetingTitle;
@property(nonatomic,strong)NSMutableArray *conflictMeeting;

@end
