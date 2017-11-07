//
//  CYRulerCell.h
//  CYRuler
//
//  Created by 天天理财 on 2017/11/1.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYRulerCellModel.h"
#import "CYRulerCellParamModel.h"

@interface CYRulerCell : UITableViewCell

@property (nonatomic,strong) CYRulerCellModel *dataModel;

@property (nonatomic,strong) CYRulerCellParamModel *paramModel;

@property (nonatomic,strong) UILabel *valueLable;

@property (nonatomic,strong) CAShapeLayer *lineLayer;

@end
