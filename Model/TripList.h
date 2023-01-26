//
//  TripList.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 09/05/21.
//

#import <Foundation/Foundation.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@interface TripList : NSObject

- (void) add:(Trip *)trip;

- (void) addTrip:(Trip *)trip
         AtIndex:(NSInteger)index;

- (void) deleteTripAtIndex:(NSInteger)index;

- (NSArray *) getAll;

- (Trip *) getAtIndex:(NSInteger)index;

- (long) size;


@end

NS_ASSUME_NONNULL_END

