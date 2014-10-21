//
//  JAHostTopicViewController.m
//  JASidePanels
//
//  Created by scott on 14-9-3.
//
//

#import "JAHotTopicViewController.h"
#import <SVProgressHUD.h>
// 热门讨论
@interface JAHotTopicViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentContrl;

@end


@implementation JAHotTopicViewController

@synthesize tableView = _tableView;

UIRefreshControl *refreshControl;

NSMutableArray *array;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"热门讨论";
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = [UIColor purpleColor];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self
                       action:@selector(refresh)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    //请求数据
    //[self refresh];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    if (array) {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return 1;
        
    } else {
        
        // Display a message when the table is empty
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"No data is currently available. Please pull down to refresh.";
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
        [messageLabel sizeToFit];
        
        self.tableView.backgroundView = messageLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *story = (NSDictionary*)array[indexPath.row];
    cell.textLabel.text = [story objectForKey:@"title"];
    return cell;
}


//刷新数据 refresh 或 pull to refresh
- (void)refresh{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    NSString * url;
    
    switch (self.segmentContrl.selectedSegmentIndex) {
        case 0:
            url = @"http://news-at.zhihu.com/api/3/news/latest";
            break;
        case 1:
            url = @"http://news-at.zhihu.com/api/3/news/before/20140914";
            break;
        case 2:
            url = @"http://news-at.zhihu.com/api/3/news/before/20140913";
            break;
        case 3:
            url = @"http://news-at.zhihu.com/api/3/news/before/20140912";
            break;
        default:
            url = @"http://news-at.zhihu.com/api/3/news/before/20140910";
            break;
    }
    
    [self fetchData:url];
    
}

//请求数据
- (void)fetchData:(NSString *) urlString{
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError) {
            NSLog(@"网络异常:%@",connectionError.localizedDescription);
        }else{
            NSError *error;
            
            id jsonString = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!error){
                if ([jsonString isKindOfClass:[NSDictionary class]]) {
                    array = [(NSDictionary*)jsonString objectForKey:@"stories"];
                }
                [self reloadData];
            }else{
                NSLog(@"抓取到的json数据异常:%@",error.localizedDescription);
            }
        }
    }];

}

//更新数据源
- (void)reloadData
{
    // Reload table data
    [self.tableView reloadData];
    
    // End the refreshing
    if (refreshControl) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        refreshControl.attributedTitle = attributedTitle;
        [refreshControl endRefreshing];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
