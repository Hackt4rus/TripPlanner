//
//  TapeListTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 07/07/21.
//

#import "TapeListTableViewController.h"
#import "Spostamenti.h"
#import "Permanenze.h"
#import "AddMovingTableViewController.h"
#import "AddStayTableViewController.h"
#import "TapeDetailTableViewController.h"

@interface TapeListTableViewController () <AddMovingTableViewControllerDelegate, AddStayTableViewControllerDelegate>

@end

@implementation TapeListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.theTrip.tapesList.size;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tapeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Tapes *tape = [self.theTrip.tapesList getAtIndex:indexPath.row];
    
    if([tape isKindOfClass:[Spostamenti class]]) {
        cell.textLabel.text = @"Moving";
        
        Spostamenti *moving = (Spostamenti *)tape;
        
        NSString *string = [NSString stringWithFormat:@"%@ - %@, %@", moving.departure, moving.destination, moving.getDate];
        
        cell.detailTextLabel.text = string;
    }
    
    if([tape isKindOfClass:[Permanenze class]]) {
        cell.textLabel.text = @"Stay";
        
        Permanenze *stay = (Permanenze *)tape;
        
        NSString *string = [NSString stringWithFormat:@"%@,  %@ - %@", stay.place, stay.getArrivalDate, stay.getLeavingDate];
        
        cell.detailTextLabel.text = string;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.theTrip.tapesList deleteTapeAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
    if([segue.identifier isEqualToString:@"AddMovingSegue"]) {
        if([segue.destinationViewController isKindOfClass:[AddMovingTableViewController class]]) {
            
            [(AddMovingTableViewController *)segue.destinationViewController setDelegate:self];
            
            AddMovingTableViewController * vc = (AddMovingTableViewController *)segue.destinationViewController;
            
            vc.theTrip = self.theTrip;
        }
    }
    
    if([segue.identifier isEqualToString:@"AddStaySegue"]) {
        if([segue.destinationViewController isKindOfClass:[AddStayTableViewController class]]) {
            
            [(AddStayTableViewController *)segue.destinationViewController setDelegate:self];
            
            AddStayTableViewController * vc = (AddStayTableViewController *)segue.destinationViewController;
            
            vc.theTrip = self.theTrip;
        }
    }
    
    
    if([segue.identifier isEqualToString:@"TapeDetailSegue"]) {
        if([segue.destinationViewController isKindOfClass:[TapeDetailTableViewController class]]) {
            TapeDetailTableViewController *vc = (TapeDetailTableViewController *)segue.destinationViewController;
            
            vc.theTrip = self.theTrip;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            
            vc.indexPath = indexPath;
            
        }
    }
    
}


- (void) addMovingDeparture:(NSString *)departure
                Destination:(NSString *)destination
                       Date:(NSDate *)date
                  Transport:(NSString *)transport {
    Spostamenti *moving = [[Spostamenti alloc] initWithDeparture:departure
                                                     destination:destination
                                                            date:date
                                                       transport:transport];

    moving.location.name = destination;
    
    [moving.location setupCordinates];
    
    [self.theTrip.tapesList add:moving];
        
    [self.tableView reloadData];
}


- (void) addStayPlace:(NSString *)place
          ArrivalDate:(NSDate *)arrivalDate
          LeavingDate:(NSDate *)leavingDate
          Refreshment:(NSString *)refreshment
          Acomodation:(NSString *)accomodation {
    
    Permanenze *stay = [[Permanenze alloc] initWithPlace:place
                                             arrivalDate:arrivalDate
                                             leavingDate:leavingDate
                                           accommodation:accomodation
                                             refreshment:refreshment];
    
    stay.location.name = place;
    
    [stay.location setupCordinates];
    
    [self.theTrip.tapesList add:stay];
    
    [self.tableView reloadData];
}



@end
