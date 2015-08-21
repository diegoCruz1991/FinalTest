//
//  ViewController.m
//  FinalTest
//
//  Created by Diego Alejandro Cruz Ramirez on 20/08/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import "Start.h"
#import "Declarations.h"
#import "CustomCellTableViewCell.h"
#import "Map.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"CM-Maps:Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

-(void)initController {
    //Initialize arrays
    maCountries         = [[NSMutableArray alloc] initWithObjects: @"México", @"Paris", @"Londres", @"Madrid", nil];
    maPlacesLat     = [[NSMutableArray alloc] initWithObjects: @"19.303170", @"48.858282",@"51.481399",@"40.453256", nil];
    maPlacesLng     = [[NSMutableArray alloc] initWithObjects: @"-99.150324", @"2.294385",@"-0.191321",@"-3.688551", nil];

}


/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maCountries.count;
}

//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    CustomCellTableViewCell *cell = (CustomCellTableViewCell *)[self.tblMain dequeueReusableCellWithIdentifier:@"CustomCellTableViewCell"];
    
    if (cell == nil) {
        [self.tblMain  registerNib:[UINib nibWithNibName:@"CustomCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCellTableViewCell"];
        cell = [self.tblMain  dequeueReusableCellWithIdentifier:@"CustomCellTableViewCell"];
    }
    //Fill cell with info from arrays
    cell.lblName.text   = maCountries[indexPath.row];
    
    return cell;
}

//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCountryIndex = (int)indexPath.row;
    Map *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Map"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}


@end
