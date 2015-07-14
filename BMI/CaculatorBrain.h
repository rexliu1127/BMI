//
//  CaculatorBrain.h
//  BMI
//
//  Created by Rex Liu on 2014/2/26.
//  Copyright (c) 2014年 Rex Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorBrain : NSObject

-(void)pushOperand:(double)operand;

-(double)performOperation:(NSString *)operation;

@end
