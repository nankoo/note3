//
//  AppDelegate.h
//  json_dataFetch
//
//  Created by kazuhiro on 2014/05/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tableViewController.h"
#import "dataViewController.h"

@interface AppDelegate : UIResponder
<UIApplicationDelegate, UITabBarControllerDelegate>{
    UIWindow *window;
    //UIViewController *rootController;
    UITabBarController *root;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UITabBarController *root;

@end
