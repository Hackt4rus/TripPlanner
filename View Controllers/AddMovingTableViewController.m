//
//  AddMovingTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 06/07/21.
//

#import "AddMovingTableViewController.h"

@interface AddMovingTableViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *departureLabel;
@property (strong, nonatomic) IBOutlet UITextField *destinationLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITextField *transportLabel;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation AddMovingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.departureLabel.delegate = self;
    
    self.destinationLabel.delegate = self;
    
    self.transportLabel.delegate = self;
    
    self.errorLabel.text = @"";
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.departureLabel resignFirstResponder];
    [self.destinationLabel resignFirstResponder];
    [self.transportLabel resignFirstResponder];
    return YES;
}





- (IBAction)cancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)saveButton:(id)sender {
    
    if([self.departureLabel.text isEqualToString:@""]) {
        self.errorLabel.text = @"Please insert Departure.";

    }
    
    else if([self.destinationLabel.text isEqualToString:@""]) {
        self.errorLabel.text = @"Please insert Destination.";

    }
    
    else if([self.datePicker.date compare:self.theTrip.startDate] == NSOrderedAscending) {
        self.errorLabel.text = @"Moving date < Trip's start date.";

    }
    
    else if([self.datePicker.date compare:self.theTrip.endDate] == NSOrderedDescending) {
        self.errorLabel.text = @"Moving date > Trip's end date.";

    }
    
    else {
        [self.delegate addMovingDeparture:self.departureLabel.text
                              Destination:self.destinationLabel.text
                                     Date:self.datePicker.date
                                Transport:self.transportLabel.text];

        
        [self dismissViewControllerAnimated:YES completion:nil];

    }
    
}







@end
