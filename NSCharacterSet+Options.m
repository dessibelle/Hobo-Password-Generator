//
//  NSCharacterSet+Options.m
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-06.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "NSCharacterSet+Options.h"


@implementation NSCharacterSet (Options)

+ (NSCharacterSet *)characterSetWithOptions:(NSCharacterSetOption)option
{
	BOOL uppercase = option & NSCharacterSetOptionUppercase;
	BOOL lowercase = option & NSCharacterSetOptionLowercase;
	BOOL decimalDigits = option & NSCharacterSetOptionDecimalDigits;
	BOOL symbols = option & NSCharacterSetOptionSymbols;
	BOOL punctuation = option & NSCharacterSetOptionPunctuation;
	BOOL passwordSymbols = option & NSCharacterSetOptionPasswordSymbols;
	
	if ( option == NSCharacterSetOptionNone )
		return nil;
	
	NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
	
	if ( uppercase )
		[set formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];
	
	if ( lowercase )
		[set formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]]; 
	
	if ( decimalDigits )
		[set formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
	
	if ( symbols )
		[set formUnionWithCharacterSet:[NSCharacterSet symbolCharacterSet]];
	
	if ( punctuation )
		[set formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
	
	if ( passwordSymbols )
		[set formUnionWithCharacterSet:[NSCharacterSet passwordSymbolsCharacterSet]];	

	return [set autorelease];
}

+ (NSCharacterSet *)passwordSymbolsCharacterSet
{
	NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
	[set addCharactersInString:@"!?*+-$=@#_%&\"^.()[]"];
	return [set autorelease];
}

@end
