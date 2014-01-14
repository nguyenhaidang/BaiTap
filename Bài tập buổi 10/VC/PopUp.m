//
//  PopUp.m
//  bar
//
//  Created by TechMaster on 1/11/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "PopUp.h"

@interface PopUp ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property(nonatomic,strong) NSArray*anh;
@end

@implementation PopUp

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
	
    _anh = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"sda"];
    
    _scrollView.contentSize=CGSizeMake([_anh count]*222.0,_scrollView.frame.size.height);
    
    for (int i=0; i<[_anh count];i++) {
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(222.0*i, 0,222.0, self.scrollView.frame.size.height)];
        
        imageView.image=[UIImage imageWithContentsOfFile:[_anh objectAtIndex:i]];
        
        [self.scrollView addSubview:imageView];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)hideView:(id)sender {
    
//    self.view.hidden=YES;
    
    self.navigationController.navigationBar.hidden=NO;
    
    [UIView animateWithDuration:0.35 animations:^{
        
        self.view.transform=CGAffineTransformMakeTranslation(0, 600);
    }];

}

@end
