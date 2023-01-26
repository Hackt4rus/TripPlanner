//
//  AddTripTableViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 28/06/21.
//

#import "AddTripTableViewController.h"
#import "TripListTableViewController.h"

@interface AddTripTableViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *endDatePicker;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextBox;
@property (strong, nonatomic) IBOutlet UILabel *errorDateLabel;
@property (strong, nonatomic) IBOutlet UITextField *locationTextField;


@end

@implementation AddTripTableViewController

@synthesize titleTextField;
@synthesize locationTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     //self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.titleTextField.delegate = self;
    
    self.locationTextField.delegate = self;
    
    self.descriptionTextBox.delegate = self;
    
    self.errorDateLabel.text = @"";
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}
 */

- (IBAction)titleTextFieldAction {
    [self.titleTextField resignFirstResponder];
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [titleTextField resignFirstResponder];
    [self.locationTextField resignFirstResponder];
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


- (IBAction)saveButton:(UIButton *)sender {
    
    if([self.titleTextField.text isEqualToString:@""]) {
        self.errorDateLabel.text = @"Please insert Trip name.";

    }
    
    else if([self.locationTextField.text isEqualToString:@""]) {
        self.errorDateLabel.text = @"Please insert Location name.";

    }
    
    else if(([self.endDatePicker.date compare:self.startDatePicker.date] == NSOrderedAscending) && ([self.endDatePicker.date compare:self.startDatePicker.date] != NSOrderedSame)) {
        self.errorDateLabel.text = @"End date must be later in time or equal to Start date!";
    }
    
        
    
    else {
        [self.delegate addTripName:self.titleTextField.text
                          location:self.locationTextField.text
                         startDate:self.startDatePicker.date
                           endDate:self.endDatePicker.date
                   tripDescription:self.descriptionTextBox.text ];
            
        [self dismissViewControllerAnimated:YES completion:nil];
            
    }
    
    
    
}


@end
