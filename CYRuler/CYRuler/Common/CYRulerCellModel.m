//
//  CYRulerCellModel.m
//  CYRuler
//
//  Created by 天天理财 on 2017/11/2.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRulerCellModel.h"

CGFloat const CYRulerUnitPX = 7;
CGFloat const CYRulerLongScaleLength = 12;
CGFloat const CYRulerShortScaleLength = 6;
CGFloat const CYRulerCellWith = 70;
CGFloat const CYRulerCellHeight = CYRulerLongScaleLength + 15;

@implementation CYRulerCellModel

+ (CYRulerCellModel *)model {
    return [[CYRulerCellModel alloc] init];
}

@end
