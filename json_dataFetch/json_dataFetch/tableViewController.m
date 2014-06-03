//
//  tableViewController.m
//  json_dataFetch
//
//  Created by kazuhiro on 2014/05/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "tableViewController.h"
#import "dataViewController.h"
#import "todoTextViewController.h"

@interface tableViewController ()

@end



@implementation tableViewController
@synthesize myTable;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"table";
        UIImage *icon = [UIImage imageNamed:@"2.png"];
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"table" image:icon tag:0];
        
        _objects = [[NSMutableArray alloc]init];
        
        
    }
    return self;
}





-(void)viewWillAppear:(BOOL)animated
{
    dataViewController *controler = [[dataViewController alloc]init];
    controler.delegate = self;
    [controler hoge];
}


-(void)send:(NSMutableArray *)array
{
    _objects = [array mutableCopy];
    
#if DEBUG
    NSLog(@"debug_log:copy:%@", _objects);
#endif
    
    //このメソッドは便利過ぎワロタ
    [[self myTable]reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, 320, 480) style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource = self;
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    [self.view addSubview:myTable];
}

//tabledelegate_insert
- (void)insertNewObject:(id)sender
{
    /*
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [myTable insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
     */
    todoTextViewController *todo_view = [[todoTextViewController alloc]init];
    [self.navigationController pushViewController:todo_view animated:NO];
   
}

//tabledelegate_deleate
-(void)tableView:(UITableView*)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath*)indexPath{
    
    //当たり前だけどmutableArrayじゃないと、増減不可能。
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}





//UITableViewDataSourceの@require(1)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}



//UITableViewDataSourceの@require(2)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //セルは再利用する
    static NSString *identidfer =@"default";
    //テンプレなので、、基本的なcellを使いまわす
    //宣言はif文内の１つだけじゃだめなの？
    UITableViewCell *cell = [myTable dequeueReusableCellWithIdentifier:identidfer];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidfer];
    }
    
    NSString *region = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = region;
    
    return cell;
    
}







@end
