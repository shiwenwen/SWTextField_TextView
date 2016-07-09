//
//  TextViewDemo.m
//  SWTextField_TextView
//
//  Created by 石文文 on 16/7/9.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "TextViewDemo.h"
#import "SWTextView.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@implementation TextViewDemo
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view insertSubview:view atIndex:0];
    view.backgroundColor = [UIColor whiteColor];
    CGFloat top = 50;
    for (int i =0 ; i< 6; i++) {
        
        SWTextView *textField = [[SWTextView alloc]initWithFrame:CGRectMake(50, top +((SCREEN_HEIGHT-100 - 5*20)/6+10)*i, SCREEN_WIDTH - 100, (SCREEN_HEIGHT-100-5*20)/6)];
        
        textField.layer.cornerRadius = 5;
        textField.layer.borderColor = [UIColor grayColor].CGColor;
        textField.layer.borderWidth = 1;
        [view addSubview:textField];
        textField.autoAdjustLayoutView = view;
    }
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
