//
//  LHMediaView.m
//  Look Hear
//
//  Created by Jared Clement on 4/6/13.
//  Copyright (c) 2013 Jared Clement. All rights reserved.
//

#import "LHMediaView.h"

@implementation LHMediaView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(BOOL)assignName:(NSString *)name
{
    self.name = name;
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height*0.65, self.frame.size.width, 20.0)];
    [l setText:self.name];
    [l setTextAlignment:NSTextAlignmentCenter];
    [l setBackgroundColor:[UIColor clearColor]];
    [l setTextColor:[UIColor whiteColor]];
    [l setFont:[UIFont fontWithName:@"Helvetica-Neue" size:34.0]];
    [self addSubview:l];
    return TRUE;
}

-(id)initWithFrame:(CGRect)frame andType:(MediaViewType)mediaType
{
    
    _type = mediaType;
    
    self = [self initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:TRUE];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
    
    UIImage *i;
    
    switch (_type)
    {
        case MediaViewTypeAudio:
        {
            i = [UIImage imageNamed:@"media_audio.png"];
        }
            break;
            
        case MediaViewTypeVideo:
        {
            //i = [UIImage imageNamed:@"background_Image.png"];
        }
            break;
            
        case MediaViewTypeImage:
        {
            //i = [UIImage imageNamed:@"background_Image.png"];
        }
            break;
        default:
        {
            //i = [UIImage imageNamed:@"background_Image.png"];
        }
            return nil;
            break;
    }
    [self setImage:i];
    


    return self;
}

-(void)tap
{
    [self.delegate selectPlayForMediaView:self];
}

@end
