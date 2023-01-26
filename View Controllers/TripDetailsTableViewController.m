//
//  TripDetailsTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 04/07/21.
//

#import "TripDetailsTableViewController.h"
#import "Trip.h"
#import "AddMovingTableViewController.h"
#import "Spostamenti.h"
#import "Permanenze.h"
#import "TapeListTableViewController.h"
#import "EditTripTableViewController.h"
#import "TripListTableViewController.h"
#import "MapViewController.h"

@interface TripDetailsTableViewController () <EditTripTableViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *startDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *endDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextBox;


@end

@implementation TripDetailsTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.theTrip.tripName;
    self.locationLabel.text = self.theTrip.locationName;
    self.startDateLabel.text = [self.theTrip getStartDate];
    self.endDateLabel.text = [self.theTrip getEndDate];
    self.descriptionTextBox.text = self.theTrip.tripDescription;
    
    self.descriptionTextBox.editable = NO;
    
    /*
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refreshControl;
     
    */
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh:) name:TripChangedNotification object:self.theTrip ];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
      return 1;
    
     // return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

/*
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    <#code#>
}
*/

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 

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
    
    if([segue.identifier isEqualToString:@"TapeListSegue"]) {
        if([segue.destinationViewController isKindOfClass:[TapeListTableViewController class]]) {
            
            TapeListTableViewController *vc = (TapeListTableViewController *)segue.destinationViewController;
            
            vc.theTrip = self.theTrip;
        }
    }
    
    if([segue.identifier isEqualToString:@"EditTripSegue"]) {
        if([segue.destinationViewController isKindOfClass:[EditTripTableViewController class]]) {
            
            EditTripTableViewController *vc = (EditTripTableViewController *)segue.destinationViewController;
            
            vc.theTrip = self.theTrip;

        }
    }
    
    
    if([segue.identifier isEqualToString:@"TripDetailsSegue"]) {
        if([segue.sourceViewController isKindOfClass:[TripListTableViewController class]]) {
            
            TripListTableViewController *vc = (TripListTableViewController *)segue.sourceViewController;
            
            vc.theTrip = self.theTrip;
            

        }
    }
    
    
    if([segue.identifier isEqualToString:@"MapViewSegue"]) {
        if([segue.destinationViewController isKindOfClass:[MapViewController class]]) {
            
            MapViewController *vc = (MapViewController *)segue.destinationViewController;
            
            vc.theTrip = self.theTrip;

        }
    }
    
    
}



- (void) refresh:(NSNotification *)notification {
    NSLog(@"Received %@. Trip name changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:TripNameChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:TripNameChangedNotificationNewValueKey]);
    
    self.nameLabel.text = self.theTrip.tripName;
    
    
    NSLog(@"Received %@. Location name changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:LocationNameChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:LocationNameChangedNotificationNewValueKey]);
    
    self.locationLabel.text = self.theTrip.locationName;
    
    
    NSLog(@"Received %@. Start Date changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:StartDateChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:StartDateChangedNotificationNewValueKey]);
    
    self.startDateLabel.text = self.theTrip.getStartDate;
    
    
    NSLog(@"Received %@. End date changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:EndDateChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:EndDateChangedNotificationNewValueKey]);
    
    self.endDateLabel.text = self.theTrip.getEndDate;
    
    
    NSLog(@"Received %@. Trip description changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:TripDescriptionChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:TripDescriptionChangedNotificationNewValueKey]);
    
    self.descriptionTextBox.text = self.theTrip.tripDescription;
    
    
    NSLog(@"Received %@. Location changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:LocationChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:LocationChangedNotificationNewValueKey]);
    
    self.theTrip.location.name = self.theTrip.locationName;
    
    [self.theTrip.location setupCordinates];
    
    
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

@end
