//
//  PasswordGeneratorAppDelegate.h
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-05.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PasswordGeneratorAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
