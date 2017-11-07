//
//  CYRulerHUFootCell.m
//  CYRuler
//
//  Created by 天天理财 on 2017/11/3.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRulerHUFootCell.h"
#import "CYRulerDataSourceModel.h"

extern double pointerOffsetRight;
extern CGFloat rulerHeight;

@implementation CYRulerHUFootCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView {
    [self calculateDataModel];
}

- (void)calculateDataModel {
    CYRulerDataSourceModel *model = [CYRulerDataSourceModel model];
    model.movePoint = CGPointMake(0, rulerHeight - 1);
    model.addPoint = CGPointMake(pointerOffsetRight, rulerHeight - 1);
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:model.movePoint];
    [linePath addLineToPoint:model.addPoint];
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.lineWidth = 1;
    self.lineLayer.strokeColor = [UIColor redColor].CGColor;
    self.lineLayer.path = linePath.CGPath;
    self.lineLayer.fillColor = nil; // 默认为blackColor
    [self.contentView.layer addSublayer:self.lineLayer];
}

- (void)reDrawX {
    [self.lineLayer removeFromSuperlayer];
    
    CYRulerDataSourceModel *model = [CYRulerDataSourceModel model];
    model.movePoint = CGPointMake(0, rulerHeight - 1);
    model.addPoint = CGPointMake(pointerOffsetRight, rulerHeight - 1);
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:model.movePoint];
    [linePath addLineToPoint:model.addPoint];
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.lineWidth = self.paramModel.scaleLineWidth != 0 ? self.paramModel.scaleLineWidth : 0.5;
    self.lineLayer.strokeColor = self.paramModel.scaleLineColor != nil ? self.paramModel.scaleLineColor.CGColor : [UIColor redColor].CGColor;
    self.lineLayer.path = linePath.CGPath;
    self.lineLayer.fillColor = nil; // 默认为blackColor
    [self.contentView.layer addSublayer:self.lineLayer];
}

- (void)setParamModel:(CYRulerCellParamModel *)paramModel {
    [super setParamModel:paramModel];
    [self reDrawX];
}

@end
