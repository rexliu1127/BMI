//
//  rexViewController.h
//  BMI
//
//  Created by Rex Liu on 2014/2/13.
//  Copyright (c) 2014年 Rex Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rexViewController : UIViewController
{
    IBOutlet UITextField *body_height;
    IBOutlet UITextField *body_weight;
    IBOutlet UILabel *result;
    IBOutlet UITextField *board;
}

@property (nonatomic, retain) IBOutlet UITextField *body_height;
@property (nonatomic, retain) IBOutlet UITextField *body_weight;
@property (nonatomic, retain) IBOutlet UITextField *board;
@property (nonatomic, retain) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UILabel *display;

-(IBAction) calcBMI: (id) sender;
-(IBAction) keyboardDismiss: (id) sender;
-(IBAction) displayNum: (id) sender;
-(IBAction) clearBoard:(id)sender;
-(IBAction) backspace:(id)sender;
//- (NSNumber *)getADD;
//- (NSString *)functionName:(int)param;
+ (NSString *)foo;
+(double) add:(double)a1 :(double)a2;
+(double) minus:(double)a1 :(double)a2;
+(double) times:(double)a1 :(double)a2;
+(double) div:(double)a1 :(double)a2;
//+(double) test:(double)a1 :(double)a2;


@end
