//
//  WSDViewController.m
//  San Diego
//
//  Created by Chris Cieslak on 5/26/14.
//  Copyright (c) 2014 Your Company. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "WSDViewController.h"

@interface WSDViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *youWinView;
@property (weak, nonatomic) IBOutlet UIButton *tryAgainButton;
- (IBAction)tryAgainTouched:(id)sender;

@end

@implementation WSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(MKMapRectWorld);
    self.mapView.region = region;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    MKCoordinateRegion region = mapView.region;
    CLLocationDegrees lat, lon, delta;
    lat = region.center.latitude;
    lon = region.center.longitude;
    delta = region.span.latitudeDelta;
    if ((lat > 32.0 && lat < 33.0) && (lon < -117.0 && lon > -118.0) && (delta < 1.2)) {
        [self holyCrapTheresSanDiego];
    }
}

- (void)holyCrapTheresSanDiego {
    self.youWinView.hidden = NO;
    [UIView animateWithDuration:.5 delay:0 options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat) animations:^{
        self.youWinView.alpha = 0;
    } completion:NULL];
    self.tryAgainButton.hidden = NO;
}

- (IBAction)tryAgainTouched:(id)sender {
    self.youWinView.hidden = YES;
    self.tryAgainButton.hidden = YES;
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(MKMapRectWorld);
    [self.mapView setRegion:region animated:YES];
}

@end
