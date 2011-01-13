//
//  HCSettingsManager.m
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-08.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "HCSettingsManager.h"

static HCSettingsManager *gSharedManager = nil;

@implementation HCSettingsManager

@synthesize defaults = _defaults;

- (id)init
{
	if ( self = [super init] )
	{
		_didLoadDefaults = NO;
		self.defaults = [NSUserDefaults standardUserDefaults];
		
		[self loadDefaults];
	}
	
	return self;
}

+ (HCSettingsManager *)sharedManager
{
	if ( !gSharedManager )
		gSharedManager = [[HCSettingsManager alloc] init];
	
	return gSharedManager;
}

- (void)loadDefaults
{
	if ( _didLoadDefaults )
		return;
	
	NSURL *defaultsURL = [[NSBundle mainBundle] URLForResource:@"Defaults" withExtension:@"plist"];
	NSDictionary *defaultsDict = [NSDictionary dictionaryWithContentsOfURL:defaultsURL];
	
	[self.defaults registerDefaults:defaultsDict];
	
	_didLoadDefaults = YES;
}

- (void)storeDefaults
{
	[self.defaults synchronize];
}

#pragma mark Acessors

- (NSInteger)integerForKey:(NSString *)key
{
	return [self.defaults integerForKey:key];
}

- (void)setInteger:(NSInteger)val forKey:(NSString *)key
{
	[self.defaults setInteger:val forKey:key];
}

- (BOOL)boolForKey:(NSString *)key
{
	return [self.defaults integerForKey:key];
}

- (void)setBool:(BOOL)val forKey:(NSString *)key
{
	[self.defaults setBool:val forKey:key];
}

@end
