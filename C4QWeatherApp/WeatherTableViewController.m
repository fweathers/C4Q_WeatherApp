//
//  WeatherTableViewController.m
//  C4QWeatherApp
//
//  Created by Felicia Weathers on 12/30/17.
//  Copyright © 2017 Felicia Weathers. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "APIManager.h"
#import <CoreLocation/CoreLocation.h>

@interface WeatherTableViewController ()

@property NSArray *weatherInfo;

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://api.aerisapi.com/forecasts/11101?client_id=i5pHKBD39KOmHRkLoHcSi&client_secret=zjEUHJhnSKZR7yxrfXOU5QtFo3XGiyDjErG59s9M"];
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.weatherInfo = json[@"response"][0][@"periods"];
        [self.tableView reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _weatherInfo.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    NSDictionary *currentWeatherItem = self.weatherInfo[indexPath.row];
    
    NSDictionary *daily = currentWeatherItem;
    
//    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[daily[@"time"]doubleValue]];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"EEEE"];
//    NSString *dateName = [dateFormatter stringFromDate:date];
//    cell.textLabel.text = dateName;
    
    
    NSString *highLow = [NSString stringWithFormat:@"(Max %d F - Min %d F)", [daily[@"maxTempF"]intValue], [daily[@"minTempF"]intValue]];
    
    NSString *dateTimeISO = [NSString stringWithFormat:@"(%@)", daily[@"dateTimeISO"]];
    
    cell.textLabel.text = dateTimeISO;
    cell.detailTextLabel.text = highLow;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
