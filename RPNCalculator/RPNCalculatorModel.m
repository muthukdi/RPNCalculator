//
//  RPNCalculatorModel.m
//  RPNCalculator
//
//  Created by PointerWare Laptop 4 on 12-02-25.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RPNCalculatorModel.h"

@implementation RPNCalculatorModel

@synthesize numberStack = _numberStack;
@synthesize result = _result;

// This getter guards against nil reference.
- (NSMutableArray *)numberStack
{
    if (_numberStack != nil)
        return _numberStack;
    else
    {
        _numberStack = [[NSMutableArray alloc] init];
        return _numberStack;
    }
}
- (void)placeNumberOnStack:(int)number
{
    NSNumber *numberObject = [[NSNumber alloc] initWithInt:number];
    [self.numberStack addObject:numberObject];
}
- (int)add
{
    NSNumber *operand1 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    NSNumber *operand2 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    self.result = [operand1 intValue] + [operand2 intValue];
    [self placeNumberOnStack:self.result];
    return self.result;
}
- (int)subtract
{
    NSNumber *operand1 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    NSNumber *operand2 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    self.result = [operand1 intValue] - [operand2 intValue];
    [self placeNumberOnStack:self.result];
    return self.result;
}
- (int)multiply
{
    NSNumber *operand1 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    NSNumber *operand2 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    self.result = [operand1 intValue] * [operand2 intValue];
    [self placeNumberOnStack:self.result];
    return self.result;
}
- (int)divide
{
    NSNumber *operand1 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    NSNumber *operand2 = [self.numberStack lastObject];
    [self.numberStack removeLastObject];
    self.result = [operand1 intValue] / [operand2 intValue];
    [self placeNumberOnStack:self.result];
    return self.result;
}

@end
