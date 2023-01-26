//
//  TapeDetailTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 08/07/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@interface TapeDetailTableViewController : UITableViewController

@property (nonatomic, strong) Trip *theTrip;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
