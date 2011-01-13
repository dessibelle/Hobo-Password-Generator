//
//  HCSettingsManager.h
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-08.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface HCSettingsManager : NSObject {

	BOOL _didLoadDefaults;
	NSUserDefaults *_defaults;
}

@property (retain) NSUserDefaults *defaults;

+ (HCSettingsManager *)sharedManager;
- (void)loadDefaults;
- (void)storeDefaults;

- (NSInteger)integerForKey:(NSString *)key;
- (void)setInteger:(NSInteger)val forKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (void)setBool:(BOOL)val forKey:(NSString *)key;

@end
