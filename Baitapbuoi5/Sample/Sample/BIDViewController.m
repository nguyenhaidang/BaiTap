//
//  BIDViewController.m
//  Sample
//
//  Created by nguyen hai dang on 29/11/2013.
//  Copyright (c) 2013 nguyen hai dang. All rights reserved.
//

#import "BIDViewController.h"
#include "DemoStaticLibrary.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    DemoStaticLibrary *demo = [DemoStaticLibrary new];
    NSLog (@"%f",[demo nhan:1.0:2.0]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}



@end
