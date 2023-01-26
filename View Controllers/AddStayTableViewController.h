//
//  AddStayTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 08/07/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@class AddStayTableViewController;
@protocol AddStayTableViewControllerDelegate

- (void) addStayPlace:(NSString *)place
          ArrivalDate:(NSDate *)arrivalDate
          LeavingDate:(NSDate *)leavingDate
          Refreshment:(NSString *)refreshment
          Acomodation:(NSString *)accomodation;

@end
@interface AddStayTableViewController : UITableViewController

@property (nonatomic, strong) Trip *theTrip;

@property (nonatomic, strong) id <AddStayTableViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
