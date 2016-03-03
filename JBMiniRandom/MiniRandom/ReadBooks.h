//
//  ReadBooks.h
//  JBMiniRandom
//
//  Created by Bobby' on 16/2/27.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadBooks : UIViewController<UITextViewDelegate>
{
@private
    UITextView *textView;
    int currentPage;
    int allPage;
    UIBarButtonItem *button04;
}
@property (nonatomic,retain)NSString *str;

- (void)downPage;
-(void)upPage;

@end
