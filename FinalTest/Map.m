//
//  Map.m
//  FinalTest
//
//  Created by Diego Alejandro Cruz Ramirez on 20/08/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import "Map.h"
#import "Declarations.h"

@import GoogleMaps;

@interface Map ()

@end

@implementation Map {
    GMSMapView *mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self paintMap];
    [self paintMarker];
}


- (void) paintMap {
    [mapView removeFromSuperview];
    CGFloat lat                     = (CGFloat)[maPlacesLat[miCountryIndex] floatValue];
    CGFloat lng                     = (CGFloat)[maPlacesLng[miCountryIndex] floatValue];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lat
                                                            longitude:lng
                                                                 zoom:6];
    mapView.frame = CGRectMake(0, 0, 0, 0);
    
    mapView = [GMSMapView mapWithFrame:mapView.frame  camera:camera];
    mapView.myLocationEnabled = YES;
    
    self.vMap = mapView;
    
    [self.view addSubview:mapView];
}


- (void) paintMarker {
    CGFloat lat                     = (CGFloat)[maPlacesLat[miCountryIndex] floatValue];
    CGFloat lng                     = (CGFloat)[maPlacesLng[miCountryIndex] floatValue];
    mapView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +80, self.view.frame.size.width, self.vMap.frame.size.height+600);
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(lat, lng);
    marker.title = maCountries[miCountryIndex];
    marker.snippet = maCountries[miCountryIndex];
    marker.map = mapView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnReturnAction:(id)sender {
    Map *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Start"];
    
    [self presentViewController:viewController animated:YES completion:nil];

}
@end
