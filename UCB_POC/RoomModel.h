//
//  RoomModel.h
//  SimplicITy
//
//  Created by Varghese Simon on 3/25/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExchangeWebService.h"

@interface RoomModel : NSObject

@property (strong, nonatomic) NSString *nameOfRoom;
@property (strong, nonatomic) NSString *emailIDOfRoom;
@property (strong, nonatomic) t_EmailAddressType *emailIDEWS;

@property (strong, nonatomic) NSString *gimbalID;
@property (assign, nonatomic) NSInteger RSSIValue; //RSSI value is negative. So instead of zero value, we have to give NSIntegerMin
@property (strong, nonatomic) NSString *beaconID;
@property (assign, nonatomic) NSInteger majorID;
@property (assign, nonatomic) NSInteger minorID;

@property (assign, nonatomic) BOOL updating;

@end
