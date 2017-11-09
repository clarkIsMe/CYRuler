//
//  CYRuler.h
//  CYRuler
//
//  Created by 天天理财 on 2017/10/28.
//  Copyright © 2017年 ttlc. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CYRulerModel.h"
#import "CYRulerCellParamModel.h"

@class CYRuler;

@protocol CYRulerDelegate

@required
- (void)ruler:(CYRuler *)ruler ScaleIs:(NSInteger)scale;

@optional
- (void)ruler:(CYRuler *)ruler DidFinishScroll:(BOOL)isFinished;

@end

@interface CYRuler : UITableView

@property (nonatomic,weak) id<CYRulerDelegate,NSObject> rulerDelegate;

@property (nonatomic,strong) CYRulerModel *rulerModel;

@end

@interface CYRuler()

/**
 create an ruler that horizontal and up
 
 @return CYHorizontalUpRuler_objc
 */
+ (CYRuler *)horizontalUpRulerWithFrame:(CGRect)frame;

/**
 create an ruler that horizontal and down
 
 @return CYHorizontalDownRuler_objc
 */
+ (CYRuler *)horizontalDownRulerWithFrame:(CGRect)frame;

/**
 create an ruler that vertical and left
 
 @return CYVerticalLeftRuler_objec
 */
//+ (CYRuler *)verticalLeftRulerWithFrame:(CGRect)frame;

/**
 create an ruler that vertical and right
 
 @return CYVerticalRightRuler_objc
 */
//+ (CYRuler *)verticalRightRulerWithFrame:(CGRect)frame;

@end

@interface CYRuler()

/**
 设置标尺参数

 @param pointerOffset 指针偏移量 - double 类型
 @param startScale 起点刻度值
 @param endScale 终点刻度值
 @param valueOfUnitScale 单位刻度值
 @param defaultScale 默认刻度值
 */
- (void)rulerWithPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale;

/**
 重设标尺参数
 */
- (void)rulerResetPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale;

/**
 滚动标尺到某个刻度值

 @param scale 指定刻度值
 */
- (void)rulerScrollToScale:(NSInteger)scale;

@end

@interface CYRuler()

/**
 自定义指针
 */
@property (nonatomic,strong) UIView *pointer;

/**
 自定义文本显示
 */
@property (nonatomic,strong) UILabel *scaleLable;

/**
 自定义刻度线颜色
 */
@property (nonatomic,strong) UIColor *scaleLineColor;

/**
 自定义刻度值颜色
 */
@property (nonatomic,strong) UIColor *scaleNumberColor;

/**
 自定义刻度值字体
 */
@property (nonatomic,strong) UIFont *scaleNumberFont;

/**
 自定义刻度线粗度
 */
@property (nonatomic,assign) CGFloat scaleLineWidth;

@end


@interface CYRuler()

@property (nonatomic,strong) CYRulerCellParamModel *paramModel;

@end
