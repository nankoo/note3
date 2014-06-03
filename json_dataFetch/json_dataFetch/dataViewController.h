//
//  dataViewController.h
//  json_dataFetch
//
//  Created by kazuhiro on 2014/05/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol dataViewControllerDelegate;

@interface dataViewController : UIViewController{
    UITextView *myText;
    //NSString *result;
    //JSON用の暫定的な変数{
    NSMutableData *webData;
    NSURLConnection *connection;
    NSMutableArray *array;
    //}
}

//@property NSString *result;
@property(nonatomic) NSMutableArray *array;
@property(weak)id<dataViewControllerDelegate> delegate;
-(void)set:(NSMutableArray*)_array;
-(void)hoge;

@end



@protocol dataViewControllerDelegate <NSObject>

//値をsendするメソッド
-(void)send :(NSMutableArray *)array;

@end
