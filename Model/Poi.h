//
//  Poi.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 02/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Poi : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, readwrite) double latitude;
@property (nonatomic, readwrite) double longitude;

- (instancetype) initWithName:(NSString *)name
                     Latitude:(double)latitude
                    Longitute:(double)longitude;
    


- (void) setupCordinates;

@end

NS_ASSUME_NONNULL_END
