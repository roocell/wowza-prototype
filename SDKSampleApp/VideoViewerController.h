//
//  VideoViewerController.h
//  WowzaGoCoderSDKSampleApp
//
//  Created by michael russell on 2016-11-06.
//  Copyright © 2016 HQ, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewerController : UIViewController
@property (strong, nonatomic) MPMoviePlayerController * player;
@property (strong, nonatomic) NSString * stream;


- (void)playStream;
@end
