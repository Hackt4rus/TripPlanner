//
//  TripList.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 09/05/21.
//

#import "TripList.h"
#import "Trip.h"

@interface TripList ()

@property NSMutableArray *list;

@end

@implementation TripList

- (instancetype) init {
    if(self = [super init]) {
        _list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) add:(Trip *)trip {
    if([trip isKindOfClass:([Trip class])]) {
        [self.list addObject:trip];
    }
}

- (void) deleteTripAtIndex:(NSInteger)index {
    [self.list removeObjectAtIndex:index];
    
}

- (NSArray *) getAll {
    return self.list;
}


- (Trip *) getAtIndex:(NSInteger)index {
    return [self.list objectAtIndex:index];
}

- (long) size {
    return self.list.count;
}

- (void) addTrip:(Trip *)trip
         AtIndex:(NSInteger)index {
    [self.list insertObject:trip
                    atIndex:index];
}

@end

