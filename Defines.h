/*
 *  Defines.h
 *  PasswordGenerator
 *
 *  Created by Simon Fransson on 2010-11-05.
 *  Copyright 2010 Hobo Code. All rights reserved.
 *
 */

#import "NSCharacterSet+Options.h"

#define PG_PREFS_KEY_PASSWORD_LENGTH		@"PasswordLength"
#define PG_PREFS_KEY_PASSWORD_COUNT			@"PasswordCount"
#define PG_PREFS_KEY_INCLUDE_UPPERCASE		@"IncludeUppercaseLetters"
#define PG_PREFS_KEY_INCLUDE_LOWERCASE		@"IncludeLowercaseLetters"
#define PG_PREFS_KEY_INCLUDE_NUMBERS		@"IncludeNumbers"
#define PG_PREFS_KEY_INCLUDE_SYMBOLS		@"IncludeSymbols"

#define PG_MIN_PASSWORD_LENGTH				1
#define PG_MAX_PASSWORD_LENGTH				10000
#define PG_MIN_PASSWORD_COUNT				PG_MIN_PASSWORD_LENGTH
#define PG_MAX_PASSWORD_COUNT				PG_MAX_PASSWORD_LENGTH
