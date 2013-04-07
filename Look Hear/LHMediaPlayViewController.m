//
//  LHMediaPlayViewController.m
//  Look Hear
//
//  Created by Eli C Gregory on 4/6/13.
//  Copyright (c) 2013 Jared Clement. All rights reserved.
//

#import "LHMediaPlayViewController.h"

@interface LHMediaPlayViewController ()

@end

@implementation LHMediaPlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andFrame:(CGRect)frame
{
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    self.type = -1;
    self.url = nil;
    
    audioPlayer = nil;
    image = nil;
    imageView = nil;
    videoPlayer = nil;
    videoLayer = nil;
    playPause = nil;
    restart = nil;
    playing = FALSE;
    
    UIView *v = [[UIView alloc] initWithFrame:frame];
    [v setBackgroundColor:[UIColor blackColor]];
    [self setView:v];
    
    UIButton *exit = [UIButton buttonWithType:UIButtonTypeCustom];
    [exit setBackgroundColor:[UIColor clearColor]];
    [exit setFrame:CGRectMake(0, self.view.frame.size.height*.85, self.view.frame.size.width, self.view.frame.size.height*.15)];
    [exit setTitle:@"(   done   )" forState:UIControlStateNormal];
    [exit.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Neue" size:54.0]];
    [exit addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:exit];
    
    return self;
}

- (void)close
{
    [self dismissViewControllerAnimated:TRUE completion:^{NSLog(@"Dismissed");}];
}

- (void)audioplaypause
{
    if (audioPlayer == nil) return;
    
    if (playing)
    {
        [audioPlayer pause];
        [playPause setTitle:@"Play" forState:UIControlStateNormal];
    }
    else
    {
        if (timer) timer = nil;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkPlay) userInfo:nil repeats:TRUE];
        [audioPlayer play];
        [timer fire];
        [playPause setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

- (void)checkPlay
{
    if (![audioPlayer isPlaying])
    {
        [playPause setTitle:@"Play" forState:UIControlStateNormal];
        [timer invalidate];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	
    switch (self.type) {
        case MediaViewTypeAudio:
        {
            NSLog(@"%@", self.url);
            NSError *error;
            NSLog(@"%@", self.url);
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.url error:&error];
            audioPlayer.numberOfLoops = 0;
            
            if (audioPlayer == nil)
                NSLog(@"%@",[error description]);
            else
            {
                [audioPlayer prepareToPlay];
                playPause = [UIButton buttonWithType:UIButtonTypeCustom];
                [playPause setFrame:CGRectMake(200, 200, 300, 300)];
                [playPause setBackgroundColor:[UIColor blueColor]];
                [playPause setTitle:@"Play" forState:UIControlStateNormal];
                //[playPause setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
                [playPause addTarget:self action:@selector(audioplaypause) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:playPause];
            }
        }
            break;
        
        case MediaViewTypeImage:
        {
            
        }
            break;
            
        case MediaViewTypeVideo:
        {
            
        }
            break;
            
        default:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Media Type" message:@"This app does not support that media type." delegate:nil cancelButtonTitle:@"OK." otherButtonTitles:nil, nil];
            [alert show];
            [self close];
        }
            break;
    }
    
    //Build for media type
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
