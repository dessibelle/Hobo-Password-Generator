//
//  NSCharacterSet+Options.h
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-06.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum {
	NSCharacterSetOptionNone = 0,
	NSCharacterSetOptionUppercase = 1,
	NSCharacterSetOptionLowercase = 2,
	NSCharacterSetOptionDecimalDigits = 4,
	NSCharacterSetOptionSymbols = 8,
	NSCharacterSetOptionPunctuation = 16,
	NSCharacterSetOptionPasswordSymbols = 32,
	NSCharacterSetOptionAll = (NSCharacterSetOptionUppercase|NSCharacterSetOptionLowercase|NSCharacterSetOptionDecimalDigits|NSCharacterSetOptionSymbols|NSCharacterSetOptionPunctuation),
	
} NSCharacterSetOption;

@interface NSCharacterSet (Options)

+ (NSCharacterSet *)characterSetWithOptions:(NSCharacterSetOption)options;
+ (NSCharacterSet *)passwordSymbolsCharacterSet;

@end
