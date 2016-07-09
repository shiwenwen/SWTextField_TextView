//
//  UIView+AdjustLayoutWithKeyboard.h
//  SWTextField_TextView
//
//  Created by 石文文 on 16/7/9.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AdjustLayoutWithKeyboard)
/**
 *  开启视图随着键盘调整
 */
-(void)openAdjustLayoutWithKeyboard;
/**
 *  关闭视图随着键盘调整
 */
-(void)closeAdjustLayoutWithKeyboard;
@end
