//
//  PasswordManager.m
//  SimplicITy
//
//  Created by Varghese Simon on 4/8/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import "PasswordManager.h"
#import "Constant.h"

@interface PasswordManager ()

@end

@implementation PasswordManager
{
    //UIAlertView *passwordAlert;
}

- (instancetype)init
{
    if (self = [super init])
    {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localize) name:MCLocalizationLanguageDidChangeNotification object:nil];
        [self localize];
        
        
    }
    
    return self;
}


-(void)localize
{


}


- (NSString *)passwordForUser
{
    NSString *base64EncodedString = [[NSUserDefaults standardUserDefaults] objectForKey:EWS_USERS_PASSWORD];
    NSString *password;
    
    if (base64EncodedString)
    {
        NSData *passwordData = [[NSData alloc] initWithBase64EncodedString:base64EncodedString
                                                                   options:0];
        password = [[NSString alloc] initWithData:passwordData
                                                   encoding:NSUTF8StringEncoding];
    }

    return password;
}

- (void)showAlertForPasswordWithMessage:(NSString *)message
{
//    if (passwordAlert == nil)
//    {
//        passwordAlert = [[UIAlertView alloc] initWithTitle:STRING_FOR_LANGUAGE(@"Password.required")
//                                               message:message
//                                              delegate:self
//                                     cancelButtonTitle:STRING_FOR_LANGUAGE(@"Cancel")
//                                     otherButtonTitles:OK_FOR_ALERT, nil];
//        
//        passwordAlert.alertViewStyle = UIAlertViewStyleSecureTextInput;
//       [[passwordAlert textFieldAtIndex:0] setPlaceholder:STRING_FOR_LANGUAGE(@"Password")];
        
   // }
    
//    passwordAlert.message = message;
//    [passwordAlert show];
}
- (void)showAlertWithDefaultMessage
{
   // [self showAlertForPasswordWithMessage:STRING_FOR_LANGUAGE(@"Enter.Password")];
}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 1)
//    {
//        UITextField *passwordField = [alertView textFieldAtIndex:0];
//        NSString *password = passwordField.text;
//        NSData *passWordData = [password dataUsingEncoding:NSUTF8StringEncoding];
//        NSString *base64EncodedString = [passWordData base64EncodedStringWithOptions:0];
//        
//        NSLog(@"Encoded Password %@", base64EncodedString);
//
//        [[NSUserDefaults standardUserDefaults] setObject:base64EncodedString
//                                                  forKey:EWS_USERS_PASSWORD];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        
//        [self.delegate passwordManagerGotPassword:self];
//    }else
//    {
//        [self.delegate passwordManagerFailedToGetPassoword:self];
//    }
//}

@end
