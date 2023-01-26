//
//  Spostamenti.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 07/05/21.
//

#import "Tapes.h"
#import "Poi.h"
#import <MapKit/MapKit.h>

@interface Spostamenti : Tapes <MKAnnotation>

@property (nonatomic, strong) NSString *departure; // luogo di partenza
@property (nonatomic, strong) NSString *destination; // luogo di arrivo
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *transport; // mezzo di trasporto

@property (nonatomic, strong) Poi *location;

- (instancetype) initWithDeparture:(NSString *)departure
                       destination:(NSString *)destination
                              date:(NSDate *) date;

- (instancetype) initWithDeparture:(NSString *)departure
                       destination:(NSString *)destination
                              date:(NSDate *) date
                         transport:(NSString *)transport;



- (NSString *) getDate;
@end


