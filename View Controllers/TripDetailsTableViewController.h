//
//  TripDetailsTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 04/07/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"
#import "TripList.h"

NS_ASSUME_NONNULL_BEGIN

@interface TripDetailsTableViewController : UITableViewController

@property (nonatomic, strong) Trip *theTrip;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) TripList *tripList;

@end

NS_ASSUME_NONNULL_END
