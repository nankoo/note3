//
//  dataViewController.m
//  json_dataFetch
//
//  Created by kazuhiro on 2014/05/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "dataViewController.h"

@interface dataViewController ()

@end

@implementation dataViewController
//@synthesize result;
@synthesize array;
@synthesize delegate = _delegate;



-(void)set:(NSMutableArray *)_array
{
    /*
    NSArray *try = @[@"松",@"竹", @"梅"];
    [self.delegate send:try];
     */
#if DEBUG
    NSLog(@"debug_log:set:%@", _array);
#endif
    [self.delegate send:_array];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"dataSourse";
        UIImage *icon = [UIImage imageNamed:@"8.png"];
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"dataSourse" image:icon tag:1];
        
        array = [[NSMutableArray alloc]init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //nsmutablearray初期化するコード
    array = [[NSMutableArray alloc]init];

    
    int x=110;
    UIButton *btn;
    btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake((320-x)/2, 100, x, 30);
    [btn setTitle:@"DB確認" forState:UIControlStateNormal];
    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
    [btn addTarget:self action:@selector(hoge)
  forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
    
    int xx=200;
    myText = [[UITextView alloc] initWithFrame:CGRectMake((320-xx)/2,150,xx,300)];
    //uicolor は nsobjectのサブクラス
    //yellowColorはクラスメソッド
    myText.backgroundColor = [UIColor greenColor];
    
    myText.textColor = [UIColor blackColor];
    myText.text = @"xcodeめちゃくちゃ便利w";
    
    [self.view addSubview:myText];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

//エラー時に表示されるもの
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Fail with error");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
    //feed以下をゲット
    NSDictionary *feed = [allDataDictionary objectForKey:@"feed"];
    //NSDictionary *feed = [allDataDictionary objectForKey:@"text"];
    //やばい、下記読めないww
    //たぶんarrayになおしてるだけだけど
    NSArray *arrayOfEntry = [feed objectForKey:@"entry"];
    //NSArray *arrayOfEntry = [feed objectForKey:@"user_info"];
    
    
    //下記、高速列挙ですね-array
    //「forin」という名前でショートカットもあるが、慣れるまでは「for_kousoku」も残しておく
    for (NSDictionary *dict in arrayOfEntry)
    {
        NSDictionary *title = [dict objectForKey:@"title"];
        NSString *label = [title objectForKey:@"label"];
        
//        NSDictionary *title = [dict objectForKey:@"todo_id"];
//        NSString *label = [title objectForKey:@"todo_text"];
#if DEBUG
        NSLog(@"debug_log:label:%@", label);
#endif
#if DEBUG
        NSLog(@"debug_log::array:%@",array);
#endif
        //ここで出来たstringをarrayに加えていく
        //[array addObject:@"test"];
        [array addObject:label];
    }
    
    
    //テーブルビューにはリロードの機能がある
    //[[self myTable]reloadData];
#if DEBUG
    NSLog(@"debug_log:%@", array);
#endif
    //NSArray *arrayA = (NSArray *)array;
    [self set:array];
    myText.text = [array componentsJoinedByString:@"!!!\n"];
    
}



-(void)hoge{

    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/jp/rss/topfreeapplications/limit=20/json"];

    //NSURL *url = [NSURL URLWithString:@"http://training.cilenn.com/fw_todo_nanko/"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (connection) {
        webData = [[NSMutableData alloc] init];
    }

}




@end
