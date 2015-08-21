//
//  Map.h
//  FinalTest
//
//  Created by Diego Alejandro Cruz Ramirez on 20/08/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Map : UIViewController

- (IBAction)btnReturnAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnReturn;
@property (strong, nonatomic) IBOutlet UIView *vMap;

@end
