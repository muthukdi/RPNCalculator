//
//  RPNCaculatorViewController.m
//  RPNCalculator
//
//  Created by Dilip Muthukrishnan on 12-02-23.
//  Copyright (c) 2012 PointerWare Innovations Ltd. All rights reserved.
//

#import "RPNCaculatorViewController.h"

@implementation RPNCaculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfInput = _userIsInTheMiddleOfInput;
@synthesize model = _model;
@synthesize memoryBox = _memoryBox;

// This getter guards against nil reference.
- (RPNCalculatorModel *)model
{
    if (_model != nil)
        return _model;
    else
    {
        _model = [[RPNCalculatorModel alloc] init];
        return _model;
    }
}
- (IBAction)operandPressed:(UIButton *)sender
{
    NSString *operand = sender.currentTitle;
    
    if (self.userIsInTheMiddleOfInput) {
        self.display.text =  [self.display.text stringByAppendingString:operand];
    }
    else {
        self.display.text = operand;
        self.userIsInTheMiddleOfInput = YES;
    }
}
- (IBAction)operatorPressed:(UIButton *)sender
{
    int result;
    if ([sender.currentTitle isEqualToString:@"+"])
        result = [self.model add];
    else if ([sender.currentTitle isEqualToString:@"-"])
        result = [self.model subtract];
    else if ([sender.currentTitle isEqualToString:@"*"])
        result = [self.model multiply];
    else if ([sender.currentTitle isEqualToString:@"/"])
        result = [self.model divide];
    self.display.text = [NSString stringWithFormat:@"%i", result];
    [self updateMemoryBox];
    self.userIsInTheMiddleOfInput = NO;
}
- (IBAction)enterPressed
{
    [self.model placeNumberOnStack:[self.display.text intValue]];
    [self updateMemoryBox];
    self.userIsInTheMiddleOfInput = NO;
}

- (IBAction)clearPressed
{
    self.display.text = @"0";
    [self.model.numberStack removeAllObjects];
    [self updateMemoryBox];
    self.userIsInTheMiddleOfInput = NO;
}
- (void)updateMemoryBox
{
    self.memoryBox.text = @"";
    // Using fast enumeration version of for loop
    for (NSNumber *numberObject in self.model.numberStack)
    {
        int number = [numberObject intValue];
        self.memoryBox.text = [self.memoryBox.text stringByAppendingFormat:@"%i ",number];
    }
}

@end
