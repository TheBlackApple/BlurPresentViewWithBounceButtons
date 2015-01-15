//
//  ViewController.m
//  BounceButtonsTest
//
//  Created by Charles Leo on 15/1/9.
//  Copyright (c) 2015年 Charles Leo. All rights reserved.
//

#import "ViewController.h"
#import "PresentViewController.h"

#define kHeight [UIScreen mainScreen].bounds.size.height
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 35, 35);
    button.center = self.view.center;
    [button setBackgroundImage:[UIImage imageNamed:@"menuIcon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barRight = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barRight;
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight/2)];
    imageView.image = [UIImage imageNamed:@"IMG_0117.JPG"];
    [self.view addSubview:imageView];
    

    
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, kHeight - 200, kWidth, 50)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blueColor];
    label.font = [UIFont boldSystemFontOfSize:14.0f];
    label.text = @"模仿新浪微博菜单效果";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];

}

- (void)buttonClick:(UIButton *)sender
{
    
    PresentViewController * presentView = [[PresentViewController alloc]init];
    [self presentViewController:presentView animated:YES completion:nil];
    
}
-(void)onMenuButtonClick:(UIButton *)button
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
