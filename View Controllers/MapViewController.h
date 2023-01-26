//
//  MapViewController.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 11/07/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController

@property (nonatomic, strong) Trip *theTrip;


- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        Zoom:(double)zoom;


@end

NS_ASSUME_NONNULL_END
