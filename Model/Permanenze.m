//
//  Permanenze.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 09/05/21.
//

#import "Permanenze.h"

@implementation Permanenze

- (instancetype) initWithPlace:(NSString *)place
                   arrivalDate:(NSDate *)arrivalDate
                   leavingDate:(NSDate *)leavingDate
                 accommodation:(NSString *)accommodation
                   refreshment:(NSString *)refreshment {
    if(self = [self init]) {
        _place = [place copy];
        _arrivalDate = [arrivalDate copy];
        _leavingDate = [leavingDate copy];
        _accommodation = [accommodation copy];
        _refreshment = [refreshment copy];
        
        
        self.location = [[Poi alloc] initWithName:place
                                         Latitude:0.0
                                        Longitute:0.0] ;
    }
    
    return self;
}


- (instancetype) initWithPlace:(NSString *)place
                   arrivalDate:(NSDate *)arrivalDate
                   leavingDate:(NSDate *)leavingDate {
    return [self initWithPlace:place
                   arrivalDate:arrivalDate
                   leavingDate:leavingDate
                 accommodation:nil];
}


- (instancetype) initWithPlace:(NSString *)place
                   arrivalDate:(NSDate *)arrivalDate
                   leavingDate:(NSDate *)leavingDate
                 accommodation:(NSString *)accommodation {
    return [self initWithPlace:place
                   arrivalDate:arrivalDate
                   leavingDate:leavingDate
                 accommodation:accommodation
                   refreshment:nil];
}



- (NSString *) getArrivalDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSDate *date = self.arrivalDate;
    
    NSString *string = [dateFormatter stringFromDate:date];
    
    return string;
}



- (NSString *) getLeavingDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSDate *date = self.leavingDate;
    
    NSString *string = [dateFormatter stringFromDate:date];
    
    return string;
}

- (CLLocationCoordinate2D) coordinate {
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = self.location.latitude;
    
    coordinate.longitude = self.location.longitude;
    
    return coordinate;
}


- (NSString *) title {
    return self.location.name;
}

@end

