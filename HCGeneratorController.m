//
//  HCGeneratorController.m
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-05.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "HCGeneratorController.h"
#import "HCPasswordGenerator.h"
#import "HCSettingsManager.h"

@implementation HCGeneratorController

@synthesize count = _count,
length = _length,
uppercase = _uppercase,
lowercase = _lowercase,
numbers = _numbers,
symbols = _symbols,
passwords = _passwords,
tableView = _tableView,
countField = _countField,
lengthField = _lengthField,
countStepper = _countStepper,
lengthStepper = _lengthStepper;

@dynamic result;

- (NSArray *)result
{
	[self updateUI];
	
	return self.passwords;
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
	NSSet *set = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ( [key isEqual:@"result"] )
		set = [set setByAddingObjectsFromSet:[NSSet setWithObjects:@"count", @"length", @"uppercase", @"lowercase", @"numbers", @"symbols", nil]];
	
	return set;
}

- (void)setup
{
	HCSettingsManager *sm = [HCSettingsManager sharedManager];
	
	self.length = [sm integerForKey:PG_PREFS_KEY_PASSWORD_LENGTH];
	self.count = [sm integerForKey:PG_PREFS_KEY_PASSWORD_COUNT];
	self.uppercase = [sm boolForKey:PG_PREFS_KEY_INCLUDE_UPPERCASE];
	self.lowercase = [sm boolForKey:PG_PREFS_KEY_INCLUDE_LOWERCASE];
	self.numbers = [sm boolForKey:PG_PREFS_KEY_INCLUDE_NUMBERS];
	self.symbols = [sm boolForKey:PG_PREFS_KEY_INCLUDE_SYMBOLS];
	
	self.passwords = [NSArray array];
	
	[self generatePasswords];
}

- (void)awakeFromNib
{
	[self.tableView setDelegate:self];
	
	[_countField setDelegate:self];
	[_lengthField setDelegate:self];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ( self = [super initWithCoder:(NSCoder *)aDecoder] )
	{
		[self setup];
	}
	
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ( self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] )
	{
		[self setup];
	}
	
	return self;
}


- (NSCharacterSetOption)carachterSetOptions
{
	NSCharacterSetOption options = NSCharacterSetOptionNone;
	
	if ( self.lowercase )
		options |= NSCharacterSetOptionLowercase;
	
	if ( self.uppercase )
		options |= NSCharacterSetOptionUppercase;
	
	if ( self.numbers )
		options |= NSCharacterSetOptionDecimalDigits;
	
	if ( self.symbols )
		options |= (NSCharacterSetOptionPasswordSymbols);
	
	return options;	
}

- (IBAction)refresh:(id)sender
{
	[self willChangeValueForKey:@"result"];
	[self didChangeValueForKey:@"result"];
}

- (IBAction)exportXML:(id)sender
{
	
}

- (IBAction)exportText:(id)sender
{
	
}

- (void)setPrefs
{
	HCSettingsManager *sm = [HCSettingsManager sharedManager];
	
	[sm setInteger:self.count forKey:PG_PREFS_KEY_PASSWORD_COUNT];
	[sm setInteger:self.length forKey:PG_PREFS_KEY_PASSWORD_LENGTH];
	[sm setInteger:self.uppercase forKey:PG_PREFS_KEY_INCLUDE_UPPERCASE];
	[sm setInteger:self.lowercase forKey:PG_PREFS_KEY_INCLUDE_LOWERCASE];
	[sm setInteger:self.numbers forKey:PG_PREFS_KEY_INCLUDE_NUMBERS];
	[sm setInteger:self.symbols forKey:PG_PREFS_KEY_INCLUDE_SYMBOLS];	
}

- (void)updateUI
{
	[self setPrefs];
	[self.tableView deselectAll:self];
	[self generatePasswords];
}

- (void)generatePasswords
{
	NSCharacterSet *set = [NSCharacterSet characterSetWithOptions:[self carachterSetOptions]];
	NSMutableArray *passwords = [NSMutableArray array];
	
	for (int i = 0; i < _count; i++)
	{
		[passwords addObject:[HCPasswordGenerator passwordWithLength:self.length characterSet:set]];
	}
	
	self.passwords = [NSArray arrayWithArray:passwords];
}

- (void)dealloc
{
	self.passwords = nil;
	
	[super dealloc];
}

- (NSInteger)minCount
{
	return PG_MIN_PASSWORD_COUNT;
}

- (NSInteger)maxCount
{
	return PG_MAX_PASSWORD_COUNT;
}

- (NSInteger)minLength
{
	return PG_MIN_PASSWORD_LENGTH;
}

- (NSInteger)maxLength
{
	return PG_MAX_PASSWORD_LENGTH;
}

#pragma mark NSTableViewDelegate methods

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
	NSIndexSet *indexes = [self.tableView selectedRowIndexes];
	
	if ( [indexes count] )
	{
		NSArray *selection = [self.passwords objectsAtIndexes:indexes];
		
		NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
		
		NSArray *typeArray = [NSArray arrayWithObject:NSStringPboardType];
		
		[pasteboard declareTypes:typeArray owner:nil];
		[pasteboard writeObjects:selection];
	}
}

#pragma mark NSTextFieldDelegate methods

- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)command
{
	BOOL decrease = command == @selector(moveDown:);
	BOOL increase = command == @selector(moveUp:);
	
	if ( !increase && !decrease )
		return NO;
	
	short increment = increase ? 1 : -1;
	
	if ( control == self.countField )
	{
		self.count += increment;
		return YES;
	} else if ( control = self.lengthField )
	{
		self.length += increment;
		return YES;
	}
	
	return NO;
}

@end
