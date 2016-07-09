//
//  UIViewDemoController.m
//  SWTextField_TextView
//
//  Created by 石文文 on 16/7/9.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "UIViewDemoController.h"
#import "UIView+AdjustLayoutWithKeyboard.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@implementation UIViewDemoController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view insertSubview:view atIndex:0];
    view.backgroundColor = [UIColor whiteColor];
    
    [view openAdjustLayoutWithKeyboard]; //开启自动调整
    
    CGFloat top = 50;
    for (int i =0 ; i< 6; i++) {
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(50, top +((SCREEN_HEIGHT-100 - 5*20)/6+10)*i, SCREEN_WIDTH - 100, (SCREEN_HEIGHT-100-5*20)/6)];
    
        textField.placeholder = @"请输入";
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [view addSubview:textField];
    
        
    }
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
