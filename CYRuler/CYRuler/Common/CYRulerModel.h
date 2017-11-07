//
//  CYRulerModel.h
//  CYRuler
//
//  Created by 天天理财 on 2017/10/30.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYRulerCellModel.h"
#import "CYRulerDataSourceModel.h"

@interface CYRulerModel : NSObject

@property (nonatomic,assign,readonly) double pointerOffset;//指针偏移量,默认在当前视图左右或者上下居中

@property (nonatomic,assign,readonly) NSInteger defaultScale;//默认定位到这一刻度值，默认 0

@property (nonatomic,assign,readonly) NSInteger startScale;//起点刻度值

@property (nonatomic,assign,readonly) NSInteger endScale;//终点刻度值

@property (nonatomic,assign,readonly) NSInteger valueOfUnitScale;//单位刻度值

@property (nonatomic,assign,readonly) CGRect frame;//当前需要计算数据的视图的frame；

@property (nonatomic,strong) NSMutableArray *dataSources;//绘制标尺原始数据


- (instancetype)initWithPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale according:(CGRect)frame;

@end
