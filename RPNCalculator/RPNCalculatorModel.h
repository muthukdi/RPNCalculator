//
//  RPNCalculatorModel.h
//  RPNCalculator
//
//  Created by PointerWare Laptop 4 on 12-02-25.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPNCalculatorModel : NSObject

@property (nonatomic, strong) NSMutableArray *numberStack;
@property (nonatomic) int result;

- (NSMutableArray *)numberStack;
- (void)placeNumberOnStack:(int)number;
- (int)add;
- (int)subtract;
- (int)multiply;
- (int)divide;

@end
