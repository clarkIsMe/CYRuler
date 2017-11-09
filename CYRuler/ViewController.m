//
//  ViewController.m
//  CYRuler
//
//  Created by 天天理财 on 2017/10/28.
//  Copyright © 2017年 ttlc. All rights reserved.
//

#import "ViewController.h"
#import "CYRuler.h"

@interface ViewController ()<CYRulerDelegate>

@property (nonatomic,strong) CYRuler *ruler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 横向，朝上
    [self createHURuler];
    
    // 横向，朝下
//    [self createHDRuler];
    
}

/**
 横向，朝上
 */
- (void)createHURuler {
    CYRuler *ruler = [CYRuler horizontalUpRulerWithFrame:CGRectMake(10, 100, 300, 80)];
    [self.view addSubview:ruler];
    ruler.rulerDelegate = self;
    [ruler rulerWithPointerOffset:150.0f startScale:10 endScale:1000 valueOfUnitScale:10 defaultScale:20];
    
    /**自定义属性**/
//    ruler.scaleNumberFont = [UIFont systemFontOfSize:8];
//    ruler.scaleNumberColor = [UIColor whiteColor];
//    ruler.scaleLineColor = [UIColor whiteColor];
//    ruler.scaleLineWidth = 0.5;
    
    /**重设标尺**/
//    [ruler rulerResetPointerOffset:150 startScale:30 endScale:1000 valueOfUnitScale:10 defaultScale:50];
    
    /**自定义指针**/
//    UIView *pointer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
//    pointer.backgroundColor = [UIColor whiteColor];
//    ruler.pointer = pointer;   //can not be nil

    /**自定义文本显示框**/
//    UILabel *scaleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    scaleLable.backgroundColor = [UIColor blueColor];
//    scaleLable.textAlignment = NSTextAlignmentCenter;
//    ruler.scaleLable = scaleLable;  //can be nil
}

/**
 横向，朝下
 */
- (void)createHDRuler {
    CYRuler *ruler = [CYRuler horizontalDownRulerWithFrame:CGRectMake(10, 200, 300, 80)];
    [self.view addSubview:ruler];
    ruler.rulerDelegate = self;
    [ruler rulerWithPointerOffset:100.0f startScale:10 endScale:1000 valueOfUnitScale:10 defaultScale:20];
    
    /**自定义属性**/
//    ruler.scaleNumberFont = [UIFont systemFontOfSize:8];
//    ruler.scaleLineColor = [UIColor whiteColor];
//    ruler.scaleNumberColor = [UIColor whiteColor];
    
    /**重设标尺**/
//    [ruler rulerResetPointerOffset:150 startScale:30 endScale:1000 valueOfUnitScale:10 defaultScale:50];
    
    /**自定义指针**/
//    UIView *p = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
//    p.backgroundColor = [UIColor whiteColor];
//    ruler.pointer = p;   //不允许nil
    
    /**自定义文本显示框**/
//    UILabel *scaleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    scaleLable.backgroundColor = [UIColor blueColor];
//    scaleLable.textAlignment = NSTextAlignmentCenter;
//    ruler.scaleLable = scaleLable;   //允许nil
}


#pragma mark 代理实现
- (void)ruler:(CYRuler *)ruler ScaleIs:(NSInteger)scale {
    ruler.scaleLable.text = @(scale).stringValue;
    NSLog(@"当前刻度：%ld",scale);
}

- (void)ruler:(CYRuler *)ruler DidFinishScroll:(BOOL)isFinished {
    NSLog(@"滚动结束");
}


@end
