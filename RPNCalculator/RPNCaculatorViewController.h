//
//  RPNCaculatorViewController.h
//  RPNCalculator
//
//  Created by Dilip Muthukrishnan on 12-02-23.
//  Copyright (c) 2012 PointerWare Innovations Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPNCalculatorModel.h"

@interface RPNCaculatorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;
@property (nonatomic) BOOL userIsInTheMiddleOfInput;
@property (strong, nonatomic) RPNCalculatorModel *model;
@property (weak, nonatomic) IBOutlet UILabel *memoryBox;

- (IBAction)operandPressed:(UIButton *)sender;
- (IBAction)operatorPressed:(UIButton *)sender;
- (IBAction)enterPressed;
- (IBAction)clearPressed;
- (void)updateMemoryBox;


@end
