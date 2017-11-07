//
//  CYRulerCell.m
//  CYRuler
//
//  Created by 天天理财 on 2017/11/1.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYRulerCell.h"
#import "CYRulerHUCell.h"

@implementation CYRulerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setDataModel:(CYRulerCellModel *)dataModel {
    _dataModel = dataModel;
    
    _valueLable.text = @(_dataModel.scaleValue).stringValue;
}

- (void)setParamModel:(CYRulerCellParamModel *)paramModel {
    _paramModel = paramModel;
    
}

@end
