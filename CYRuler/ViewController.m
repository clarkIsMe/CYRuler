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

@property (nonatomic,strong) CYRuler *ruler1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    [self createHDRuler];
    
    [self createHURuler];
    
}

/**
 横向，朝上
 */
- (void)createHURuler {
    CYRuler *ruler1 = [CYRuler horizontalUpRulerWithFrame:CGRectMake(10, 300, 300, 80)];
    [self.view addSubview:ruler1];
    ruler1.rulerDelegate = self;
    [ruler1 rulerWithPointerOffset:100.0f startScale:10 endScale:1000 valueOfUnitScale:10 defaultScale:20];
    
    /**自定义属性**/
//    ruler1.scaleNumberFont = [UIFont systemFontOfSize:8];
//    ruler1.scaleLineColor = [UIColor whiteColor];
//    ruler1.scaleNumberColor = [UIColor whiteColor];
    
    /**重设标尺**/
//    [ruler1 rulerResetPointerOffset:150 startScale:30 endScale:1000 valueOfUnitScale:10 defaultScale:50];
    
    /**自定义指针**/
//    UIView *p = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
//    p.backgroundColor = [UIColor whiteColor];
//    ruler1.pointer = p;   //不允许nil
    
    /**自定义文本显示框**/
//    UILabel *scaleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    scaleLable.backgroundColor = [UIColor blueColor];
//    scaleLable.textAlignment = NSTextAlignmentCenter;
//    ruler1.scaleLable = nil;  //允许nil
}

/**
 横向，朝下
 */
- (void)createHDRuler {
    CYRuler *ruler2 = [CYRuler horizontalDownRulerWithFrame:CGRectMake(10, 100, 300, 80)];
    [self.view addSubview:ruler2];
    ruler2.rulerDelegate = self;
    [ruler2 rulerWithPointerOffset:100.0f startScale:10 endScale:1000 valueOfUnitScale:10 defaultScale:20];
    
    /**自定义属性**/
//    ruler2.scaleNumberFont = [UIFont systemFontOfSize:8];
//    ruler2.scaleLineColor = [UIColor whiteColor];
//    ruler2.scaleNumberColor = [UIColor whiteColor];
    
    /**重设标尺**/
//    [ruler2 rulerResetPointerOffset:150 startScale:30 endScale:1000 valueOfUnitScale:10 defaultScale:50];
    
    /**自定义指针**/
//    UIView *p = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
//    p.backgroundColor = [UIColor whiteColor];
//    ruler2.pointer = p;   //不允许nil
    
    /**自定义文本显示框**/
//    UILabel *scaleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    scaleLable.backgroundColor = [UIColor blueColor];
//    scaleLable.textAlignment = NSTextAlignmentCenter;
//    ruler2.scaleLable = scaleLable;   //允许nil
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
