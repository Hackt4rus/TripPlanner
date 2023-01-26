//
//  Trip.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 07/05/21.
//

#import <Foundation/Foundation.h>
#import "Poi.h"
#import "TapesList.h"
#import <MapKit/MapKit.h>

@interface Trip : NSObject <MKAnnotation>


extern NSNotificationName const TripChangedNotification;
extern NSString *const TripNameChangedNotificationNewValueKey;
extern NSString *const TripNameChangedNotificationOldValueKey;
extern NSString *const TripNameChangedNotificationChangedAtKey;

extern NSString *const LocationNameChangedNotificationNewValueKey;
extern NSString *const LocationNameChangedNotificationOldValueKey;
extern NSString *const LocationNameChangedNotificationChangedAtKey;

extern NSString *const StartDateChangedNotificationNewValueKey;
extern NSString *const StartDateChangedNotificationOldValueKey;
extern NSString *const StartDateChangedNotificationChangedAtKey;


extern NSString *const EndDateChangedNotificationNewValueKey;
extern NSString *const EndDateChangedNotificationOldValueKey;
extern NSString *const EndDateChangedNotificationChangedAtKey;


extern NSString *const TripDescriptionChangedNotificationNewValueKey;
extern NSString *const TripDescriptionChangedNotificationOldValueKey;
extern NSString *const TripDescriptionChangedNotificationChangedAtKey;

extern NSString *const LocationChangedNotificationNewValueKey;
extern NSString *const LocationChangedNotificationOldValueKey;
extern NSString *const LocationChangedNotificationChangedAtKey;


@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
@property (nonatomic, strong) NSString *tripDescription;

@property (nonatomic, strong) TapesList *tapesList;

@property (nonatomic, strong) Poi *location;

- (instancetype) initWithName:(NSString *)tripName
                     location:(NSString *)locationName
                    startDate:(NSDate *)startDate
                      endDate:(NSDate *)endDate
              tripDescription:(NSString *)description;
                        
- (NSString *) getStartDate;

- (NSString *) getEndDate;
@end


