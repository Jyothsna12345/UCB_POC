//
//  PasswordManager.h
//  SimplicITy
//
//  Created by Varghese Simon on 4/8/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PasswordManager;

@protocol PasswordManagerDelegate <NSObject>

- (void)passwordManagerGotPassword:(PasswordManager *)manager;
- (void)passwordManagerFailedToGetPassoword:(PasswordManager *)manager;

@end

@interface PasswordManager : NSObject

@property (weak, nonatomic) id<PasswordManagerDelegate> delegate;

- (NSString *)passwordForUser;
- (void)showAlertForPasswordWithMessage:(NSString *)message;
- (void)showAlertWithDefaultMessage;

@end
