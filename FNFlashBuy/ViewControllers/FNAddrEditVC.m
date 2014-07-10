//
//  FNAddrEditVC.m
//  FNFlashBuy
//
//  Created by towne on 7/9/14.
//  Copyright (c) 2014 com.feiniu. All rights reserved.
//

#import "FNAddrEditVC.h"

@interface FNAddrEditVC ()

@end

@implementation FNAddrEditVC

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

- (void)createSubviews {
    
    UIImageView * title = [UIImageView new];
    [title setFrame:CGRectMake(60, 0, 320-60, 57)];
    [title setImage:[UIImage imageNamed:@"addr_edit_title"]];
    [self.view addSubview:title];
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
