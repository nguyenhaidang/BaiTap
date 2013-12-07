//
//  BIDViewController.m
//  Baitapbuoi6
//
//  Created by nguyen hai dang on 07/12/2013.
//  Copyright (c) 2013 nguyen hai dang. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSMutableArray *a =[NSMutableArray arrayWithArray:@[@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0]];

    try_backTrack(a, 12,11, 1);

    /* [self refineArray:a];

     NSLog(@"%@",a);*/



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}

void try_backTrack(NSMutableArray *a,int n,int k,int i)
{
    int j;

    for(j=[[a objectAtIndex:i-1]intValue]+1;j<=(n-k+i);j++)
    {
        [a replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:j]];

        if(i==k){

            for(int c=1;c<=k;c++)
            {

                printf(" %d ",[[a objectAtIndex:c]intValue]);
            }

            printf("\n");

        }
        else
            try_backTrack(a, n, k, i+1);

    }
}

-(void)refineArray :(NSMutableArray*)array
{
    for (int i=0; i<[array count]; i++) {

        int j=i+1;

        while(j<[array count]) {

            if([[array objectAtIndex:i]intValue]==[[array objectAtIndex:j]intValue])
            {
                [array removeObjectAtIndex:j];
                
            }
            else
            {
                j++;
            }
        }
    }
    
}

@end
