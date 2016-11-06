//
//  StreamsTableViewController.m
//  WowzaGoCoderSDKSampleApp
//
//  Created by michael russell on 2016-11-06.
//  Copyright © 2016 HQ, Inc. All rights reserved.
//

#import "StreamsTableViewController.h"
#import "VideoViewerController.h"

@interface StreamsTableViewController ()

@property (nonatomic, strong, nonnull) NSMutableArray *streams;

@end

@implementation StreamsTableViewController

- (NSMutableArray *) streams {
    if (!_streams) {
        _streams = [NSMutableArray new];
    }
    
    return _streams;
}

- (void) addStream:(NSString*)stream {
    [self.streams addObject:stream];
}


-(void) getStreams
{
    [self.streams removeAllObjects];
   // query server for available streams
    
    // for now let's just define it statically (from the wowza cloud page)
    [self addStream:@"https://c8a1d3.entrypoint.cloud.wowza.com/app-bd6f/ngrp:9becf124_all/playlist.m3u8"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s:%d", __FUNCTION__, __LINE__);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) didTapDoneButton:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_streams count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"streamCell" forIndexPath:indexPath];
    
    // Configure the cell...
    UILabel* stream = (UILabel*) [cell viewWithTag:100];
    stream.text=[_streams objectAtIndex:[indexPath row]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"VIDEO_VIEWER_SEGUE"])
    {
        // Get reference to the destination view controller
        VideoViewerController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        vc.stream = [_streams objectAtIndex:0];
    }
}


@end
