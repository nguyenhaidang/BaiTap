//
//  ViewController.m
//  ParseHTMLfast
//
//  Created by nguyen hai dang on 27/12/2013.
//  Copyright (c) Năm 2013 nguyen hai dang. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "TFHpple.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;

@property(strong,nonatomic)NSMutableArray *arrayOfTitles;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addObserver:self forKeyPath:@"arrayOfTitles" options:NSKeyValueObservingOptionNew context:NULL];
    
    NSOperationQueue* operationQueue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation* secondOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        [self parseHTMLfast];
    }];
    
    [operationQueue addOperation:secondOperation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
   if([keyPath isEqualToString:@"arrayOfTitles"])
       
   {
       [self.table reloadData];

   }
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayOfTitles count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    static NSString* CellIdentifier= @"CellIdentifier";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    
    
  cell.textLabel.text = [_arrayOfTitles objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)parseHTMLfast
{
    
        _arrayOfTitles = [NSMutableArray new];
        
      AFHTTPRequestOperationManager*manager = [AFHTTPRequestOperationManager manager];
    
      manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://blogtruyen.com/truyen/bleach" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        TFHpple *imageParse = [[TFHpple alloc]initWithHTMLData:responseObject];
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",string);
        
        NSString *imageXpathQuerryString = @"//div[@class='danhsach']/div";
        
        
        NSArray *imagesNodes = [imageParse searchWithXPathQuery:imageXpathQuerryString];

        
        //Bị đứt mạng ko parse được dữ liệu bị lỗi NSRangeException
        
        [self willChangeValueForKey:@"arrayOfTitles"];
        
        for(TFHppleElement *element in imagesNodes)
        {
            
            NSLog(@"%@",element);

            
//            [_arrayOfTitles addObject: str ];
            
            
        }
        
        
        NSLog(@"abc%d",[imagesNodes count]);
        [self didChangeValueForKey:@"arrayOfTitles"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
     
        
        //    NSLog(@"%@",_arrayOfTitles);
        
    

    
    
}
@end
