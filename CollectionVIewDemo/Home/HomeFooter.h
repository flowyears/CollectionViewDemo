//
//  HomeFooter.h
//  SBookshop
//
//  Created by boolean on 16/8/15.
//  Copyright © 2016年 evolt. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^FooterClickBlock)();

@interface HomeFooter : UICollectionReusableView
@property(nonatomic,copy)FooterClickBlock footerBlock;

- (void)fillDataWithTitle:(NSString *)title backgroundImage:(UIImage *)backgroundImage;
@end
