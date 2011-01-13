//
//  HCPasswordGenerator.m
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-05.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "HCPasswordGenerator.h"

static HCPasswordGenerator *gSharedGenerator = nil;

@implementation HCPasswordGenerator

+ (HCPasswordGenerator *)sharedGenerator
{
	if (!gSharedGenerator)
		gSharedGenerator = [[self allocWithZone:nil] init];
	
	return gSharedGenerator;
}

- (id)init
{
	if (self = [super init])
	{
		srand( time(NULL) );
	}
	
	return self;
}


- (unichar)randomCharacter
{
	return rand() % (126 - 33) + 33;
}

+ (NSString *)passwordWithLength:(NSUInteger)length characterSet:(NSCharacterSet *)set
{
	if ( !set )
		return nil;
	
	NSMutableString *password = [NSMutableString stringWithCapacity:length];
	
	while ( [password length] < length )
	{
		unichar digit = [[HCPasswordGenerator sharedGenerator] randomCharacter];
		
		// [password deleteCharactersInRange:range];
		if ( [set characterIsMember:digit] )
		{
			[password appendFormat:@"%C", digit];
		}
	}
	
	return [NSString stringWithString:password];
}

@end
