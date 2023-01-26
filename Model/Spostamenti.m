//
//  Spostamenti.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 07/05/21.
//

#import "Spostamenti.h"
#import <MapKit/MapKit.h>

@implementation Spostamenti

- (instancetype) initWithDeparture:(NSString *)departure
                       destination:(NSString *)destination
                              date:(NSDate *) date {
    return [self initWithDeparture:departure
                        destination:destination
                               date:date
                          transport:nil];
    
}
    
- (instancetype) initWithDeparture:(NSString *)departure
                       destination:(NSString *)destination
                              date:(NSDate *) date
                         transport:(NSString *)transport {
    if(self = [super init]) {
        _departure = [departure copy];
        _destination = [destination copy];
        _date = [date copy];
        _transport = [transport copy];
        
        self.location = [[Poi alloc] initWithName:destination
                                         Latitude:0.0
                                        Longitute:0.0] ;
    }
    
    return self;
}



- (NSString *) getDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"dd/MM/yyyy hh:mm";
    
    NSDate *date = self.date;
    
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

