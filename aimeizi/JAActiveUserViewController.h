//
//  JAActiveUserViewController.h
//  JASidePanels
//
//  Created by scott on 14-9-3.
//
//

#import <UIKit/UIKit.h>

// 活跃会员
@interface JAActiveUserViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
