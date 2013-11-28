//
//  LocationViewController.m
//  MyDiary
//
//  Created by apple on 13-10-18.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view.
    [super viewDidLoad];	
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)changeMapType:(id)segcontrol
{
    UISegmentedControl *ctrl = (UISegmentedControl *)segcontrol;
    NSInteger temp = ctrl.selectedSegmentIndex;
    mv.mapType = temp;
}
-(IBAction)addPin:(id)sender
{
    //上海的经纬度
    CLLocationCoordinate2D coordinate1 = {31.240948,121.485958};
    NSDictionary *address = [NSDictionary dictionaryWithObjectsAndKeys:@"中国",@"Country",@"上海",@"Locality", nil];
    MKPlacemark *shanghai = [[MKPlacemark alloc]initWithCoordinate:coordinate1 addressDictionary:address];
    [mv addAnnotation:shanghai];
    
    //北京的经纬度
    CLLocationCoordinate2D coordinate2 = {39.908605,116.398019};
    address = [NSDictionary dictionaryWithObjectsAndKeys:@"中国",@"Country",@"北京",@"Locality", nil];
    MKPlacemark *beijing = [[MKPlacemark alloc]initWithCoordinate:coordinate2 addressDictionary:address];
    [mv addAnnotation:beijing];
}

//获取当前位置
-(IBAction)currentLocation:(id)sender
{
    mv.showsUserLocation = YES;
    MKUserLocation *userLocation = mv.userLocation;
    CLLocationCoordinate2D coordinate = userLocation.location.coordinate;
    
    if(!geo){
        geo = [[MKReverseGeocoder alloc]initWithCoordinate:coordinate];
        geo.delegate = self;
        [geo start];
    }
}

//位置与地址转换
-(IBAction)reverseGeoTest:(id)sender
{
    CLLocationCoordinate2D c = {39.908605,116.398019};
    geo = [[MKReverseGeocoder alloc]initWithCoordinate:c];
    geo.delegate = self;
    [geo start];
}

//找不到地址信息时
-(void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"ReverseGeoCoder error");
}

//找到地址信息，就标识在地图上
-(void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    MKPlacemark *spot = [[MKPlacemark alloc]initWithCoordinate:placemark.coordinate addressDictionary:placemark.addressDictionary];
    [mv addAnnotation:spot];
    [mv setCenterCoordinate:placemark.coordinate animated:YES];
}

@end
