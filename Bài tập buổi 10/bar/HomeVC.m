//
//  HomeVC.m
//  bar
//
//  Created by TechMaster on 1/10/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "HomeVC.h"
#import "PopUp.h"
@interface HomeVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *banner;
@property (strong, nonatomic) NSMutableArray *anh;
@property (strong, nonatomic) NSMutableArray *anhNewProducts;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeBarButton;
@property(assign,nonatomic)  CGPoint offSet;
@property(assign,nonatomic)  BOOL leftToRight;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation HomeVC


- (IBAction)buy1:(id)sender {
    NSLog(@"Buy");
    
    [self animationBuy:@"a"];
}


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
    
    UIImageView *a=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,44,44)];
    
    a.image=[UIImage imageNamed:@"back.png"];
    
    NSLog(@"height %f",_homeBarButton.width);
    
    _leftToRight=YES;
    
    _anhNewProducts = [NSMutableArray new];
    
    _anh = [NSMutableArray new];
    
    NSArray *anh1=[[NSBundle mainBundle]pathsForResourcesOfType:@"jpeg" inDirectory:@"Shop"];
    
    [_anh addObjectsFromArray:anh1];
    
    _banner.contentSize=CGSizeMake(320.0*[_anh count],CGRectGetHeight(_banner.frame));
    
    for (int i=0; i<[_anh count]; i++) {
        
        _imageView = [UIImageView new];
        
        _imageView.backgroundColor=[UIColor greenColor];
        
        CGRect frame = _banner.frame;
        
        frame.size.width = 320.0;
        
        frame.origin.x = 320.0 * i;
        
        frame.origin.y = 0;
        
        _imageView.frame = frame;
        
        _imageView.image=[UIImage imageWithContentsOfFile:[_anh objectAtIndex:i]];
        
        _imageView.tag=i;
        
        
        [_banner addSubview:_imageView];
    }
    
    if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
    
        self.automaticallyAdjustsScrollViewInsets=NO;}
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(automatic) userInfo:nil repeats:YES];
    
    
    
}



- (IBAction)showInformation:(id)sender {
    
    NSLog(@"information");
   
    self.navigationController.navigationBar.hidden=YES;
    
    CGRect frame=self.view.frame;
    
    if([[UIDevice currentDevice].systemVersion floatValue]<7.0){
    
        frame.origin.y=-44;}
    
    self.view.frame=frame;
    
    PopUp *popUp =[self.storyboard instantiateViewControllerWithIdentifier:@"popup"];
    
    popUp.view.hidden=NO;
    
    [self addChildViewController:popUp];
    
    [self.view addSubview:popUp.view];
    
     popUp.view.transform=CGAffineTransformMakeTranslation(0, 600);
    
    [UIView animateWithDuration:0.35 animations:^{
        
         popUp.view.transform=CGAffineTransformMakeTranslation(0, 0);
    }];
        
    
    
}

-(void)automatic
{
    
    
    NSLog(@"%f",_offSet.x);
    
    if(_leftToRight&&_offSet.x<([_anh count]-1)*320.0)
        
    {
        _offSet.x=320.0+_offSet.x;
        
        [_banner setContentOffset:_offSet animated:YES];
        
        return;
    }
    
    if(_leftToRight&&_offSet.x>=([_anh count]-1)*320.0)
    {
        _leftToRight=NO;
        
        _offSet.x=_offSet.x-320.0;
        
        [_banner setContentOffset:_offSet animated:YES];
        return;
    }
    
    if(!_leftToRight&&_offSet.x<([_anh count]*320.0-1)&&_offSet.x>0)
    {
        _offSet.x=_offSet.x-320.0;
        
        [_banner setContentOffset:_offSet animated:YES];
        
        return;
    }
    
    
    if(!_leftToRight&&_offSet.x<=0)
    {
        _leftToRight=YES;
        
        _offSet.x=_offSet.x+320.0;
        
        [_banner setContentOffset:_offSet animated:YES];
        
        return;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)animationBuy:(NSString*)amount
{
    
    NSMutableString* mount = [NSMutableString new];
    
    [mount appendFormat:@"+1"];
    
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0,0,30,30)];
    
    label.text=mount;
    
    label.backgroundColor=[UIColor redColor];
    
    label.transform=CGAffineTransformMakeTranslation(0, 600);
    
    [self.view addSubview:label];
    
    [UIView animateWithDuration:1.5 animations:^{
        
        label.transform=CGAffineTransformMakeTranslation(0, -100);
    }];
    
    
}
@end
