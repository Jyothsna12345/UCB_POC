//
//  ContactDetails.h
//  SimplicITy
//
//  Created by Varghese Simon on 4/10/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactDetails : NSObject

@property (strong, nonatomic) NSString *nameOfContact;
@property (strong, nonatomic) NSString *emailIDOfContact;

@property (strong, nonatomic) NSString *displayName;

@property (assign, nonatomic) BOOL isChecked;
@property (assign, nonatomic) BOOL isAvailable;

@end
