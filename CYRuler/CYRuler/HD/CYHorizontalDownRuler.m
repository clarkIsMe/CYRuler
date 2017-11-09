//
//  CYHorizontalUpRuler.m
//  CYRuler
//
//  Created by 天天理财 on 2017/10/28.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "CYHorizontalDownRuler.h"
#import "CYRulerHDCell.h"
#import "CYRulerHDHeadCell.h"
#import "CYRulerHDFootCell.h"

extern BOOL didImplementationEnd;

@interface CYHorizontalDownRuler()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) NSInteger scale;

@end

@implementation CYHorizontalDownRuler

- (instancetype)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(frame.origin.x + (frame.size.width - frame.size.height) / 2.0, frame.origin.y - (frame.size.width - frame.size.height) / 2.0, frame.size.height, frame.size.width);
    self = [super initWithFrame:frame];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        self.delegate = self;
        self.dataSource = self;
        self.transform=CGAffineTransformMakeRotation(-M_PI / 2);
        self.showsVerticalScrollIndicator=NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)rulerWithPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale {
    
    [super rulerWithPointerOffset:pointerOffset startScale:startScale endScale:endScale valueOfUnitScale:valueOfUnitScale defaultScale:defaultScale];
    
    self.rulerModel = [[CYRulerModel alloc] initWithPointerOffset:pointerOffset startScale:startScale endScale:endScale valueOfUnitScale:valueOfUnitScale defaultScale:(NSInteger)defaultScale according:self.frame];
    
    [self reloadData];
    
    [self rulerScrollToScale:defaultScale];
    
    [self addPointer];
    [self addScaleLable];
}

- (void)rulerResetPointerOffset:(double)pointerOffset startScale:(NSInteger)startScale endScale:(NSInteger)endScale valueOfUnitScale:(NSInteger)valueOfUnitScale defaultScale:(NSInteger)defaultScale {
    [super rulerResetPointerOffset:pointerOffset startScale:startScale endScale:endScale valueOfUnitScale:valueOfUnitScale defaultScale:defaultScale];
    
    self.pointer.transform = CGAffineTransformMakeTranslation(pointerOffset - self.rulerModel.pointerOffset, 0);
    
    self.rulerModel = [[CYRulerModel alloc] initWithPointerOffset:pointerOffset startScale:startScale endScale:endScale valueOfUnitScale:valueOfUnitScale defaultScale:(NSInteger)defaultScale according:self.frame];
    
    [self reloadData];
    
    [self rulerScrollToScale:defaultScale];
}

- (void)rulerScrollToScale:(NSInteger)scaleValue {
    [super rulerScrollToScale:scaleValue];
    [self setContentOffset: CGPointMake(0, scaleValue / self.rulerModel.valueOfUnitScale * CYRulerUnitPX) animated:NO];
}

- (void)addPointer {
    if (!self.pointer) {
        UIView *pointer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 18)];
        pointer.backgroundColor = [UIColor blueColor];
        self.pointer = pointer;
    }
}
- (void)setPointer:(UIView *)pointer {
    [super setPointer:pointer];
    CGRect orginframe = CGRectMake(pointer.frame.origin.x + (pointer.frame.size.width - pointer.frame.size.height) / 2.0, pointer.frame.origin.y - (pointer.frame.size.width - pointer.frame.size.height) / 2.0, pointer.frame.size.height, pointer.frame.size.width);
    CGRect frame = [self convertRect:CGRectMake(27-orginframe.size.width, self.rulerModel.pointerOffset-orginframe.size.height/2.0 + self.rulerModel.defaultScale / self.rulerModel.valueOfUnitScale * CYRulerUnitPX, orginframe.size.width, orginframe.size.height) toView:self.superview];
    pointer.frame = frame;
    [self.superview addSubview:pointer];
}

- (void)addScaleLable {
    if (!self.scaleLable) {
        UILabel *scaleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        scaleLable.backgroundColor = [UIColor whiteColor];
        scaleLable.textAlignment = NSTextAlignmentCenter;
        self.scaleLable = scaleLable;
    }
}
- (void)setScaleLable:(UILabel *)scaleLable {
    [super setScaleLable:scaleLable];
    CGRect orginframe = CGRectMake(scaleLable.frame.origin.x + (scaleLable.frame.size.width - scaleLable.frame.size.height) / 2.0, scaleLable.frame.origin.y - (scaleLable.frame.size.width - scaleLable.frame.size.height) / 2.0, scaleLable.frame.size.height, scaleLable.frame.size.width);
    CGRect frame = [self convertRect:CGRectMake(40, (self.frame.size.width - orginframe.size.height) / 2.0 + self.rulerModel.defaultScale / self.rulerModel.valueOfUnitScale * CYRulerUnitPX , orginframe.size.width, orginframe.size.height) toView:self.superview];
    scaleLable.frame = frame;
    [self.superview addSubview:scaleLable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rulerModel.dataSources.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CYRulerHDHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if (!cell) {
            cell = [[CYRulerHDHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
        cell.dataModel = self.rulerModel.dataSources[indexPath.row];
        cell.paramModel = self.paramModel;
        return cell;
    }else if (indexPath.row == self.rulerModel.dataSources.count) {
        CYRulerHDFootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[CYRulerHDFootCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
        cell.paramModel = self.paramModel;
        return cell;
    }else {
        CYRulerHDCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[CYRulerHDCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
        cell.dataModel = self.rulerModel.dataSources[indexPath.row];
        cell.paramModel = self.paramModel;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return self.rulerModel.pointerOffset;
    }else if (indexPath.row == self.rulerModel.dataSources.count) {
        return (self.frame.size.width - self.rulerModel.pointerOffset);
    }else {
        return CYRulerCellWith;
    }
}

////
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _scale = (NSInteger)(scrollView.contentOffset.y/CYRulerUnitPX+0.5) * self.rulerModel.valueOfUnitScale;
    [self.rulerDelegate ruler:self ScaleIs:_scale];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (decelerate) {
        // nothing
    }else {
        _scale = (NSInteger)(scrollView.contentOffset.y/CYRulerUnitPX+0.5);
        [scrollView setContentOffset: CGPointMake(0, CYRulerUnitPX*_scale) animated:YES];
        [self.rulerDelegate ruler:self ScaleIs:_scale * self.rulerModel.valueOfUnitScale];
        if (didImplementationEnd) {
            [self.rulerDelegate ruler:self DidFinishScroll:YES];
        }
    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    _scale = (int)(scrollView.contentOffset.y/CYRulerUnitPX+0.5);
    [scrollView setContentOffset: CGPointMake(0, CYRulerUnitPX*_scale) animated:YES];
    [self.rulerDelegate ruler:self ScaleIs:_scale * self.rulerModel.valueOfUnitScale];
    if (didImplementationEnd) {
        [self.rulerDelegate ruler:self DidFinishScroll:YES];
    }
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    _scale = (int)(scrollView.contentOffset.y/CYRulerUnitPX+0.5);
    [scrollView setContentOffset: CGPointMake(0, CYRulerUnitPX*_scale) animated:NO];
    [self.rulerDelegate ruler:self ScaleIs:_scale * self.rulerModel.valueOfUnitScale];
    if (didImplementationEnd) {
        [self.rulerDelegate ruler:self DidFinishScroll:YES];
    }
    
}

@end

