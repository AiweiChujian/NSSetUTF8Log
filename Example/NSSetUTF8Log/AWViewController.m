//
//  AWViewController.m
//  NSSetUTF8Log
//
//  Created by oovsxx@163.com on 12/05/2019.
//  Copyright (c) 2019 oovsxx@163.com. All rights reserved.
//

#import "AWViewController.h"

@interface AWViewController ()

@end

@implementation AWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *student1 = @{@"姓名":@"小明",@"性别":@"男",@"年龄":@"14"};
    NSDictionary *student2 = @{@"姓名":@"小红",@"性别":@"女",@"年龄":@"13"};
    NSLog(@"\nstudent1:%@",student1);
    
    NSSet *studentSet = [NSSet setWithObjects:student1,student2, nil];
    
    NSLog(@"\nsudentSet:%@",studentSet);
    
    NSDictionary *class = @{@"班级名称":@"2019级2班",
                            @"学生":studentSet.allObjects,
                            };
    NSLog(@"\nclass:%@",class);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
