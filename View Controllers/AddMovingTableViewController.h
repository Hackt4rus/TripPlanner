//
//  AddMovingTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 06/07/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@class AddMovingTableViewController;
@protocol AddMovingTableViewControllerDelegate

- (void) addMovingDeparture:(NSString *)departure
                Destination:(NSString *)destination
                       Date:(NSDate *)date
                  Transport:(NSString *)transport;

@end

@interface AddMovingTableViewController : UITableViewController

@property (nonatomic, strong) Trip *theTrip;

@property (nonatomic, strong) id <AddMovingTableViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
