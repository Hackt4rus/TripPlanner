//
//  EditTripTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 10/07/21.
//

#import "EditTripTableViewController.h"
#import "TripDetailsTableViewController.h"

@interface EditTripTableViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *tripNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationNameTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *endDatePicker;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextBox;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;


@end

@implementation EditTripTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tripNameTextField.text = self.theTrip.tripName;
    
    self.locationNameTextField.text = self.theTrip.locationName;
    
    self.startDatePicker.date = self.theTrip.startDate;
    
    self.endDatePicker.date = self.theTrip.endDate;
    
    self.descriptionTextBox.text = self.theTrip.tripDescription;
    
    self.errorLabel.text = @"";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"EditTripSegue"]) {
        if([segue.sourceViewController isKindOfClass:[TripDetailsTableViewController class]]) {
            
            TripDetailsTableViewController *vc = (TripDetailsTableViewController *)segue.sourceViewController;
            
            vc.theTrip = self.theTrip;
            
        }
            
    }
}




- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [self.tripNameTextField resignFirstResponder];
    
    [self.locationNameTextField resignFirstResponder];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    while([text isEqualToString:@"\n"]) {
        [self.descriptionTextBox resignFirstResponder];
        return YES;
    }
    
    return YES;
}

- (IBAction)cancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)saveButton {
    if([self.tripNameTextField.text isEqualToString:@""]) {
        self.errorLabel.text = @"Please insert Trip name.";

    }
    
    else if([self.locationNameTextField.text isEqualToString:@""]) {
        self.errorLabel.text = @"Please insert Location name.";

    }
    
    else if(([self.endDatePicker.date compare:self.startDatePicker.date] == NSOrderedAscending) && ([self.endDatePicker.date compare:self.startDatePicker.date] != NSOrderedSame)) {
        self.errorLabel.text = @"End date must be later in time or equal to Start date!";
    }
    
    
    else {
                
        self.theTrip.tripName = self.tripNameTextField.text;
        
        self.theTrip.locationName = self.locationNameTextField.text;
        
        self.theTrip.startDate = self.startDatePicker.date;
        
        self.theTrip.endDate = self.endDatePicker.date;
        
        self.theTrip.tripDescription = self.descriptionTextBox.text;
        
        
        [self.delegate refresh:TripChangedNotification];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}





@end
