//
//  AddTripTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 28/06/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@class AddTripTableViewController;
@protocol AddTripTableViewControllerDelegate

- (void) addTripName:(NSString*)name
            location:(NSString *)locationName
           startDate:(NSDate *)startDate
             endDate:(NSDate *)endDate
     tripDescription:(NSString *)description;

@end
@interface AddTripTableViewController : UITableViewController

@property (nonatomic, strong) Trip *theTrip;
@property (nonatomic, strong) id <AddTripTableViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
