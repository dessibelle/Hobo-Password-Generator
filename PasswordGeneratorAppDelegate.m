//
//  PasswordGeneratorAppDelegate.m
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-05.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "PasswordGeneratorAppDelegate.h"

#import "HCPasswordGenerator.h"
#import "HCSettingsManager.h"

@implementation PasswordGeneratorAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
	[[HCSettingsManager sharedManager] storeDefaults];
}

@end
