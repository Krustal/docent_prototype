//
//  LHMediaView.h
//  Look Hear
//
//  Created by Jared Clement on 4/6/13.
//  Copyright (c) 2013 Jared Clement. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHMediaView;
@protocol MediaViewDelegate <NSObject>
@required
-(BOOL)selectPlayForMediaView:(LHMediaView*)mediaView;
@end

@interface LHMediaView : UIImageView

@property (nonatomic) MediaViewType type;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSString *name;
@property (nonatomic) id <MediaViewDelegate> delegate;

-(id)initWithFrame:(CGRect)frame andType:(MediaViewType)mediaType;

-(BOOL)assignName:(NSString *)name;

@end
