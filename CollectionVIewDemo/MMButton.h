//
//  MMButton.h
//  SBookshop
//
//  Created by boolean on 16/8/16.
//  Copyright © 2016年 evolt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MMImageAlignment) {
    MMImageAlignmentLeft = 0,
    MMImageAlignmentTop,
    MMImageAlignmentBottom,
    MMImageAlignmentRight,
};

@interface MMButton : UIButton
@property(nonatomic,assign)MMImageAlignment imageAlignment;
@property(nonatomic,assign)CGFloat spaceBetweenTitleAndImage;
@end
