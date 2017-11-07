//
//  CYRulerModel.m
//  CYRuler
//
//  Created by 天天理财 on 2017/10/30.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRulerModel.h"

@implementation CYRulerModel

- (instancetype)initWithPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale according:(CGRect)frame {
    self = [super init];
    if (self) {
        _pointerOffset = pointerOffset;
        _startScale = startScale;
        _endScale = endScale;
        _valueOfUnitScale = valueOfUnitScale;
        _frame = frame;
        
        [self calculateHorizontalUpScale];
    }
    return self;
}

- (void)calculateHorizontalUpScale {
    [self calculateCell];
}

//cell数据
- (void)calculateCell {
    for (NSInteger i = _startScale / _valueOfUnitScale < 10 ? 0 : _startScale / _valueOfUnitScale; i < (_endScale / _valueOfUnitScale + _valueOfUnitScale); i++) {
        if (i % 10 == 0) {
            CYRulerCellModel *model = [CYRulerCellModel model];
            model.scaleValue = i * _valueOfUnitScale;
            [self.dataSources addObject:model];
        }
    }
}

- (NSMutableArray *)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"pointerOffset:%lf,startScale:%ld,endScale:%ld,valueOfUnitScale:%ld",_pointerOffset,_startScale,_endScale,_valueOfUnitScale];
}

@end
