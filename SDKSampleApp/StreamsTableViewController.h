//
//  StreamsTableViewController.h
//  WowzaGoCoderSDKSampleApp
//
//  Created by michael russell on 2016-11-06.
//  Copyright © 2016 HQ, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StreamsTableViewController : UITableViewController


-(void) getStreams;
-(void) addStream:(NSString*)stream;
@end
