//
//  UIView+AdjustLayoutWithKeyboard.m
//  SWTextField_TextView
//
//  Created by 石文文 on 16/7/9.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "UIView+AdjustLayoutWithKeyboard.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KEYBOARD_OFFSET 5 //键盘与输入框的间隙
@implementation UIView (AdjustLayoutWithKeyboard)
-(void)openAdjustLayoutWithKeyboard{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(autoAdjustLayout:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(autoAdjustLayout:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(autoAdjustLayout:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}

-(void)closeAdjustLayoutWithKeyboard{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


/**
 *  调整布局
 */
- (void)autoAdjustLayout:(NSNotification *)notification{
    
    UIView *responder =  [[UIApplication sharedApplication].keyWindow performSelector:@selector(firstResponder)];
    
    if (!([responder isKindOfClass:[UITextField class]]||[responder isKindOfClass:[UITextView class]])) {
        
    //如果第一响应者不是输入框
        
        return;
    }
    
    
    
    //如果键盘将要出现 但是transform.ty已经有过偏移 先恢复
    if ([notification.name isEqualToString:UIKeyboardWillShowNotification]&&self.transform.ty != 0) {
        self.transform = CGAffineTransformIdentity;
    }
    
    //键盘大小 高度
    CGRect frame = CGRectMake(0, 0, 0, 216);
    if (notification.userInfo[UIKeyboardFrameEndUserInfoKey]) {
        
        frame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        
    }
    CGFloat height = frame.size.height;
    
    //获取键盘动画时间
    CGFloat duration = 0.25;
    if ([notification.userInfo
         objectForKey:UIKeyboardAnimationDurationUserInfoKey]) {
        duration = [[notification.userInfo
                     objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    }
    
    //获取键盘通动画类型
    NSInteger option = 0;
    if ([notification.userInfo
         objectForKey:UIKeyboardAnimationCurveUserInfoKey]) {
        option = [[notification.userInfo
                   objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
        
    }
    //获取当前输入框相对于window的frame
    CGRect frameBaseOnWindow = [responder.superview convertRect:responder.frame toView:[UIApplication sharedApplication].keyWindow];
    
    //根据键盘调整变形
    [UIView animateKeyframesWithDuration:duration delay:0 options:option animations:^{
        
        if ([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
            
            self.transform = CGAffineTransformIdentity;
            
        }else if(frame.origin.y < SCREEN_HEIGHT){
            
            if (frameBaseOnWindow.origin.y + frameBaseOnWindow.size.height > SCREEN_HEIGHT - height ) {
                
                
                self.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -(frameBaseOnWindow.origin.y + frameBaseOnWindow.size.height - SCREEN_HEIGHT + height)-KEYBOARD_OFFSET);
                
                
            }
            
        }
        
        
        
    } completion:NULL];
    
    
    
    
}

@end
