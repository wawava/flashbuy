//
//  FNHomeVC.m
//  flashbuy
//
//  Created by towne on 7/3/14.
//  Copyright (c) 2014 com.feiniu. All rights reserved.
//

#import "FNhomeVC.h"

@interface FNhomeVC ()

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
    [self installMapAndSearchToNavibar];
    [self installBackArrowToNavibar];
	
    [self createSubviews];
}

-(void)createSubviews {

    UIButton * btn = [UIButton new];
    [btn setFrame:CGRectMake(50, 50, 200, 40)];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
    
}

-(void)searchAction:(id)sender {
    if (self.navigationController.view.frame.origin.x == 0) {
        [UIView animateWithDuration:.1 animations:^{
            self.navigationController.view.frame = CGRectMake(-270, 50, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
        }];
    }else{
        [UIView animateWithDuration:.1 animations:^{
            self.navigationController.view.frame = CGRectMake(0, 0, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
        }];
    }
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
