//
//  todoTextViewController.h
//  json_dataFetch
//
//  Created by kazuhiro on 2014/05/27.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataViewController.h"

@interface todoTextViewController : UIViewController
<dataViewControllerDelegate, UITextFieldDelegate>
{
    UITextField *field;
    UILabel *myLabel;
}


@end
