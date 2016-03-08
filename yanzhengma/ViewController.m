//
//  ViewController.m
//  yanzhengma
//
//  Created by qiu on 15/11/25.
//  Copyright © 2015年 qiu. All rights reserved.
//

#import "ViewController.h"
#import "PooCodeView.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) PooCodeView *codeView;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UITextField *textfield;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.codeView = [[PooCodeView alloc]initWithFrame:CGRectMake(100, 100, 200, 44)];
    self.codeView.backgroundColor  = [UIColor lightGrayColor];
    [self.view addSubview:self.codeView];
    [self.codeView change];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 22)];
    [self.view addSubview:self.label];
    
    self.textfield= [[UITextField alloc]initWithFrame:CGRectMake(100, 300, 200, 44)];
    self.textfield.delegate = self;
    self.textfield.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.textfield];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:self.codeView.changeString]) {
        
       self.label.text = @"验证码正确!";
    }
    else
    {
       
        self.label.text = @"验证码不正确，请重新输入";
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    if (textField == self.textfield) {
        
        NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (self.textfield)
        {
            if ([toBeString length] > 4) {
                self.textfield.text = [toBeString substringToIndex:4];
                return NO;
            }
        }
    }
    return YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textfield resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
