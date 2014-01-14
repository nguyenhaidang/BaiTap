//
//  SearchVC.m
//  bar
//
//  Created by TechMaster on 1/14/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "SearchVC.h"

@interface SearchVC ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchVC

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
	
    [_searchBar setImage:[UIImage imageNamed:@"find.png"] forSearchBarIcon: UISearchBarIconSearch state:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
