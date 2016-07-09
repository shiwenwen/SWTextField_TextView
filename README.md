# SWTextField_TextView
视图随键盘自动调整的简单框架，小巧易用
======================
输入框随键盘自动调整框架,简单好用。支持TextField和TextView。提供两个子类，或者直接使用对UIView的延展，使view可以根据
---------------------------------
使用发发：
1.使用SWTextField
  - (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view insertSubview:view atIndex:0];
    view.backgroundColor = [UIColor whiteColor];
    CGFloat top = 50;
    for (int i =0 ; i< 6; i++) {
        
        SWTextField *textField = [[SWTextField alloc]initWithFrame:CGRectMake(50, top +((SCREEN_HEIGHT-100 - 5*20)/6+10)*i, SCREEN_WIDTH - 100, (SCREEN_HEIGHT-100-5*20)/6)];
        textField.placeholder = @"请输入";
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [view addSubview:textField];
        textField.autoAdjustLayoutView = view;//设置需要调整的视图
    }
    
    
    
}


2.使用SWTextView
    SWTextView继承UITextView，设置其autoAdjustLayoutView属性 传入一个需要根据当前输入框所弹出的键盘而自动调整合适位置的视图，例如当前输入框的父视图或者更高级别的视图 如控制器的根视图self.view ，设置为为空时取消调整。
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
        textField.autoAdjustLayoutView = view;//设置需要调整的视图
    }
    
    
    
}

3.使用UIView+AdjustLayoutWithKeyboard
    UIView+AdjustLayoutWithKeyboard是对UIView的一个延展，提供两个方法，如果某个视图上有多个输入框，视图需要根据输入框键盘调整相应位置，你可以不需要使用SWTextField或者SWTextView对输入框一个个设置autoAdjustLayoutView，直接使用openAdjustLayoutWithKeyboard方法即可让当前视图开启随键盘自动调整
    如果不需要调整了，可以通过closeAdjustLayoutWithKeyboard方法关闭自动调整。
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
具体效果看Demo
===============
