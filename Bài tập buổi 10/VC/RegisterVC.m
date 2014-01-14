//
//  RegisterVC.m
//  bar
//
//  Created by TechMaster on 1/11/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *noteTextVIew;

@end

@implementation RegisterVC

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
    self.navigationItem.leftBarButtonItem.title=@"abc";
    
	// Do any additional setup after loading the view.
    
    _noteTextVIew.layer.borderWidth=2.0;
    
    _noteTextVIew.layer.borderColor=[[UIColor brownColor]CGColor];
    
    if([[UIDevice currentDevice].systemVersion floatValue]>=7.0)
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _scrollView.contentSize=CGSizeMake(320,1270);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
