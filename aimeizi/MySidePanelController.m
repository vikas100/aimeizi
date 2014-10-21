//
//  MySidePanelController.m
//  aimeizi
//
//  Created by scott on 14-9-6.
//  Copyright (c) 2014年 冯靖. All rights reserved.
//

#import "MySidePanelController.h"
#import "JAHotTopicViewController.h"
#import "JAActiveUserViewController.h"

@interface MySidePanelController ()

@end

@implementation MySidePanelController


- (void)awakeFromNib{
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
    [self setRightPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"rightViewController"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    JAHotTopicViewController *hotTopicViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"hotTopicViewController"];
    hotTopicViewController.title = @"热门讨论";
    self.centerPanel = [[UINavigationController alloc] initWithRootViewController:hotTopicViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
