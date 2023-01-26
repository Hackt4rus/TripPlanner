//
//  Poi.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 02/07/21.
//

#import "Poi.h"
#import <CoreLocation/CLGeocoder.h>
#import <CoreLocation/CLPlacemark.h>

@implementation Poi


- (instancetype) initWithName:(NSString *)name
                     Latitude:(double)latitude
                    Longitute:(double)longitude {
    if(self = [super init]) {
        _name = [name copy];
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}


- (void) setupCordinates {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:self.name
                 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([obj isKindOfClass:[CLPlacemark class]]) {
                CLPlacemark *pm = (CLPlacemark *)obj;
                self.latitude = pm.location.coordinate.latitude;
                
                self.longitude = pm.location.coordinate.longitude;
                
                NSLog(@"latitude setupCordinates %f", self.latitude);

                
                *stop = YES;
            }
        }];
        
    }];
}
 



@end
