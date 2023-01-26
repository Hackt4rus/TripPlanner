//
//  TapeListTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 07/07/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@interface TapeListTableViewController : UITableViewController

@property (nonatomic, strong) Trip *theTrip;

@end

NS_ASSUME_NONNULL_END
