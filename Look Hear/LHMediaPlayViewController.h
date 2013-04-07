//
//  LHMediaPlayViewController.h
//  Look Hear
//
//  Created by Eli C Gregory on 4/6/13.
//  Copyright (c) 2013 Jared Clement. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>    

@interface LHMediaPlayViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    UIImage *image;
    UIImageView *imageView;
    AVPlayer *videoPlayer;
    AVPlayerLayer *videoLayer;
    UIButton *playPause;
    UIButton *restart;
    BOOL playing;
    NSTimer *timer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andFrame:(CGRect)frame;

@property (nonatomic) MediaViewType type;
@property (nonatomic) NSURL *url;

@end
