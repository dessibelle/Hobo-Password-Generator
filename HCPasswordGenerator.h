//
//  HCPasswordGenerator.h
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-05.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface HCPasswordGenerator : NSObject {

}

+ (NSString *)passwordWithLength:(NSUInteger)length characterSet:(NSCharacterSet *)set;
+ (HCPasswordGenerator *)sharedGenerator;
- (unichar)randomCharacter;

@end
