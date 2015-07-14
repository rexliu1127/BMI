//
//  rexViewController.m
//  BMI
//
//  Created by Rex Liu on 2014/2/13.
//  Copyright (c) 2014年 Rex Liu. All rights reserved.
//

#import "rexViewController.h"
#import "CaculatorBrain.h"

@interface rexViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic,strong) CaculatorBrain *brain;
@end

@implementation rexViewController

@synthesize body_height;
@synthesize body_weight;
@synthesize board;
@synthesize result;
//@synthesize num;
//

-(IBAction) calcBMI: (id) sender
{
    // 取得身高數值，並換算成公尺
    float height = [[body_height text] floatValue] / 100;
    
    // 取得體重數值
    float weight = [[body_weight text] floatValue];
    
    // 顯示計算結果
    result.hidden = NO;
    result.text = [NSString stringWithFormat:@"您的BMI值是：%.2f", (weight / (height * height))];
    //result.text= @"hello";
}

// 把鍵盤退下去
-(IBAction) keyboardDismiss: (id) sender
{
    [sender resignFirstResponder];
}


// 輸入數字
-(IBAction) displayNum:(id)sender
{
    //NSstring txtnum= [num titleLabel]  ;
    //board.text= [NSString board text + [NSString sender title]];
    //board.text = txtnum;
    UIButton *resultButton = (UIButton *)sender;
    //board.text =  [NSString stringWithFormat:board.text,resultButton.currentTitle];
    //NSString *temp = [[NSString alloc] init];//[board.text copy];
    //NSLog(resultButton.currentTitle);
    //temp=board.text;
    //NSString temp=[alloc NSString]board.text;
    //board.text =  [NSString stringWithFormat: board.text, resultButton.currentTitle];
    //[board.text stringByAppendingString:resultButton.currentTitle];
    //NSNumber *a=getADD();
    //NSLog([getADD]);
    //NSLog(resultButton.currentTitle);
//    NSString *ab=[functionName @"x"];
//    NSLog(foo());
    double x=0;
    double y=0;
    double z=0;
    z=x+y;
    
    double i=[[self class] div:24 :4];
    
    z=z+i;
    
    NSString *f=[[self class] foo];
    
    NSString *string = [board.text stringByAppendingString:resultButton.currentTitle];
    string = [string stringByAppendingString:f];
    NSString *strValue;
    strValue=[NSString stringWithFormat:@"%f",z];
    string = [string stringByAppendingString:strValue];
    board.text = string;
    
}

-(IBAction)clearBoard:(id)sender
{
    board.text=@"";
}

-(IBAction)backspace:(id)sender
{
    NSString *string = board.text;
    NSUInteger length = [string length];
    length=length-1;
    board.text = [string substringToIndex:length];
}

-(void) viewDidLoad
{
    // 設定這兩個欄位的初始為數字及標點符號鍵盤
    [body_height setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [body_weight setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
}

//- (NSNumber *)getADD
//{
//    return 100;
//}

//- (NSString *)functionName:(int)param {
//    NSString *result = nil;
//    
//    switch (param) {
//        case 1:
//            result = [NSString stringWithString:@"x"];
//            break;
//        case 2:
//            result = [NSString stringWithString:@"y"];
//            break;
//        case 3:
//            result = [NSString stringWithString:@"z"];
//            break;
//        default:
//            result = [NSString stringWithString:@"defaultv"];
//            break;
//    }
//    
//    return result;
//}

+(NSString *)foo
{
    const char* yourString = "bar";
    NSString* yourNSString = [NSString stringWithFormat:@"%s", yourString];
    
    return yourNSString;
}

+(double) add:(double)a1 :(double)a2
{
    return a1+a2;
}
+(double) minus:(double)a1 :(double)a2
{
    return a1-a2;
}
+(double) times:(double)a1 :(double)a2
{
    return a1*a2;
}
+(double) div:(double)a1 :(double)a2
{
    return a1/a2;
}

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain=_brain;

-(CaculatorBrain *)brain
{
    if(!_brain)
    {
        _brain =[[CaculatorBrain alloc] init];
    }
    return _brain;

}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit= [sender currentTitle];
//    UILabel *myDisplay=self.display;
    //NSString *currentText=self.display.text;
    
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
//    [myDisplay setText:newText];
//    self.display.text=newText;
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;

}


- (IBAction)operationPressed:(UIButton *)sender {
    if(self.userIsInTheMiddleOfEnteringANumber)[self enterPressed];
    double res = [self.brain performOperation:sender.currentTitle];
    NSString *resultString=[NSString stringWithFormat:@"%g",res];
    self.display.text =resultString;
}

@end

