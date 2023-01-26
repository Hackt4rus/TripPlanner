//
//  EditTripTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 10/07/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@class EditTripTableViewController;
@protocol EditTripTableViewControllerDelegate


- (void) refresh:(NSNotification *)notification;

@end

@interface EditTripTableViewController : UITableViewController

@property (nonatomic, strong) id <EditTripTableViewControllerDelegate> delegate;

@property (nonatomic, strong) Trip *theTrip;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
