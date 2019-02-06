//
//  AppDelegate.m
//  used-book-ios
//
//  Created by Taylor on 2019/1/29.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    if ([AWNetwork shareInstance].token) {
        [self signIn];
    } else {
        [self signOut];
    }
    return YES;
}

- (void)signOut {
    SignInViewController *vc = [[SignInViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
}

- (void)signIn {
    
}

@end
