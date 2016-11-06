//
//  VideoViewerController.m
//  WowzaGoCoderSDKSampleApp
//
//  Created by michael russell on 2016-11-06.
//  Copyright © 2016 HQ, Inc. All rights reserved.
//

#import "VideoViewerController.h"



@interface VideoViewerController ()

@end

@implementation VideoViewerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self playStream];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#warning MPMoviePlayerController is depricated - should use AVPlayerViewController

-(void)playStream
{
    NSURL *url = [NSURL URLWithString:_stream];
    _player =  [[MPMoviePlayerController alloc]  initWithContentURL:url];
                  
    [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(moviePlayBackDidFinish:)
            name:MPMoviePlayerPlaybackDidFinishNotification
            object:_player];
    

    _player.controlStyle = MPMovieControlStyleDefault;
    _player.shouldAutoplay = YES;
    
    [_player prepareToPlay];
    [_player.view setFrame: self.view.bounds];
    [self.view addSubview:_player.view];
    [_player setFullscreen:YES animated:YES];
    
    [_player play];
}
                  
- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
                      
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
        name:MPMoviePlayerPlaybackDidFinishNotification
        object:player];
                      
    if ([player respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}
                  

@end
