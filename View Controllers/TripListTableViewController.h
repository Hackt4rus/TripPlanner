//
//  TripListTableViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 16/05/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"
#import "TripList.h"

@interface TripListTableViewController : UITableViewController

@property (nonatomic, strong) Trip* theTrip;

@end

