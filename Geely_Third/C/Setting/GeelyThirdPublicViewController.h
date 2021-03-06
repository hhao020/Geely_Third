//
//  GeelyThirdPublicViewController.h
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/22.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPublicViewController.h"

#import "GeelyLeftFrameDynamicView.h"
#import <MediaPlayer/MediaPlayer.h>

@interface GeelyThirdPublicViewController : GeelyPublicViewController {
    MPMusicPlayerController *vvlioce;
    CGFloat volume;
}

@property (nonatomic, strong) UIScrollView *scrollView_;

@property (nonatomic, strong) GelelyLeftContainsView *leftViewContains;

@property (nonatomic, strong) GeelyLeftFrameDynamicView *slideView;

@property (weak, nonatomic) IBOutlet UIButton *volumeLes;

@property (weak, nonatomic) IBOutlet UIButton *homeBtn;

@property (weak, nonatomic) IBOutlet UIButton *volumeAdd;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) UIImageView *imageViewBGBBG;
-(void)addFixedView;

-(void)showPopAnimation;
@end
