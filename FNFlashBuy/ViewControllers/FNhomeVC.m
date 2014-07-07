//
//  FNHomeVC.m
//  flashbuy
//
//  Created by towne on 7/3/14.
//  Copyright (c) 2014 com.feiniu. All rights reserved.
//

#import "FNhomeVC.h"
#import "FNProductCell.h"
#import "UIView+LoadFromNib.h"
#import "NSObject+IOS7UI.h"

@interface FNhomeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableview;

@property (nonatomic, strong) UIImageView * leftnavigationview;

@end

@implementation FNhomeVC

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
    
//    [self installLogoToNavibar];
//    [self installMapAndSearchToNavibar];
//    [self installBackArrowToNavibar];
    [self.navigationController setNavigationBarHidden:YES];
	
    [self createSubviews];
}

-(void)createSubviews {
    
    // table view
    CGRect tvRc = self.view.frame;
    _tableview = [[UITableView alloc] initWithFrame:tvRc style:UITableViewStylePlain];
    
    [self.view addSubview:_tableview];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [FNcolor sharedInstance].silver;
    
    _leftnavigationview = [UIImageView new];
    [_leftnavigationview setFrame:CGRectMake(0, 0, 117/2, 778/2)];
    [_leftnavigationview setImage:[UIImage imageNamed:@"leftnavigation"]];
    [self.view addSubview:_leftnavigationview];
    
}

-(void)searchAction:(id)sender {
    if (self.navigationController.view.frame.origin.x == 0) {
        [UIView animateWithDuration:.1 animations:^{
            self.navigationController.view.frame = CGRectMake(170, 50, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
        }];
    }else{
        [UIView animateWithDuration:.1 animations:^{
            self.navigationController.view.frame = CGRectMake(0, 0, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
        }];
    }
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FNProductCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FNProductCell"];
    if (cell == nil)
    {
        cell = [FNProductCell new];
        NSString * strimg = [NSString stringWithFormat:@"cell%ld",indexPath.row%4];
        UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:strimg]];
        [cell addSubview:imageview];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 158/2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@">>");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
