//
//  UserInfo.h
//  SimplicITy
//
//  Created by Varghese Simon on 1/19/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import <Foundation/Foundation.h>
//[NSString stringWithFormat:@"%@%@",self.iTSM_LDAP_BaseURL,]


@interface UserInfo : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *fullName;

@property (strong, nonatomic) NSString *cropID;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *emailIDValue;

@property (strong, nonatomic) NSString *serialNo;

@property (strong, nonatomic) NSArray *tags;
@property (strong, nonatomic) NSString *alias;

@property (strong, nonatomic) NSString *oKToUpdate;
@property (strong, nonatomic) NSString *iTSM_LDAP_BaseURL;
@property (strong, nonatomic) NSString *applicationBaseURL;
@property (strong, nonatomic) NSString *appStoreURL;


+ (instancetype)sharedUserInfo;
- (NSDictionary *)getServerConfig;

@end
