//
//  Trip.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 07/05/21.
//

#import "Trip.h"
#import "Poi.h"
#import <MapKit/MapKit.h>

NSString *const TripChangedNotification = @"TripChangedNotification";
NSString *const TripNameChangedNotificationNewValueKey = @"TripNameChangedNotificationNewValueKey";
NSString *const TripNameChangedNotificationOldValueKey = @"TripNameChangedNotificationOldValueKey" ;
NSString *const TripNameChangedNotificationChangedAtKey = @"TripNameChangedNotificationChangedAtKey";

NSString *const LocationNameChangedNotificationNewValueKey = @"LocationNameChangedNotificationNewValueKey";
NSString *const LocationNameChangedNotificationOldValueKey = @"LocationNameChangedNotificationOldValueKey";
NSString *const LocationNameChangedNotificationChangedAtKey = @"LocationNameChangedNotificationChangedAtKey";

NSString *const StartDateChangedNotificationNewValueKey = @"StartDateChangedNotificationNewValueKey";
NSString *const StartDateChangedNotificationOldValueKey = @"StartDateChangedNotificationOldValueKey";
NSString *const StartDateChangedNotificationChangedAtKey = @"StartDateChangedNotificationChangedAtKey";


NSString *const EndDateChangedNotificationNewValueKey = @"EndDateChangedNotificationNewValueKey";
NSString *const EndDateChangedNotificationOldValueKey = @"EndDateChangedNotificationOldValueKey";
NSString *const EndDateChangedNotificationChangedAtKey = @"EndDateChangedNotificationChangedAtKey";


NSString *const TripDescriptionChangedNotificationNewValueKey = @"TripDescriptionChangedNotificationNewValueKey";
NSString *const TripDescriptionChangedNotificationOldValueKey = @"TripDescriptionChangedNotificationOldValueKey";
NSString *const TripDescriptionChangedNotificationChangedAtKey = @"TripDescriptionChangedNotificationChangedAtKey";

NSString *const LocationChangedNotificationNewValueKey = @"LocationChangedNotificationNewValueKey";
NSString *const LocationChangedNotificationOldValueKey = @"LocationChangedNotificationOldValueKey";
NSString *const LocationChangedNotificationChangedAtKey = @"LocationChangedNotificationChangedAtKey";

@implementation Trip

- (instancetype) initWithName:(NSString *)name
                     location:(NSString *)locationName
                    startDate:(NSDate *)startDate
                      endDate:(NSDate *)endDate
              tripDescription:(NSString *)description {
    if(self = [super init]) {
        _tripName = [name copy];
        _locationName = [locationName copy];
        _startDate = [startDate copy];
        _endDate = [endDate copy];
        _tripDescription = [description copy];
        
        _tapesList = [[TapesList alloc] init];
        
        _location = [[Poi alloc] initWithName:locationName Latitude:0.0 Longitute:0.0];
    }
    
    return self;
}


- (NSString *) getStartDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSDate *date = self.startDate;
    
    NSString *string = [dateFormatter stringFromDate:date];
    
    return string;
}


- (NSString *) getEndDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSDate *date = self.endDate;
    
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



- (void) setTripName:(NSString *)tripName {
    NSString *oldValue = self.tripName;
    
    _tripName = tripName;
    
    NSDictionary *info = @{
        TripNameChangedNotificationNewValueKey: self.tripName,
        TripNameChangedNotificationOldValueKey: oldValue,
        TripNameChangedNotificationChangedAtKey: [NSDate date]
    };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TripChangedNotification
                                                        object:self
                                                      userInfo:info];
}


- (void) setLocationName:(NSString *)locationName {
    NSString *oldValue = self.locationName;
    
    _locationName = locationName;
    
    NSDictionary *info = @{
        LocationNameChangedNotificationNewValueKey: self.locationName,
        LocationNameChangedNotificationOldValueKey: oldValue,
        LocationNameChangedNotificationChangedAtKey: [NSDate date]
    };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TripChangedNotification
                                                        object:self
                                                      userInfo:info];
}


- (void) setTripDescription:(NSString *)tripDescription {
    NSString *oldValue = self.tripDescription;
    
    _tripDescription = tripDescription;
    
    NSDictionary *info = @{
        TripDescriptionChangedNotificationNewValueKey: self.tripDescription,
        TripDescriptionChangedNotificationOldValueKey: oldValue,
        TripDescriptionChangedNotificationChangedAtKey: [NSDate date]
    };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TripChangedNotification
                                                        object:self
                                                      userInfo:info];
}


- (void) setStartDate:(NSDate *)startDate {
    NSDate *oldValue = self.startDate;
    
    _startDate = startDate;
    
    NSDictionary *info = @{
        StartDateChangedNotificationNewValueKey: self.startDate,
        StartDateChangedNotificationOldValueKey: oldValue,
        StartDateChangedNotificationChangedAtKey: [NSDate date]
    };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TripChangedNotification
                                                        object:self
                                                      userInfo:info];
}


- (void) setEndDate:(NSDate *)endDate {
    NSDate *oldValue = self.endDate;
    
    _endDate = endDate;
    
    NSDictionary *info = @{
        EndDateChangedNotificationNewValueKey: self.endDate,
        EndDateChangedNotificationOldValueKey: oldValue,
        EndDateChangedNotificationChangedAtKey: [NSDate date]
    };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TripChangedNotification
                                                        object:self
                                                      userInfo:info];
}



- (void) setLocation:(Poi *)location {
    Poi *oldValue = self.location;
    
    _location = location;
    
    NSDictionary *info = @{
        LocationChangedNotificationNewValueKey: self.location.name,
        LocationChangedNotificationOldValueKey: oldValue.name,
        LocationChangedNotificationChangedAtKey: [NSDate date]
    };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TripChangedNotification
                                                        object:self
                                                      userInfo:info];
}

@end

