//
//  CYRulerCellParamModel.h
//  CYRuler
//
//  Created by 天天理财 on 2017/11/7.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYRulerCellParamModel : NSObject

/**
 自定义刻度线颜色
 */
@property (nonatomic,strong) UIColor *scaleLineColor;

/**
 自定义刻度值颜色
 */
@property (nonatomic,strong) UIColor *scaleNumberColor;

/**
 自定义刻度线粗度
 */
@property (nonatomic,assign) CGFloat scaleLineWidth;

/**
 自定义刻度值字体
 */
@property (nonatomic,strong) UIFont *scaleNumberFont;

@end
