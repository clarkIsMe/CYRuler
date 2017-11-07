//
//  CYRulerDataSourceModel.m
//  CYRuler
//
//  Created by 天天理财 on 2017/10/30.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRulerDataSourceModel.h"

@implementation CYRulerDataSourceModel

+ (CYRulerDataSourceModel *)model {
    return [[CYRulerDataSourceModel alloc] init];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"movePoint:(%f,%f),addPoint:(%f,%f)",_movePoint.x,_movePoint.y,_addPoint.x,_addPoint.y];
}

@end
