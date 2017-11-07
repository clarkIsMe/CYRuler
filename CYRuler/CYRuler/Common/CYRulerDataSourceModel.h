//
//  CYRulerDataSourceModel.h
//  CYRuler
//
//  Created by 天天理财 on 2017/10/30.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYRulerDataSourceModel : NSObject

@property (nonatomic,assign) CGPoint movePoint;//位于轴线的坐标点

@property (nonatomic,assign) CGPoint addPoint;//远离轴线的坐标点

+ (CYRulerDataSourceModel *)model;

@end
