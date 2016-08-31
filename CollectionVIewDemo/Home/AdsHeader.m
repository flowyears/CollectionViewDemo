//
//  AdsHeader.m
//  SBookshop
//
//  Created by boolean on 16/8/15.
//  Copyright © 2016年 evolt. All rights reserved.
//

#import "AdsHeader.h"


@interface AdsHeader ()
@property (strong, nonatomic) UILabel *titleLb;
@end

@implementation AdsHeader
#pragma mark - Life Cycle
- (id)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.backgroundColor = RGBCOLOR(166, 186, 196);
        [self addSubview:self.titleLb];
        self.titleLb.text = @"我是header";
    }
    
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLb.frame = CGRectMake(0, self.height-20, self.width, 50);
    self.titleLb.centerY = self.centerY;
}
#pragma mark - Getter And Setter
- (UILabel *)titleLb
{
    if (!_titleLb)
    {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLb.font = [UIFont systemFontOfSize:30.0f];
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}
@end
