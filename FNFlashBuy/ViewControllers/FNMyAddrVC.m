//
//  FNMyAddrVC.m
//  FNFlashBuy
//
//  Created by towne on 7/8/14.
//  Copyright (c) 2014 com.feiniu. All rights reserved.
//

#import "FNMyAddrVC.h"
#import "FNProductCell.h"

@interface FNMyAddrVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView    * tableview;

@end

@implementation FNMyAddrVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    [self createSubviews];
}

-(void)createSubviews {
    // table view
    CGRect tvRc = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60);
    _tableview = [[UITableView alloc] initWithFrame:tvRc style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [FNcolor sharedInstance].white;
    [self.view addSubview:_tableview];
    
    UIImageView * title = [UIImageView new];
    [title setFrame:CGRectMake(60, 0, 320-60, 57)];
    [title setImage:[UIImage imageNamed:@"addr_title"]];
    [self.view addSubview:title];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FNProductCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FNProductCell"];
    if (cell == nil)
    {
        cell = [FNProductCell new];
        if (indexPath.row != 3) {
            UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addr_cell"]];
            [imageview setCenter:CGPointMake(160, 40)];
            [cell addSubview:imageview];
        }
        else
        {
            UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add_addr"]];
            [imageview setCenter:CGPointMake(160, 40)];
            [cell addSubview:imageview];
        }
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 158/2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
