//
//  AppDelegate.h
//  C4QWeatherApp
//
//  Created by Felicia Weathers on 12/30/17.
//  Copyright © 2017 Felicia Weathers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

