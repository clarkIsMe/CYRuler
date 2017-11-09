//
//  CYRuler.m
//  CYRuler
//
//  Created by 天天理财 on 2017/10/28.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRuler.h"
#import "CYHorizontalUpRuler.h"
#import "CYHorizontalDownRuler.h"
#import "CYVerticalLeftRuler.h"
#import "CYVerticalRightRuler.h"

BOOL didImplementationEnd;

double pointerOffsetLeft;
double pointerOffsetRight;
CGFloat rulerHeight;
CGFloat rulerWidth;

@implementation CYRuler

/**
 create an ruler that horizontal and up
 
 @return CYHorizontalUpRuler_objc
 */
+ (CYRuler *)horizontalUpRulerWithFrame:(CGRect)frame {
    return [[CYHorizontalUpRuler alloc] initWithFrame:frame];
}

/**
 create an ruler that horizontal and down
 
 @return CYHorizontalDownRuler_objc
 */
+ (CYRuler *)horizontalDownRulerWithFrame:(CGRect)frame {
    return [[CYHorizontalDownRuler alloc] initWithFrame:frame];
}

/**
 create an ruler that vertical and left
 
 @return CYVerticalLeftRuler_objec
 */
+ (CYRuler *)verticalLeftRulerWithFrame:(CGRect)frame {
    return [[CYVerticalLeftRuler alloc] initWithFrame:frame];
}

/**
 create an ruler that vertical and right
 
 @return CYVerticalRightRuler_objc
 */
+ (CYRuler *)verticalRightRulerWithFrame:(CGRect)frame {
    return [[CYVerticalRightRuler alloc] initWithFrame:frame];
}

- (void)rulerWithPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale {
    [self paramsCheck:pointerOffset and:startScale and:endScale and:valueOfUnitScale and:defaultScale];
    
    pointerOffsetLeft = pointerOffset;
    pointerOffsetRight = self.frame.size.width - pointerOffset;
    rulerHeight = self.frame.size.height;
    rulerWidth = self.frame.size.width;
}
- (void)rulerResetPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale {
    [self paramsCheck:pointerOffset and:startScale and:endScale and:valueOfUnitScale and:defaultScale];
    
    pointerOffsetLeft = pointerOffset;
    pointerOffsetRight = self.frame.size.width - pointerOffset;
    rulerHeight = self.frame.size.height;
    rulerWidth = self.frame.size.width;
}
- (void)rulerScrollToScale:(NSInteger)scale {
    NSAssert(scale >= 0 && scale <= self.rulerModel.endScale && scale % self.rulerModel.valueOfUnitScale == 0, @"scale（指定值）设置错误");
}

- (void)paramsCheck:(CGFloat)pointerOffset and:(NSInteger)startScale and:(NSInteger)endScale and:(NSInteger)valueOfUnitScale and:(NSInteger)defaultScale {
    NSAssert(pointerOffset > 0 && pointerOffset < self.frame.size.width, @"pointerOffset（指针）超出视图");
    NSAssert(startScale % 10 == 0 && endScale % 10 == 0, @"startScale（起点刻度）和 endScale（终点刻度） 必须是10的整数倍");
    NSAssert(endScale > startScale, @"endScale（终点刻度）应该大于 startScale（起点刻度）");
    NSAssert(valueOfUnitScale > 0, @"valueOfUnitScale（单位刻度值） 应该大于 0");
    NSAssert(valueOfUnitScale > 0, @"endScale（终点刻度） / valueOfUnitScale（单位刻度值） 应该小于 999,9999");
    NSAssert(defaultScale >= 0 && defaultScale <= endScale && defaultScale % valueOfUnitScale == 0, @"defaultScale（默认值）设置错误");
}

- (void)setPointer:(UIView *)pointer {
    NSAssert([pointer isKindOfClass:[UIView class]], @"pointer 应该是UIView的一种");
    if (_pointer) {
        [_pointer removeFromSuperview];
    }
    _pointer = pointer;
}

- (void)setScaleLable:(UILabel *)scaleLable {
    if (scaleLable) {
        NSAssert([scaleLable isKindOfClass:[UILabel class]], @"scaleLable 应该是UILable的一种");
    }
    scaleLable.text = @(self.rulerModel.defaultScale).stringValue;
    if (_scaleLable) {
        [_scaleLable removeFromSuperview];
    }
    _scaleLable = scaleLable;
}

- (void)setRulerDelegate:(id<CYRulerDelegate>)rulerDelegate {
    _rulerDelegate = rulerDelegate;
    if ([_rulerDelegate respondsToSelector:@selector(ruler:DidFinishScroll:)]) {
        didImplementationEnd = YES;
    }else {
        didImplementationEnd = NO;
    }
}

- (void)setScaleLineColor:(UIColor *)scaleLineColor {
    self.paramModel.scaleLineColor = scaleLineColor;
    [self reloadData];
}

- (void)setScaleNumberColor:(UIColor *)scaleNumberColor {
    self.paramModel.scaleNumberColor = scaleNumberColor;
    [self reloadData];
}

- (void)setScaleLineWidth:(CGFloat)scaleLineWidth {
    self.paramModel.scaleLineWidth = scaleLineWidth;
    [self reloadData];
}

- (void)setScaleNumberFont:(UIFont *)scaleNumberFont {
    self.paramModel.scaleNumberFont = scaleNumberFont;
    [self reloadData];
}

- (CYRulerCellParamModel *)paramModel {
    if (!_paramModel) {
        _paramModel = [[CYRulerCellParamModel alloc] init];
    }
    return _paramModel;
}

- (void)dealloc {
    [self.pointer removeFromSuperview];
    [self.scaleLable removeFromSuperview];
}

@end
