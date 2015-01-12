//
//  ViewController.m
//  BounceButtonsTest
//
//  Created by Charles Leo on 15/1/9.
//  Copyright (c) 2015年 Charles Leo. All rights reserved.
//

#import "ViewController.h"
#import "PresentViewController.h"
@interface ViewController ()
{
    UIView * alertView;
    NSMutableArray * buttonArray;
    BOOL isVisible;
}

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    alertView = [[UIView alloc]init];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 35, 35);
    button.center = self.view.center;
    [button setBackgroundImage:[UIImage imageNamed:@"menuIcon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barRight = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barRight;
    
    buttonArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSArray *imageList = @[[UIImage imageNamed:@"menuChat.png"], [UIImage imageNamed:@"menuUsers.png"], [UIImage imageNamed:@"menuMap.png"], [UIImage imageNamed:@"menuClose.png"]];
    for ( int i = 0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[imageList objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(20+ (80 * i), 300 , 40, 40);
        button.tag = 200 + i;
        [button addTarget:self action:@selector(onMenuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonArray addObject:button];
    }
   
    isVisible = NO;

}
 -(void)viewDidAppear:(BOOL)animated
{
    for (UIButton *button in buttonArray) {
        [alertView addSubview:button];
    }
    alertView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5f];
    alertView.tag = 100;
    alertView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:alertView];
    
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * visualView = [[UIVisualEffectView alloc]initWithEffect:effect];
    [self.view insertSubview:visualView aboveSubview:alertView];
}

- (void)buttonClick:(UIButton *)sender
{
    
    PresentViewController * presentView = [[PresentViewController alloc]init];
    [self presentViewController:presentView animated:YES completion:nil];
    
    
    /*
    
    UIView * view = [self.view viewWithTag:100];
    if (isVisible == NO) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -self.view.frame.size.height);
//                view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            }];
        });
        
        for (UIButton *button in buttonArray) {
            [NSThread sleepForTimeInterval:0.02f];
            dispatch_async(dispatch_get_main_queue(), ^{
                button.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 20, 40);
                [UIView animateWithDuration:0.5f
                                      delay:0.3f
                     usingSpringWithDamping:.3f
                      initialSpringVelocity:10.0f
                                    options:0 animations:^{
                                        button.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
                                    }
                                 completion:^(BOOL finished) {
                                 }];
            });
        }
        isVisible = YES;
    }
    else
    {
        [UIView animateWithDuration:0.35 animations:^{
            
            view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
//            view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
          
            isVisible = NO;
        }];
        
    }
     */
    
}
-(void)onMenuButtonClick:(UIButton *)button
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
