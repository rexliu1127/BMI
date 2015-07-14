//
//  CaculatorBrain.m
//  BMI
//
//  Created by Rex Liu on 2014/2/26.
//  Copyright (c) 2014年 Rex Liu. All rights reserved.
//

#import "CaculatorBrain.h"

@interface CaculatorBrain()
@property (nonatomic,strong)NSMutableArray *operandStack;

@end

@implementation CaculatorBrain
@synthesize operandStack = _operandStack;


-(NSMutableArray *)operandStack
{
    if(_operandStack==nil)
    {
        _operandStack =[[NSMutableArray alloc]init];
        return _operandStack;
    }
    return _operandStack;
}
//-(void)setOperandStack:(NSMutableArray *)operandStack
//{
//    _operandStack=operandStack;
//}

-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}
-(double)performOperation:(NSString *)operation
{
    double result=0;
    
    //caculate result
    
    if([operation isEqualToString:@"+"])
    {
        result=[self popOperand] + [self popOperand];
    }
    else if ([@"*" isEqualToString:operation])
    {
        result=[self popOperand] * [self popOperand];
    }
    else if ([@"-" isEqualToString:operation])
    {
        result=[self popOperand]-[self popOperand];
    }
    else if([@"/" isEqualToString:operation])
    {
        result=[self popOperand]/[self popOperand];
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
