//
//  LHViewController.h
//  Look Hear
//
//  Created by Jared Clement on 4/6/13.
//  Copyright (c) 2013 Jared Clement. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHMediaView.h"
#import "LHMediaPlayViewController.h"

@interface LHViewController : UIViewController <NSURLConnectionDelegate, UIScrollViewDelegate, MediaViewDelegate>
{
    
    UIView *touchZone;
    UIScrollView *scroll;
    NSMutableArray *mediaItems;
    UIPageControl *page;
    
}

@property (nonatomic) UIView *touchZone;
@property (nonatomic) UIScrollView *scroll;

@end
