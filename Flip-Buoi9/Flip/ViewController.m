//
//  ViewController.m
//  Flip
//
//  Created by TechMaster on 12/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#import "Square.h"

@interface ViewController ()

{
    NSMutableArray *arrayImage;
    
    NSMutableArray *randomImages;
    
    int open;
    
    int tag;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self creat];
}
- (IBAction)reset:(id)sender {
    
    for (UIView *view in self.view.subviews) {
        
        if (![view isKindOfClass:[UIButton class]]) {
            
            
            [view removeFromSuperview];
            
        }
        
    }
    
    [self creat];
}

-(void)creat
{
    arrayImage = [NSMutableArray new];
    
    open = 0;
    
    NSArray *path= [[NSBundle mainBundle]pathsForResourcesOfType:@"jpeg" inDirectory:@"image"];
    
    for (int i=0; i<[path count]; i++) {
        
        UIImage *image = [UIImage imageWithContentsOfFile:[path objectAtIndex:i]];
        
        Square *  square = [Square new];
        
        square.image = image;
        
        square.same = i;
        
        [arrayImage addObject:square];
        
        [arrayImage addObject:square];
        
    }
    
    NSLog(@"%@",arrayImage);
    
    NSLog(@"%d",[arrayImage count]);
    
    randomImages = [self creatRandomPositionOfArray:arrayImage];
    
    for (int i=0; i<[randomImages count]; i++) {
        
        if (i<[randomImages count]/2) {
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20*i+30*i, 20, 30, 30)];
            
            imageView.tag=i;
            
            Square * square  = [randomImages objectAtIndex:i];
            
            imageView.image = square.image;
            
            imageView.userInteractionEnabled=YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(choose:)];
            
            [imageView addGestureRecognizer:tap];
            
            tap.delegate=self;
            
            UIView *overlay = [[UIView alloc]initWithFrame:imageView.frame];
            
            overlay.tag = [randomImages count]+imageView.tag;
            
            overlay.backgroundColor = [UIColor greenColor];
            
            overlay.userInteractionEnabled=NO;
            
            //            imageView.backgroundColor=[UIColor greenColor];
            
            [self.view addSubview:imageView];
            
            [self.view addSubview:overlay];
        }
        
        else {
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20*(i-[randomImages count]/2)+30*(i-[randomImages count]/2), 60, 30, 30)];
            
            imageView.tag=i;
            
            imageView.backgroundColor=[UIColor greenColor];
            
            Square *   square  = [randomImages objectAtIndex:i];
            
            imageView.userInteractionEnabled=YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(choose:)];
            
            [imageView addGestureRecognizer:tap];
            
            tap.delegate=self;
            
            imageView.image = square.image;
            
            UIView *overlay = [[UIView alloc]initWithFrame:imageView.frame];
            
            overlay.backgroundColor = [UIColor greenColor];
            
            overlay.userInteractionEnabled=NO;
            
            overlay.tag = [randomImages count]+imageView.tag;
            
            [self.view addSubview:imageView];
            
            [self.view addSubview:overlay];
        }
        
        
    }
    
}

-(NSMutableArray*)creatRandomPositionOfArray:(NSMutableArray*)array

{
    NSMutableArray *randomArray = [NSMutableArray new];
    
    while ([array count]>0) {
        
        int i=arc4random()%[array count];
        
        [randomArray addObject:[array objectAtIndex:i]];
        
        [array removeObjectAtIndex:i];
        
        NSLog(@"%d",i);
    }
    
    
    return randomArray;
}

-(IBAction)choose:(UITapGestureRecognizer*)sender

{
    
    //    [self.view viewWithTag:sender.view.tag+[randomImages count]].hidden=YES;
    
    if(open==0&&[self.view viewWithTag:sender.view.tag+[randomImages count]].hidden==NO)
    {
        
        [self.view viewWithTag:sender.view.tag+[randomImages count]].hidden=YES;
        
        tag =sender.view.tag+[randomImages count];
        
        open++;
        
        NSLog(@"open:%d",open);
        
        return;
        
    }
    
    
    if (open==1&&[self.view viewWithTag:sender.view.tag+[randomImages count]].hidden==NO) {
        
        open =0;
        
        Square *i= [randomImages objectAtIndex:tag-[randomImages count]];
        
        Square *j = [randomImages objectAtIndex:sender.view.tag];
        
        NSLog(@"i:%d-----j:%d",i.same,j.same);
        
        if (i.same==j.same) {
            
            
            [self.view viewWithTag:tag].hidden=YES;
            
            [UIView animateWithDuration:0.8 animations:^{
                
                CGRect theFrame = [self.view viewWithTag:sender.view.tag+[randomImages count]].frame;
                
                theFrame.size.height = 0.0f;
                
                [self.view viewWithTag:sender.view.tag+[randomImages count]].frame = theFrame;
                
                
            }];
        }
        else
        {
            
            [self.view viewWithTag:sender.view.tag+[randomImages count]].hidden=NO;
            
            [self.view viewWithTag:tag].hidden=NO;
            
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
