//
//  APIManager.h
//  C4QWeatherApp
//
//  Created by Felicia Weathers on 12/30/17.
//  Copyright © 2017 Felicia Weathers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (void)GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completionBlock;

@end
