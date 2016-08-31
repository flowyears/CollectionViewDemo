//
//  HomeFooter.m
//  SBookshop
//
//  Created by boolean on 16/8/15.
//  Copyright © 2016年 evolt. All rights reserved.
//

#import "HomeFooter.h"
#import "MMButton.h"

@interface HomeFooter ()
@property(nonatomic,strong)MMButton *aButton;
@end

@implementation HomeFooter
#pragma mark - Life Cycle
- (id)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.backgroundColor = RGBCOLOR(206, 206, 206);
        [self addSubview:self.aButton];
        self.aButton.frame = CGRectMake(0, 10, 100, 20);
        self.aButton.center = CGPointMake(self.center.x, self.aButton.center.y);
    }
    
    return self;
}
#pragma mark - Method
- (void)fillDataWithTitle:(NSString *)title backgroundImage:(UIImage *)backgroundImage
{
    [self.aButton setImage:backgroundImage forState:UIControlStateNormal];
    [self.aButton setTitle:title forState:UIControlStateNormal];
}
- (void)btnClick:(UIButton *)btn
{
    if (self.footerBlock)
    {
        self.footerBlock();
    }
}
#pragma mark - Getter And Setter
- (MMButton *)aButton
{
    if (!_aButton)
    {
        _aButton = [MMButton buttonWithType:UIButtonTypeCustom];
        _aButton.imageAlignment = MMImageAlignmentRight;
        _aButton.spaceBetweenTitleAndImage = 4;
        [_aButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_aButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_aButton.titleLabel setFont:[UIFont systemFontOfSize:16]];

    }
    return _aButton;
}
@end
