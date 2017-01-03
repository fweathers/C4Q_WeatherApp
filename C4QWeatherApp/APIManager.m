//
//  APIManager.m
//  C4QWeatherApp
//
//  Created by Felicia Weathers on 12/30/17.
//  Copyright © 2017 Felicia Weathers. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation APIManager

+ (void)GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(data, response, error);
            
        });
    }];
    
    [task resume];
}



@end
