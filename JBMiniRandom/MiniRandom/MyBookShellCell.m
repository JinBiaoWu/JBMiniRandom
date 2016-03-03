//
//  MyBookShellCell.m
//  JBMiniRandom
//
//  Created by Bobby' on 16/2/27.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import "MyBookShellCell.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@implementation MyBookShellCell

@synthesize label;
@synthesize imageView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BookShelfCell"]];
        imageView.frame = CGRectMake(0, 0, kScreenWidth, 139);
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 139)];
        label.backgroundColor = [UIColor clearColor];
        [label addSubview:imageView];
        [self addSubview:label];
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
