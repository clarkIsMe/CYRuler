//
//  CYRulerCellModel.h
//  CYRuler
//
//  Created by 天天理财 on 2017/11/2.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT CGFloat const CYRulerUnitPX; //单位刻度的像素值
FOUNDATION_EXPORT CGFloat const CYRulerLongScaleLength; //长刻度像素值
FOUNDATION_EXPORT CGFloat const CYRulerShortScaleLength; //短刻度像素值
FOUNDATION_EXPORT CGFloat const CYRulerCellWith; //cell宽度
FOUNDATION_EXPORT CGFloat const CYRulerCellHeight; //cell高度

@interface CYRulerCellModel : NSObject

@property (nonatomic,assign) NSInteger scaleValue;

+ (CYRulerCellModel *)model;

@end
