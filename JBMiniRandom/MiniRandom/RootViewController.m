//
//  RootViewController.m
//  JBMiniRandom
//
//  Created by Bobby' on 16/2/27.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import "RootViewController.h"
#import "MyBookShellCell.h"
#import "ReadBooks.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

static int cnt;

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将每本书的封面图片以字符串的形式存取到数组中
    UIImage * backgroundImage = [UIImage imageNamed:@"bookback"];
    
    UIColor * backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    self.view.backgroundColor = backgroundColor;
    
    dataArray = [[NSArray alloc] initWithObjects:@"aizaixianjingderizi.jpeg",@"anshizhangda.jpeg",@"bubizhidaowoshishui.jpeg",@"dangnigudannihuixiangqishui.jpeg",@"hudielaiguozheshijie.jpeg",@"liaiyigeIDdejuli.jpeg",@"shalou.jpeg",@"shinian.jpeg",@"tangyi.jpeg",@"tiaopin.jpeg",@"wobushinideyuanjia.jpeg",@"woyaowomenzaiyiqi.jpeg",@"xiaofudequnbai.jpeg",@"xiaoyaodejinsechengbao.jpeg",@"zuishuxidemoshengren.jpeg",@"zuoer.jpg",@"zuoerzhongjie.jpeg",@"aizaixianjingderizi.jpeg", nil];
    //设置导航栏上的标题
    self.navigationItem.title = @"迷你小书屋";
    
  
    
    mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    mainScrollView.backgroundColor = backgroundColor;
    //设置mainScrollView的大小
    mainScrollView.contentSize = CGSizeMake(kScreenWidth *2, 0);
    [self.view addSubview:mainScrollView];
    
    mainScrollView.delegate = self;
    //隐藏水平和垂直滚动条
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    
    //将分页开关打开
    mainScrollView.pagingEnabled = YES;
    //静止来回晃动
    mainScrollView.bounces = NO;
    
    // mainScrollView.scrollEnabled = NO;
    
    _tableView[0] = [[UITableView alloc] initWithFrame:CGRectMake(0 ,60,kScreenWidth,kScreenHeight) style:UITableViewStylePlain];
    _tableView[0].delegate = self;
    _tableView[0].dataSource = self;
    
    _tableView[0].backgroundColor = backgroundColor;
    [mainScrollView addSubview:_tableView[0]];
    
    //静止来回晃动
    _tableView[0].bounces = NO;
    _tableView[0].tag = 100;
    
    _tableView[1] = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth ,60,kScreenWidth,kScreenHeight) style:UITableViewStylePlain];
    _tableView[1].delegate = self;
    _tableView[1].dataSource = self;
    _tableView[1].backgroundColor = backgroundColor;
    [mainScrollView addSubview:_tableView[1]];
    
    //静止来回晃动
    _tableView[1].bounces = NO;
    _tableView[1].tag = 200;
}

/**
 *  返回行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

/**
 *  cell的行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 139;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyBookShellCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[MyBookShellCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ID"];
    }
    
    /**
     *  将cell设置成点击时不变色
     */
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    /**
     *  如果是第一个表格视图
     */
    if (tableView.tag == 100) {
        for (int i = 0; i < 3; i++) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10 + ((kScreenWidth - 40) / 3 + 10) * i, 5, (kScreenWidth - 40) / 3, 119);
            /**
             *  将cnt设置成button的tag.方便获取
             */

            button.tag = cnt;
            UIImage *im = [UIImage imageNamed:[dataArray objectAtIndex:cnt++]];
            UIImage *im2 = [im resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
            UIImageView *contentIV = [[UIImageView alloc] initWithImage:im2];
            contentIV.frame = button.bounds;
            [button addSubview:contentIV];

            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:button];
        }
    }
    
    /**
     *  如果是第二个表视图
     */
    if (tableView.tag == 200) {
        for (int i = 0; i < 3; i++) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = cnt;
            button.frame = CGRectMake(10 + ((kScreenWidth - 40) / 3 + 10) * i, 5, (kScreenWidth - 40) / 3, 119);
            [button setImage:[UIImage imageNamed:[dataArray objectAtIndex:cnt++]] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:button];
        }
    }
    
    return cell;
}

- (void)onClick:(UIButton *)sender
{
    ReadBooks *readBook = [[ReadBooks alloc]init];
    if (sender.tag == 0)
    {
        //获取aizaixianjingderizi.txt里面的内容
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aizaixianjingderizi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 1)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"anshizhangda" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 2)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bubizhidaowoshishui" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 3)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dangnigudannihuixiangqishui" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 4)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hudielaiguozheshijie" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 5)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"liaiyigeIDdejuli" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 6)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shalou" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 7)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shinian" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 8)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tangyi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 9)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tiaopin" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 10)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wobushinideyuanjia" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 11)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"woyaowomenzaiyiqi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 12)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xiaofudequnbai" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 13)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xiaoyaodejinsechengbao" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 14)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuishuxidemoshengren" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 15)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuoer" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 16)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuoerzhongjie" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 17)
    {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aizaixianjingderizi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }

    /**
     *  设置翻转模式
     */
    [readBook setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
//    [readBook setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    
    [self presentModalViewController:readBook animated:YES];
//    [self presentViewController:readBook animated:YES completion:nil];
}


- (void)viewWillAppear:(BOOL)animated
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
    /**
     *  打开状态栏
     */
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    /**
     *  打开导航栏
     */
//    self.navigationController.navigationBar.hidden = NO;
    [UIView commitAnimations];
    return;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
