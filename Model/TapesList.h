//
//  TapesList.h
//  TripPlanner
//
//  Created by Carmelo Ballone on 09/05/21.
//

#import <Foundation/Foundation.h>
#import "Tapes.h"


NS_ASSUME_NONNULL_BEGIN

@interface TapesList : NSObject

- (void) add:(Tapes *)tape;

- (void) deleteTapeAtIndex:(NSInteger)index;

- (NSArray *) getAll;

- (Tapes *) getAtIndex:(NSInteger)index;

- (long) size;

- (long) indexForTape:(Tapes *)tape;
@end

NS_ASSUME_NONNULL_END

