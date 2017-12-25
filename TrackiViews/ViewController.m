//
//  ViewController.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/13.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy) NSString *a;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
  
   
}
//- (void)setA:(NSString *)a {
//    _a = a;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
