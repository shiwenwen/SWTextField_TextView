//
//  SWTextView.h
//  SWTextField
//
//  Created by 石文文 on 16/7/9.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SWTextView : UITextView
/**
 *  需要根据键盘自动调整位置布局的视图 通常为父视图或者更高级别的视图 如控制器的根视图self.view 为空时取消调整
 */
@property (nonatomic,strong)UIView *autoAdjustLayoutView;
@end
