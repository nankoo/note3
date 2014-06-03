//
//  tableViewController.h
//  json_dataFetch
//
//  Created by kazuhiro on 2014/05/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataViewController.h"


@interface tableViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, dataViewControllerDelegate>
{
    UITableView *myTable;
    NSArray *sampleRegion;
    NSArray *jsonData;
    @public
    NSMutableArray *_objects;
}
@property UITableView *myTable;



@end
