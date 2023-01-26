//
//  TapeDetailTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 08/07/21.
//

#import "TapeDetailTableViewController.h"
#import "Tapes.h"
#import "Spostamenti.h"
#import "Permanenze.h"

@interface TapeDetailTableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *fromPlaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *toPlaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *onDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *toDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *transportLabel;
@property (strong, nonatomic) IBOutlet UILabel *refreshmentLabel;
@property (strong, nonatomic) IBOutlet UILabel *accomodationLabel;

@end

@implementation TapeDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Tapes *tape = [self.theTrip.tapesList getAtIndex:self.indexPath.row];
    
    if([tape isKindOfClass:[Spostamenti class]]) {
        Spostamenti *moving = (Spostamenti *)tape;
        
        self.fromPlaceLabel.text = moving.departure;
        
        self.toPlaceLabel.text = moving.destination;
        
        self.onDateLabel.text = moving.getDate;
        
        [self.toDateLabel setEnabled:NO];
        
        self.toDateLabel.text = @"-";
        
        self.transportLabel.text = moving.transport;
        
        [self.refreshmentLabel setEnabled:NO];
        
        self.refreshmentLabel.text = @"-";
        
        [self.accomodationLabel setEnabled:NO];
        
        self.accomodationLabel.text = @"-";

    }
    
    else if([tape isKindOfClass:[Permanenze class]]) {
        Permanenze *stay = (Permanenze *)tape;
        
        [self.fromPlaceLabel setEnabled:NO];
        
        self.fromPlaceLabel.text = @"-";

        self.toPlaceLabel.text = stay.place;
        
        self.onDateLabel.text = stay.getArrivalDate;
        
        self.toDateLabel.text = stay.getLeavingDate;
        
        [self.transportLabel setEnabled:NO];
        
        self.transportLabel.text = @"-";
        
        self.refreshmentLabel.text = stay.refreshment;
        
        self.accomodationLabel.text = stay.accommodation;
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"TapeDetailSegue"]) {
        
    }
}
*/

@end
