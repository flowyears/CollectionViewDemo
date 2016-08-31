//
//  PersonRecommendCell.m
//  SBookshop
//
//  Created by boolean on 16/8/17.
//  Copyright © 2016年 evolt. All rights reserved.
//

#import "PersonRecommendCell.h"

@interface PersonRecommendCell ()
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *priceLb;
@property (strong, nonatomic) UILabel *titleLb;
@end

@implementation PersonRecommendCell

#pragma mark - Life Cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.contentView.backgroundColor = RGBCOLOR(246, 246, 246);
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.width, self.height);
}

#pragma mark - Method
- (void)fillDataWithIndex:(NSInteger)index
{
    NSString *imageName = [NSString stringWithFormat:@"00%ld.jpg",index%7+1];
    UIImage *img = [UIImage imageNamed:imageName];
    self.imageView.image = img;
}



#pragma mark - Getter And Setter
- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = RGBCOLOR(236, 236, 236);
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

@end
