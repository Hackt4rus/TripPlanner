//
//  AddStayTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 08/07/21.
//

#import "AddStayTableViewController.h"

@interface AddStayTableViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *placeTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *arrivalDatePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *leavingDatePicker;
@property (strong, nonatomic) IBOutlet UITextField *refreshmentTextField;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;
@property (strong, nonatomic) IBOutlet UITextField *accomodationTextField;

@end

@implementation AddStayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.placeTextField.delegate = self;
    
    self.refreshmentTextField.delegate = self;
    
    self.accomodationTextField.delegate = self;
    
    self.errorLabel.text = @"";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.placeTextField resignFirstResponder];
    
    [self.refreshmentTextField resignFirstResponder];
    
    [self.accomodationTextField resignFirstResponder];
    
    return YES;
}

- (IBAction)cancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton {
    if([self.placeTextField.text isEqualToString:@""]) {
        self.errorLabel.text = @"Please insert Place.";

    }
    
    else if(([self.leavingDatePicker.date compare:self.arrivalDatePicker.date] == NSOrderedAscending) && ([self.leavingDatePicker.date compare:self.arrivalDatePicker.date] != NSOrderedSame)) {
        self.errorLabel.text = @"Leaving date must be later in time to Arrival date!";
    }
    
    else if([self.arrivalDatePicker.date compare:self.theTrip.startDate] == NSOrderedAscending) {
        self.errorLabel.text = @"Arrival date < Trip's start date.";

    }
    
    else if([self.arrivalDatePicker.date compare:self.theTrip.endDate] == NSOrderedDescending) {
        self.errorLabel.text = @"Arrival date > Trip's end date.";

    }
    
    else if([self.leavingDatePicker.date compare:self.theTrip.startDate] == NSOrderedAscending) {
        self.errorLabel.text = @"Leaving date < Trip's start date.";

    }
    
    
    else if([self.leavingDatePicker.date compare:self.theTrip.endDate] == NSOrderedDescending) {
        self.errorLabel.text = @"Leaving date > Trip's start date.";

    }
    
    else {
        [self.delegate addStayPlace:self.placeTextField.text
                        ArrivalDate:self.arrivalDatePicker.date
                        LeavingDate:self.leavingDatePicker.date
                        Refreshment:self.refreshmentTextField.text
                        Acomodation:self.accomodationTextField.text];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



@end
