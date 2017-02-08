//
//  RoomModel.m
//  SimplicITy
//
//  Created by Varghese Simon on 3/25/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import "RoomModel.h"

@implementation RoomModel

- (instancetype)init
{
    if (self = [super init])
    {
        //RSSI value is negative. So instead of zero value, we have to give NSIntegerMin
        self.RSSIValue = NSIntegerMin;
    }
    
    return self;
}

@end
