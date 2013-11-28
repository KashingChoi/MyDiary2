//
//  LocationViewController.h
//  MyDiary
//
//  Created by apple on 13-10-18.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LocationViewController : UIViewController <MKReverseGeocoderDelegate>
{
    MKReverseGeocoder *geo;
    IBOutlet MKMapView *mv;
}
-(IBAction)changeMapType:(id)segcontrol;
-(IBAction)addPin:(id)sender;
-(IBAction)reverseGeoTest:(id)sender;
-(IBAction)currentLocation:(id)sender;
@end
