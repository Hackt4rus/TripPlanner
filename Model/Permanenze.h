//
//  Permanenze.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 09/05/21.
//

#import "Tapes.h"
#import "Poi.h"
#import <MapKit/MapKit.h>


@interface Permanenze : Tapes <MKAnnotation>

@property (nonatomic, strong) NSString *place;
@property (nonatomic, strong) NSDate *arrivalDate;
@property (nonatomic, strong) NSDate *leavingDate;

@property (nonatomic, strong) NSString *accommodation; // alloggio (opzionale)
@property (nonatomic, strong) NSString *refreshment; // ristoro (opzionale)

@property (nonatomic, strong) Poi *location;

- (instancetype) initWithPlace:(NSString *)place
                   arrivalDate:(NSDate *)arrivalDate
                   leavingDate:(NSDate *)leavingDate;

- (instancetype) initWithPlace:(NSString *)place
                   arrivalDate:(NSDate *)arrivalDate
                   leavingDate:(NSDate *)leavingDate
                 accommodation:(NSString *)accommodation;

- (instancetype) initWithPlace:(NSString *)place
                   arrivalDate:(NSDate *)arrivalDate
                   leavingDate:(NSDate *)leavingDate
                 accommodation:(NSString *)accommodation
                   refreshment:(NSString *)refreshment;


- (NSString *) getArrivalDate;
- (NSString *) getLeavingDate;



@end


