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


#import "JARightViewController.h"
#import "JASidePanelController.h"

#import "UIViewController+JASidePanel.h"

@interface JARightViewController ()

@end

@implementation JARightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hotTopicPanel.frame = CGRectMake(85.0f, 70.0f, 200.0f, 40.0f);
    self.nodeCategoryPanel.frame = CGRectMake(85.0f, 110.0f, 200.0f, 40.0f);
    self.coolNavPanel.frame = CGRectMake(85.0f, 150.0f, 200.0f, 40.0f);
    self.activeUserPanel.frame = CGRectMake(85.0f, 190.0f, 200.0f, 40.0f);
    self.myHomePanel.frame = CGRectMake(85.0f, 230.0f, 200.0f, 40.0f);
    self.settingPanel.frame = CGRectMake(85.0f, 270.0f, 200.0f, 40.0f);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.label.center = CGPointMake(floorf((self.view.bounds.size.width - self.sidePanelController.rightVisibleWidth) + self.sidePanelController.rightVisibleWidth/2.0f), 45.0f);
}

@end
