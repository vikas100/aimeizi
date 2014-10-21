//
//  JAWelcomeViewController.m
//  aimeizi
//
//  Created by scott on 14-9-7.
//  Copyright (c) 2014年 冯靖. All rights reserved.
//

#import "SMPageControl.h"
#import <QuartzCore/QuartzCore.h>
#import "JAWelcomeViewController.h"
#import "MySidePanelController.h"

@interface JAWelcomeViewController ()

@end

@implementation JAWelcomeViewController

static NSString * const sampleDescription1 = @"不锈钢金属边框，5英寸屏超窄边。小米手机4依然是全球最顶配性能之王。";
static NSString * const sampleDescription2 = @"40道工艺制程，193道工艺精密程序。";
static NSString * const sampleDescription3 = @"最新索尼IMX 214堆栈式相机，拍照更快，画质更好。采用6片式镜头，f1.8超大光圈。硬件级实时HDR与高动态智能闪光改善画质，支持追踪对焦及先拍照后对焦技术，还可拍摄4K视频。";
static NSString * const sampleDescription4 = @"骁龙 TM 8X74 AC 801 四核2.5GHz 处理器，Adreno 330 图形处理器，性能更快同时功耗更低。LPDDR3 3GB 超大极速内存，更快载入大型游戏和应用，更流畅的播放高清视频。";

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"工艺和手感超乎想象";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"一块钢板的艺术之旅";
    page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"索尼1300万像素极速相机";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"3GB超大内存，APP启动速度更快";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    
    [intro showInView:self.view animateDuration:0.3];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - EAIntroDelegate
- (void)introDidFinish:(EAIntroView *)introView{
    MySidePanelController *sidePanelController = [self.storyboard instantiateViewControllerWithIdentifier:@"sidePanelController"];
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:sidePanelController animated:NO completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
