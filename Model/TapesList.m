//
//  TapesList.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 09/05/21.
//

#import "TapesList.h"
#import "Tapes.h"
#import "Spostamenti.h"
#import "Permanenze.h"


typedef NSComparisonResult (^cmprt)(Tapes *, Tapes *);

cmprt datacompare = ^(Tapes *t1, Tapes *t2) {
    if([t1 isKindOfClass:([Spostamenti class])] && [t2 isKindOfClass:([Spostamenti class])]) {
        return [[(Spostamenti *)t1 date] compare:[(Spostamenti *)t2 date]];
    }
    
    if([t1 isKindOfClass:([Permanenze class])] && [t2 isKindOfClass:([Permanenze class])]) {
        if([[(Permanenze *)t1 arrivalDate] isEqualToDate:[(Permanenze *)t2 arrivalDate]])
            return [[(Permanenze *)t1 leavingDate] compare:[(Permanenze *)t2 leavingDate]];
        
        else
            return [[(Permanenze *)t1 arrivalDate] compare:[(Permanenze *)t2 arrivalDate]];
    }
    
    if([t1 isKindOfClass:([Spostamenti class])] && [t2 isKindOfClass:([Permanenze class])]) {
        return [[(Spostamenti *)t1 date] compare:[(Permanenze *)t2 arrivalDate]];
    }
    
    if([t1 isKindOfClass:([Permanenze class])] && [t2 isKindOfClass:([Spostamenti class])]) {
        return [[(Permanenze *)t1 arrivalDate] compare:[(Spostamenti *)t2 date]];
    }
    
    return NSOrderedSame;
};



@interface TapesList ()

@property NSMutableArray *list;

@end

@implementation TapesList

- (instancetype) init {
    if(self = [super init]) {
        _list = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void) add:(Tapes *)tape {
    if([tape isKindOfClass:([Tapes class])]) {
        [self.list addObject:tape];
        
        [self.list sortUsingComparator:datacompare];
        
  }
}

- (void) deleteTapeAtIndex:(NSInteger)index {
    [self.list removeObjectAtIndex:index];
}


- (Tapes *) getAtIndex:(NSInteger)index {
    return [self.list objectAtIndex:index];
}

- (NSArray *) getAll {
    return self.list;
}

- (long) size {
    return self.list.count;
}

- (long) indexForTape:(Tapes *)tape {
    long res = -1;
    
    for(int i = 0; i < self.size; ++i) {
        if([self getAtIndex:i] == tape)
            res = i;
    }
    return res;
}

@end

