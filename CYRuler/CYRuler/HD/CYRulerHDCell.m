//
//  CYRulerHUCell.m
//  CYRuler
//
//  Created by 天天理财 on 2017/11/1.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRulerHDCell.h"
#import "CYRulerDataSourceModel.h"

extern CGFloat rulerHeight;

@interface CYRulerHDCell()

@property (nonatomic,strong) NSMutableArray *dataSources;

@end

@implementation CYRulerHDCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView {
    self.valueLable = [[UILabel alloc] initWithFrame:CGRectMake(CYRulerCellWith / 2.0, rulerHeight - 11, CYRulerCellWith, 10)];
    [self.contentView addSubview:self.valueLable];
    self.valueLable.font = [UIFont systemFontOfSize:10];
    self.valueLable.textColor = [UIColor redColor];
    self.valueLable.textAlignment = NSTextAlignmentCenter;
    self.valueLable.clipsToBounds = YES;
    
    [self calculateDataModel];
    [self drawX];
}

- (void)calculateDataModel {
    CYRulerDataSourceModel *model = [CYRulerDataSourceModel model];
    model.movePoint = CGPointMake(0, rulerHeight - 27);
    model.addPoint = CGPointMake(CYRulerCellWith, rulerHeight - 27);
    [self.dataSources addObject:model];
    
    for (int i = 0; i < 11; i++) {
        CYRulerDataSourceModel *model = [CYRulerDataSourceModel model];
        model.movePoint = CGPointMake(i * 7, rulerHeight - 27);
        model.addPoint = CGPointMake(i * 7, rulerHeight - 27 + (i % 10 == 0?CYRulerLongScaleLength:CYRulerShortScaleLength));
        [self.dataSources addObject:model];
    }
}


- (void)drawX {
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    for (CYRulerDataSourceModel *model in self.dataSources) {
        [linePath moveToPoint:model.movePoint];
        [linePath addLineToPoint:model.addPoint];
    }
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.lineWidth = 1;
    self.lineLayer.strokeColor = [UIColor redColor].CGColor;
    self.lineLayer.path = linePath.CGPath;
    self.lineLayer.fillColor = nil; // 默认为blackColor
    [self.contentView.layer addSublayer:self.lineLayer];
}

- (void)reDrawX {
    [self.lineLayer removeFromSuperlayer];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    for (CYRulerDataSourceModel *model in self.dataSources) {
        [linePath moveToPoint:model.movePoint];
        [linePath addLineToPoint:model.addPoint];
    }
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

- (NSMutableArray *)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

@end

