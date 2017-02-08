//
//  NSDateFormatter+Locale.m
//  SimplicITy
//
//  Created by vmoksha mobility on 27/07/15.
//  Copyright (c) 2015 Vmoksha. All rights reserved.
//

#import "NSDateFormatter+Locale.h"

@implementation NSDateFormatter (Locale)

- (id)initWithSafeLocale {
    static NSLocale* en_US_POSIX = nil;
    self = [self init];
    if (en_US_POSIX == nil) {
        en_US_POSIX = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    }
    [self setLocale:en_US_POSIX];
    return self;
}

@end
