//
//  TripListTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 16/05/21.
//

#import "TripListTableViewController.h"
#import "TripList.h"
#import "AddTripTableViewController.h"
#import "TripDetailsTableViewController.h"

@interface TripListTableViewController () <AddTripTableViewControllerDelegate>

@property (nonatomic, strong) TripList *tripList;


@end

@implementation TripListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.tripList = [[TripList alloc] init];
    
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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tripList.size;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tripCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Trip *trip = [self.tripList getAtIndex:indexPath.row];
    
    cell.textLabel.text = trip.tripName;
    
    NSString *string = [NSString stringWithFormat:@"%@ - %@", trip.getStartDate, trip.getEndDate];
    
    cell.detailTextLabel.text = string;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tripList deleteTripAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
        
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AddTripSegue"]) {
        if([segue.destinationViewController isKindOfClass:[AddTripTableViewController class]]) {
            
            [(AddTripTableViewController *)segue.destinationViewController setDelegate:self];
        }
    }
    
    
    if([segue.identifier isEqualToString:@"TripDetailsSegue"]) {
        if([segue.destinationViewController isKindOfClass:[TripDetailsTableViewController class]]) {

            TripDetailsTableViewController *vc = (TripDetailsTableViewController *)segue.destinationViewController;
            
            vc.tripList = self.tripList;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            
            vc.indexPath = indexPath;
            
            Trip *trip = [self.tripList getAtIndex:indexPath.row];
            
            vc.theTrip = trip;
    
        }
    }
}

- (void) addTripName:(NSString *)name
            location:(NSString *)locationName
           startDate:(NSDate *)startDate
             endDate:(NSDate *)endDate
     tripDescription:(NSString *)description {
    Trip *trip = [[Trip alloc] initWithName:name
                                   location:locationName
                                  startDate:startDate
                                    endDate:endDate
                            tripDescription:description];
    
    
    trip.location.name = locationName;
    
    [trip.location setupCordinates];
    
        
    [self.tripList add:trip];
    
    [self.tableView reloadData];
}


- (void) refresh:(NSNotification *)notification {
    
    NSLog(@"Received %@. Trip name changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:TripNameChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:TripNameChangedNotificationNewValueKey]);
    
    NSLog(@"Received %@. Start Date changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:StartDateChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:StartDateChangedNotificationNewValueKey]);
    
    
    NSLog(@"Received %@. End date changed: %@ -> %@",
          notification.name,
          [notification.userInfo objectForKey:EndDateChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:EndDateChangedNotificationNewValueKey]);
    
    
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}



@end
