//
//  SWTextField.m
//  SWTextField
//
//  Created by 石文文 on 16/7/9.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "SWTextField.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KEYBOARD_OFFSET 5 //键盘与输入框的间隙
@implementation SWTextField



-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
-(void)setAutoAdjustLayoutView:(UIView *)autoAdjustLayoutView{
    
    _autoAdjustLayoutView = autoAdjustLayoutView;
    
    if (_autoAdjustLayoutView) {
       
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(autoAdjustLayout:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(autoAdjustLayout:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(autoAdjustLayout:) name:UIKeyboardDidChangeFrameNotification object:nil];
        
    }else{
        [[NSNotificationCenter defaultCenter]removeObserver:self];
    }
    
}
/**
 *  调整布局
 */
- (void)autoAdjustLayout:(NSNotification *)notification{
   
    UIResponder *responder =  [[UIApplication sharedApplication].keyWindow performSelector:@selector(firstResponder)];
    
    
    
    if (![responder isEqual:self]) {
        
        //当前第一响应者不是自己 不处理
        
        return;
    }
    
    
    //如果键盘将要出现 但是transform.ty已经有过偏移 先恢复
    if ([notification.name isEqualToString:UIKeyboardWillShowNotification]&&self.autoAdjustLayoutView.transform.ty != 0) {
        self.autoAdjustLayoutView.transform = CGAffineTransformIdentity;
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
    CGRect frameBaseOnWindow = [self.superview convertRect:self.frame toView:[UIApplication sharedApplication].keyWindow];
    
    
    
    
    //根据键盘调整变形
    [UIView animateKeyframesWithDuration:duration delay:0 options:option animations:^{
        
        if ([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
            
            self.autoAdjustLayoutView.transform = CGAffineTransformIdentity;
            
        }else if(frame.origin.y < SCREEN_HEIGHT){
            
            if (frameBaseOnWindow.origin.y + frameBaseOnWindow.size.height > SCREEN_HEIGHT - height ) {
       
              
                self.autoAdjustLayoutView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -(frameBaseOnWindow.origin.y + frameBaseOnWindow.size.height - SCREEN_HEIGHT + height)-KEYBOARD_OFFSET);
                
                
            }
            
        }
        
        
        
    } completion:NULL];
    
    
    
    
}

@end
