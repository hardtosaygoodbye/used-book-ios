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
    NSMutableArray *tabBarItemsAttributes = [NSMutableArray array];
    NSArray *titleArray = @[@"首页",@"卖书",@"我的"];
    NSArray *imageArray = @[@"tab_home",@"tab_home",@"tab_home"];
    for (int i=0; i<titleArray.count; i++) {
        NSString *title = titleArray[i];
        NSString *imageName = imageArray[i];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected",imageName];
        NSDictionary *tabBarDict = @{
                                     CYLTabBarItemTitle: title,
                                     CYLTabBarItemImage: imageName,
                                     CYLTabBarItemSelectedImage:selectedImageName
                                     };
        [tabBarItemsAttributes addObject:tabBarDict];
    }
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    SellerViewController *sellerVC = [[SellerViewController alloc] init];
    UINavigationController *sellerNav = [[UINavigationController alloc] initWithRootViewController:sellerVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] initWithViewControllers:@[homeNav,sellerNav,mineNav] tabBarItemsAttributes:tabBarItemsAttributes];
    tabBarController.tabBar.backgroundColor = kWhiteColor;
    tabBarController.tabBar.tintColor = kFirstColor;
    self.window.rootViewController = tabBarController;
    
}

@end
