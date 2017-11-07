//
//  CYRulerHUHeadCell.m
//  CYRuler
//
//  Created by 天天理财 on 2017/11/3.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRulerHDHeadCell.h"
#import "CYRulerDataSourceModel.h"

extern double pointerOffsetLeft;
extern CGFloat rulerHeight;

@implementation CYRulerHDHeadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView {
    self.valueLable = [[UILabel alloc] initWithFrame:CGRectMake(pointerOffsetLeft - CYRulerCellWith / 2.0, rulerHeight - 11, CYRulerCellWith, 10)];
    [self.contentView addSubview:self.valueLable];
    self.valueLable.font = [UIFont systemFontOfSize:10];
    self.valueLable.textColor = [UIColor redColor];
    self.valueLable.textAlignment = NSTextAlignmentCenter;
    self.valueLable.clipsToBounds = YES;
    self.valueLable.text = @(self.dataModel.scaleValue).stringValue;
    
    [self calculateDataModel];
}

- (void)calculateDataModel {
    CYRulerDataSourceModel *model0 = [CYRulerDataSourceModel model];
    model0.movePoint = CGPointMake(0, rulerHeight - 27);
    model0.addPoint = CGPointMake(pointerOffsetLeft, rulerHeight - 27);
    CYRulerDataSourceModel *model1 = [CYRulerDataSourceModel model];
    model1.movePoint = CGPointMake(pointerOffsetLeft, rulerHeight - 27);
    model1.addPoint = CGPointMake(pointerOffsetLeft, rulerHeight - 27 + CYRulerLongScaleLength);
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:model0.movePoint];
    [linePath addLineToPoint:model0.addPoint];
    [linePath moveToPoint:model1.movePoint];
    [linePath addLineToPoint:model1.addPoint];
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.lineWidth = 1;
    self.lineLayer.strokeColor = [UIColor redColor].CGColor;
    self.lineLayer.path = linePath.CGPath;
    self.lineLayer.fillColor = nil; // 默认为blackColor
    [self.contentView.layer addSublayer:self.lineLayer];
}

- (void)reDrawX {
    [self.lineLayer removeFromSuperlayer];
    
    CYRulerDataSourceModel *model0 = [CYRulerDataSourceModel model];
    model0.movePoint = CGPointMake(0, rulerHeight - 27);
    model0.addPoint = CGPointMake(pointerOffsetLeft, rulerHeight - 27);
    CYRulerDataSourceModel *model1 = [CYRulerDataSourceModel model];
    model1.movePoint = CGPointMake(pointerOffsetLeft, rulerHeight - 27);
    model1.addPoint = CGPointMake(pointerOffsetLeft, rulerHeight - 27 + CYRulerLongScaleLength);
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:model0.movePoint];
    [linePath addLineToPoint:model0.addPoint];
    [linePath moveToPoint:model1.movePoint];
    [linePath addLineToPoint:model1.addPoint];
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.lineWidth = self.paramModel.scaleLineWidth != 0 ? self.paramModel.scaleLineWidth : 0.5;
    self.lineLayer.strokeColor = self.paramModel.scaleLineColor != nil ? self.paramModel.scaleLineColor.CGColor : [UIColor redColor].CGColor;
    self.lineLayer.path = linePath.CGPath;
    self.lineLayer.fillColor = nil; // 默认为blackColor
    [self.contentView.layer addSublayer:self.lineLayer];
    
}

- (void)setParamModel:(CYRulerCellParamModel *)paramModel {
    [super setParamModel:paramModel];
    self.valueLable.font = self.paramModel.scaleNumberFont != nil ? self.paramModel.scaleNumberFont : [UIFont systemFontOfSize:10];
    self.valueLable.textColor = self.paramModel.scaleNumberColor != nil ? self.paramModel.scaleNumberColor : [UIColor redColor];
    [self reDrawX];
}

@end

