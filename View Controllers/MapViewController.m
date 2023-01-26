//
//  MapViewController.m
//  TripPlanner
//
//  Created by Carmelo Ballone on 11/07/21.
//

#import "MapViewController.h"
#import <MapKit/MKMapView.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "Spostamenti.h"
#import "Permanenze.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.map.delegate = self;
        
    
    [self centerMapToLocation:CLLocationCoordinate2DMake(self.theTrip.location.latitude, self.theTrip.location.longitude)
                         Zoom:0.1];
     
    
    [self.map addAnnotation:self.theTrip];
    

        
    for(long i = 0; i < self.theTrip.tapesList.size; ++i) {
        if([[self.theTrip.tapesList getAtIndex:i] isKindOfClass:[Spostamenti class]]) {
            NSObject *obj = [self.theTrip.tapesList getAtIndex:i];
            
            [self.map addAnnotation:(Spostamenti *)obj];
                                    
        }
        
        else if([[self.theTrip.tapesList getAtIndex:i] isKindOfClass:[Permanenze class]]) {
            NSObject *obj = [self.theTrip.tapesList getAtIndex:i];
            
            [self.map addAnnotation:(Permanenze *)obj];
                                    
        }
            
    }
     
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        Zoom:(double)zoom {
    MKCoordinateRegion region;
    
    region.center = location;
    
    region.span.latitudeDelta = zoom;
    
    region.span.longitudeDelta = zoom;
    
    [self.map setRegion:region];
}


- (MKAnnotationView *) mapView:(MKMapView *)mapView
             viewForAnnotation:(id<MKAnnotation>)annotation {
            
    static NSString *AnnotationIdentifier = @"MapAnnotationView";
    
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
        
    if(!view && [annotation isKindOfClass:[Trip class]]) {
            
        view = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];

        NSString *glyph = [NSString stringWithFormat:@"%@", self.theTrip.tripName];
        
        [(MKMarkerAnnotationView *)view setGlyphText:glyph];

        
        view.canShowCallout = YES;
            
    }
    
    else if(!view && [annotation isKindOfClass:[Tapes class]]) {
            
        view = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        
        
        long i = [self.theTrip.tapesList indexForTape:(Tapes *)annotation];
        
        if([[self.theTrip.tapesList getAtIndex:i] isKindOfClass:[Spostamenti class]]) {
            
            NSString *glyph = [NSString stringWithFormat:@"%ld", i+1];

            [(MKMarkerAnnotationView *)view setGlyphText:glyph];
            
            [(MKMarkerAnnotationView *)view setMarkerTintColor:UIColor.systemBlueColor];

        }
        
        if([[self.theTrip.tapesList getAtIndex:i] isKindOfClass:[Permanenze class]]) {
            
            NSString *glyph = [NSString stringWithFormat:@"%ld", i+1];

            [(MKMarkerAnnotationView *)view setGlyphText:glyph];
            
            [(MKMarkerAnnotationView *)view setMarkerTintColor:UIColor.systemPurpleColor];

        }
                
            
        view.canShowCallout = YES;
            
    }
    

        
    
    return view;
    
}



@end
