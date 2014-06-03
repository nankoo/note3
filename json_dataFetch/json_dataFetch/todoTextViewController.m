//
//  todoTextViewController.m
//  json_dataFetch
//
//  Created by kazuhiro on 2014/05/27.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "todoTextViewController.h"

@interface todoTextViewController ()

@end

@implementation todoTextViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"todo";
    
    
    
    
    field =
    [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 320-60, 50)];
    field.text =@"aaaaaaaaaa";
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.delegate = self;
    
    
    int x=200;
    myLabel = [[UILabel alloc] initWithFrame:CGRectMake((320-x)/2,200,x,30)];
    //uicolor は nsobjectのサブクラス
    //yellowColorはクラスメソッド
    myLabel.backgroundColor = [UIColor greenColor];
    myLabel.textColor = [UIColor whiteColor];
    
    
    
    int xx=100;
    UIButton *btn;
    btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake((320-xx)/2, 300, xx, 30);
    [btn setTitle:@"押してね" forState:UIControlStateNormal];
    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
    [btn addTarget:self action:@selector(hogehoge)
  forControlEvents:UIControlEventTouchDown];
    


    
  
    [self.view addSubview:btn];
    [self.view addSubview:field];
    [self.view addSubview:myLabel];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    
    // 受け取った入力をラベルに代入
    //self.mLabel.text = sender.text;
    
    // キーボードを閉じる
    [sender resignFirstResponder];
    
    return TRUE;
}


-(void)hogehoge{
    



    dataViewController *controler = [[dataViewController alloc]init];
    controler.delegate = self;
    [controler hoge];
    
}

-(void)send:(NSMutableArray *)array
{
    
#if DEBUG
    NSLog(@"debug_log:array/todoText:%@", array);
#endif
    myLabel.text = array[1];
}




@end
