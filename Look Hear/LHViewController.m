//
//  LHViewController.m
//  Look Hear
//
//  Created by Jared Clement on 4/6/13.
//  Copyright (c) 2013 Jared Clement. All rights reserved.
//

#import "LHViewController.h"

@interface LHViewController ()

@end

@implementation LHViewController
@synthesize touchZone, scroll;

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGRect touchFrame = CGRectMake(screen.origin.x, screen.size.width*0.5, screen.size.height, 300.0);
    
    self.scroll = [[UIScrollView alloc] initWithFrame:touchFrame];
    [self.scroll setBackgroundColor:[UIColor clearColor]];
    [self.scroll setPagingEnabled:TRUE];
    [self.scroll setBounces:FALSE];
    [self.scroll setShowsHorizontalScrollIndicator:FALSE];
    [self.scroll setShowsVerticalScrollIndicator:FALSE];
    self.scroll.delegate = self;
    [self.view addSubview:self.scroll];
    
    page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 388, screen.size.height, 20)];
    [page setNumberOfPages:0];
    [page setCurrentPage:0];
    [page setHidesForSinglePage:TRUE];
    [self.view addSubview:page];
    
    NSArray *a = nil;
    
    [self addMedia:a ForScrollView:scroll];
        
}


-(BOOL)addMedia:(NSArray*)media ForScrollView:(UIScrollView*)scrollView
{
    
    float width = (scrollView.frame.size.width)/3.0;
    float height = (scrollView.frame.size.height);
    int rem;
    
    for (int i = 0; i < 6; i++)
    {
        
        [scrollView setContentSize:CGSizeMake(width*i, height)];
        CGRect r = CGRectMake((i-1)*width, 0, width, height);
        LHMediaView *audio = [[LHMediaView alloc] initWithFrame:r andType:MediaViewTypeAudio];
        
        if (i+1 < 6)
            [audio setUrl:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i+1] ofType:@"m4a"]]];
        else
            [audio setUrl:nil];
        
        NSLog(@"%@", audio.url);
        
        [audio assignName:[NSString stringWithFormat:@"%d",i]];
        [audio setDelegate:self];
                
        /*
        float red = arc4random() % 255;
        float green = arc4random() % 255;
        float blue = arc4random() % 255;
         */
        //UIColor *c = [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:100.0];
        //[audio setBackgroundColor:c];
        
        //[self setBackgroundColor:c];
        [scrollView addSubview:audio];
        
        rem = i/3;
        if (i%3) rem++;
        
        [page setNumberOfPages:rem];
        [page setCurrentPage:0];
    }
    return YES;
}

-(BOOL)selectPlayForMediaView:(LHMediaView*)mediaView
{
    
    if (mediaView.type == -1) return FALSE;
    if (mediaView.url == nil) return FALSE;
    
    NSLog(@"%@", mediaView.url);
        
    LHMediaPlayViewController *media = [[LHMediaPlayViewController alloc] initWithNibName:nil bundle:nil andFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.height, self.view.frame.size.width)];
    
    [media setType:mediaView.type];
    [media setUrl:mediaView.url];
    [media setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:media animated:TRUE completion:^{NSLog(@"Presented");}];
    return TRUE;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"In Delegate");
    CGPoint offset = scrollView.contentOffset;
    float x = offset.x;
    float width = scrollView.frame.size.width;
    float a = x/width;
    NSLog(@"%f / %f = %f",x,width,a);
    
    if ((((int)(round(a*100))) % 100) != 0) a++;
    
    [page setCurrentPage:a];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
