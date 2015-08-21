//
//  ViewController.h
//  FinalTest
//
//  Created by Diego Alejandro Cruz Ramirez on 20/08/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/Analytics.h>

@interface Start : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tblMain;

@end

