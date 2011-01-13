//
//  HCGeneratorController.h
//  PasswordGenerator
//
//  Created by Simon Fransson on 2010-11-05.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface HCGeneratorController : NSViewController <NSTableViewDelegate, NSTextFieldDelegate> {

	NSUInteger	_count;
	NSUInteger	_length;
	BOOL		_uppercase;
	BOOL		_lowercase;
	BOOL		_numbers;
	BOOL		_symbols;
	
	NSArray		*_passwords;
	
	NSTableView *_tableView;
	NSTextField *_countField, *_lengthField;
	NSStepper	*_countStepper, *_lengthStepper;
}

@property (assign) NSUInteger count;
@property (assign) NSUInteger length;
@property (assign) BOOL uppercase;
@property (assign) BOOL lowercase;
@property (assign) BOOL numbers;
@property (assign) BOOL symbols;
@property (retain) NSArray *passwords;
@property (readonly) NSArray *result;


@property (retain) IBOutlet NSTableView *tableView;

@property (retain) IBOutlet NSTextField *countField;
@property (retain) IBOutlet NSTextField *lengthField;
@property (retain) IBOutlet NSStepper *countStepper;
@property (retain) IBOutlet NSStepper *lengthStepper;

- (IBAction)refresh:(id)sender;
- (IBAction)exportXML:(id)sender;
- (IBAction)exportText:(id)sender;

- (void)updateUI;
- (void)generatePasswords;

@end
