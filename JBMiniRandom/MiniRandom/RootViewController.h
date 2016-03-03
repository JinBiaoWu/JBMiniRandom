//
//  RootViewController.h
//  JBMiniRandom
//
//  Created by Bobby' on 16/2/27.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
@private
    UIScrollView *mainScrollView;
    UITableView *_tableView[2];
    NSArray *dataArray;
    UIButton *button;
}

@end
