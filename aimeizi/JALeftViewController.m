/*
 Copyright (c) 2012 Jesse Andersen. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 If you happen to meet one of the copyright holders in a bar you are obligated
 to buy them one pint of beer.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */



#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

#import "JALeftViewController.h"
#import "JARightViewController.h"

#import "JAHotTopicViewController.h"
#import "JANodeCategoryViewController.h"
#import "JACoolNavViewController.h"
#import "JAActiveUserViewController.h"
#import "JAMyHomeViewController.h"
#import "JASettingViewController.h"

@interface JALeftViewController ()

@property (nonatomic, weak) UILabel *label;

@property (nonatomic, weak) UIButton *hotTopicPanel;

@property (nonatomic,weak) UIButton *nodeCategoryPanel;

@property (nonatomic,weak) UIButton *coolNavPanel;

@property (nonatomic,weak) UIButton *activeUserPanel;

@property (nonatomic,weak) UIButton *myHomePanel;

@property (nonatomic,weak) UIButton *settingPanel;

@end

@implementation JALeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor darkGrayColor];
	
	UILabel *label  = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
	label.text = @"Ruby China";
	[label sizeToFit];
	label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:label];
    self.label = label;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 70.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"热门讨论" forState:UIControlStateNormal];
    button.tintColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(hotTopicTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.hotTopicPanel = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 110.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"节点分类" forState:UIControlStateNormal];
    button.tintColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nodeCategoryTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.nodeCategoryPanel = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 150.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"酷站导航" forState:UIControlStateNormal];
    button.tintColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(coolNavTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.coolNavPanel = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 190.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"活跃会员" forState:UIControlStateNormal];
    button.tintColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(activeUserTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.activeUserPanel = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 230.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"我的主页" forState:UIControlStateNormal];
    button.tintColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(myHomeTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.myHomePanel = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 270.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"更多设置" forState:UIControlStateNormal];
    button.tintColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(settingTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.settingPanel = button;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.label.center = CGPointMake(floorf(self.sidePanelController.leftVisibleWidth/2.0f), 45.0f);
}

#pragma mark - Button Actions

- (void)hotTopicTapped:(id)sender {
    JAHotTopicViewController *hotTopicViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"hotTopicViewController"];
    hotTopicViewController.title = @"热门讨论";
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:hotTopicViewController];
}

- (void)nodeCategoryTapped:(id)sender {
    JANodeCategoryViewController *nodeCategoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"nodeCategoryViewController"];    nodeCategoryViewController.title = @"节点分类";
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:nodeCategoryViewController];
}

- (void)coolNavTapped:(id)sender {
    JACoolNavViewController *coolNavViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"coolNavViewController"];
    coolNavViewController.title = @"酷站导航";
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:coolNavViewController];
}

- (void)activeUserTapped:(id)sender {
    JAActiveUserViewController *activeUserViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"activeUserViewController"];
    activeUserViewController.title = @"活跃会员";
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:activeUserViewController];
}

- (void)myHomeTapped:(id)sender {
    JAMyHomeViewController *myHomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myHomeViewController"];
    myHomeViewController.title = @"我的主页";
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:myHomeViewController];
}

- (void)settingTapped:(id)sender {
    JASettingViewController *settingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingViewController"];
    settingViewController.title = @"更多设置";
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:settingViewController];
}

@end
