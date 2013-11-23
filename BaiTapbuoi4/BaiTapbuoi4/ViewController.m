//
//  ViewController.m
//  BaiTapbuoi4
//
//  Created by Hải Đăng on 23/11/2013.
//  Copyright (c) Năm 2013 rikkeisoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ////Ve hinh zigzag
    
    for(int z=0;z<5;z++)
        
    {   if(z==0)
    {
        for(int y=0;y<5;y++)
        {
            if(y==0)
            {
                
                for(int i=0;i<5;i++)
                    printf(" ");
                printf(".");
            }
            else
            {
                for(int i=0;i<7;i++)
                    printf(" ");
                printf(".");
            }
            
        }
        printf("\n");
    }
        if(z!=0)
        {
            for(int y=0;y<5;y++)
            {
                if(y==0)
                {
                    
                    for(int i=0;i<5-z;i++)
                        printf(" ");
                    printf(".");
                    if(z<4)
                    {
                        for(int i=0;i<z*2-1;i++)
                            printf(" ");
                        printf(".");
                    }
                }
                else
                {
                    if(z<4)
                    {
                        for(int i=0;i<5-(z-1)*2;i++)
                            printf(" ");
                        printf(".");
                    }
                    for(int i=0;i<z*2-1;i++)
                        printf(" ");
                    printf(".");
                }
            }
            printf("\n");
        }}
    
    
    ///Ve oto
    printf("\n");
    for(int i=0;i<20;i++)
        printf(" ");
    
    for(int i=0;i<20;i++)
        printf("_");
    
    printf("\n");
    
    for(int i=0;i<19;i++)
        printf(" ");
    printf("/");
    
    for(int i=0;i<19;i++)
        printf(" ");
    printf("/\\");
    printf("\n");
    
    for(int i=0;i<18;i++)
        printf(" ");
    printf("/");
    
    for(int i=0;i<19;i++)
        printf(" ");
    printf("/");
    for(int i=0;i<2;i++)
        printf(" ");
    printf("\\");
    
    printf("\n");
    
    for(int i=0;i<17;i++)
        printf(" ");
    printf(".");
    for(int i=0;i<19;i++)
        printf("-");
    for(int i=0;i<5;i++)
        printf(" ");
    printf("\\");
    
    printf("\n");
    
    for(int i=0;i<5;i++)
        printf(" ");
    printf(".");
    for(int i=0;i<10;i++)
        printf("-");
    printf(".");
    
    for(int i=0;i<3;i++)
        printf(" ");
    for(int i=0;i<5;i++)
        printf("_");
    for(int i=0;i<5;i++)
        printf(" ");
    for(int i=0;i<5;i++)
        printf("_");
    for(int i=0;i<2;i++)
        printf(" ");
    printf(".");
    for(int i=0;i<4;i++)
        printf(" ");
    printf(".");
    for(int i=0;i<9;i++)
        printf("-");
    printf(".");
    printf("\n");
    
    for(int i=0;i<4;i++)
        printf(" ");
    printf(".");
    
    for(int i=0;i<10;i++)
        printf(" ");
    printf(".");
    
    for(int i=0;i<3;i++)
        printf(" ");
    printf("|");
    for(int i=0;i<5;i++)
        printf("_");
    
    printf("|");
    
    for(int i=0;i<3;i++)
        printf(" ");
    printf("|");
    
    for(int i=0;i<5;i++)
        printf("_");
    printf("|");
    
    
    for(int i=0;i<3;i++)
        printf(" ");
    printf(".");
    
    for(int i=0;i<1;i++)
        printf(" ");
    printf(".");
    
    for(int i=0;i<11;i++)
        printf(" ");
    printf(".");
    printf("\n");
    
    for(int i=0;i<3;i++)
        printf(" ");
    printf(".");
    
    for(int i=0;i<10;i++)
        printf("_");
    printf(".");
    
    for(int i=0;i<4;i++)
        printf(" ");
    
    printf("|");
    for(int i=0;i<5;i++)
        printf("_");
    printf("|");
    
    for(int i=0;i<3;i++)
        printf(" ");
    
    printf("|");
    for(int i=0;i<5;i++)
        printf("_");
    printf("|");
    
    for(int i=0;i<4;i++)
        printf(" ");
    printf(".");
    for(int i=0;i<13;i++)
        printf("_");
    printf(".");
    
    printf("\n");
    printf("/");
    for(int i=0;i<51;i++)
        printf("_");
    printf("\\");
    printf("/");
    printf("\n");
    
    printf("\\");
    
    for(int i=0;i<10;i++)
        printf("=");
    
    for(int i=0;i<2;i++)
        printf(" ");
    
    
        printf(". . .");
    
        printf(" ");
    
    for(int i=0;i<20;i++)
        printf("=");
    
    for(int i=0;i<2;i++)
        printf(" ");
    
        printf(". . .");
    
    for(int i=0;i<2;i++)
        printf(" ");
    
    for(int i=0;i<5;i++)
        printf("-");
    
    printf("/");
    
    printf("\n");
    
    printf(" ");
    printf("\\");
    
    for(int i=0;i<5;i++)
        printf("-");
    
     printf("     .  .  . ");
    for(int i=0;i<18;i++)
        printf("-");
    
    printf("  .  .  . ");
    
    for(int i=0;i<4;i++)
        printf("-");
    printf("/");
    printf("\n");
    
    for(int i=0;i<14;i++)
        printf(" ");
    printf("...");
    
    for(int i=0;i<25;i++)
        printf(" ");
    printf("...");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
