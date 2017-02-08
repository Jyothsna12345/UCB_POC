//
//  MyEventModel.m
//  UCB_POC
//
//  Created by Saurabh on 8/10/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "MyEventModel.h"

@implementation MyEventModel

- (NSMutableArray *)conflictMeeting
{
    if (_conflictMeeting == nil) {
        _conflictMeeting = [[NSMutableArray alloc] init];
    }
    
    return _conflictMeeting;
}

@end
