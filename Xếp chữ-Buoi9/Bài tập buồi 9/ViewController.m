//
//  ViewController.m
//  Bài tập buồi 9
//
//  Created by nguyen hai dang on 25/12/2013.
//  Copyright (c) Năm 2013 nguyen hai dang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSMutableArray *arrayImage;
    
    UIImageView *imageView;
    
    NSTimer *timer;
    
    NSMutableString *textText;
}

@property (weak, nonatomic) IBOutlet UITextField *text;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    textText = [NSMutableString new];
    
    NSArray *a=[[NSBundle mainBundle]pathsForResourcesOfType:@"jpg"     inDirectory:@"image"];
    
    //    NSLog(@"%@",a);
    
    arrayImage = [NSMutableArray new];
    
    for(int i=0;i<[a count];i++)
        
    {
        NSString *urlString = a[i];
        
        UIImage *image =[[UIImage alloc]initWithContentsOfFile:urlString];
        
       imageView = [[UIImageView alloc]initWithFrame:CGRectMake(125, 0, 70, 70)];
        
        imageView.image = image;
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cham:)];
        
        [imageView addGestureRecognizer:tap];
        
        [self.view addSubview:imageView];
        
        imageView.tag=i;
        
        tap.delegate=self;
        
        tap.numberOfTapsRequired=1;
        
        imageView.userInteractionEnabled=YES;
        
        [imageView addGestureRecognizer:tap];
        
        CGAffineTransform  maxtrix = CGAffineTransformRotate(imageView.transform, 2*M_PI/(i*2+1));
        
        imageView.transform=maxtrix;
        
        [arrayImage addObject:imageView];
        
    }
    
    NSLog(@"%d",[arrayImage count]);
    
    timer = [NSTimer timerWithTimeInterval:0.15 target:self selector:@selector(quay) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    
    
    
    
    
}

-(IBAction)cham:(UITapGestureRecognizer*)tapRecpgmozer {

    switch (tapRecpgmozer.view.tag) {
        case 0:
             [textText appendString:@"u"];
            
            _text.text = textText;
            
            break;
        case 1:
            
            [textText appendString:@"v"];
            
            _text.text = textText;
            
            break;
            
        case 2:
            
            [textText appendString:@"w"];
            
            _text.text = textText;
            
            break;
            
        case 3:
            
            [textText appendString:@"x"];
            
            _text.text = textText;
            
            break;
            
        case 4:
            
            [textText appendString:@"y"];
            
            _text.text = textText;
            
            break;
            
        case 5:
            
            [textText appendString:@"z"];
            
            _text.text = textText;
            
            break;
            
        default:
            break;
    }
    
    
}

-(void)setUp
{
    
    
    
    for(int i=0;i<[arrayImage count];i++)
        
    {
        imageView = [arrayImage objectAtIndex:i];
        
        
        imageView.transform = CGAffineTransformIdentity;
        
        imageView.frame = CGRectMake(125, 0, 70, 70);
        
        
        
        CGAffineTransform  maxtrix = CGAffineTransformRotate(imageView.transform, 2*M_PI/(i*2+1));
        
        imageView.transform=maxtrix;
        
    }
    
    
    
    
}

-(void)quay
{
    for(int i=0;i<[arrayImage count];i++)
    {
        imageView =arrayImage[i];
        
        CGAffineTransform maxtrix = CGAffineTransformTranslate(imageView.transform, rand()%10, rand()%10);
        
        //        maxtrix = CGAffineTransformRotate(maxtrix,rand()%3);
        
        imageView.transform=maxtrix;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)reset:(id)sender {
    
    [self setUp];
    
    textText = [NSMutableString new];
    
    _text.text = textText;
}

@end
