//
//  TBMTableViewController.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMTableViewController.h"
#import "TBMNetworkManager.h"
#import "TBMTableViewCell.h"
#import "TBMModelClass.h"
#import "TBMDetailViewController.h"
@interface TBMTableViewController ()
@property  (strong,nonatomic) NSMutableArray *dataArray;
@end

@implementation TBMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[TBMNetworkManager sharedInstance] fetchDataFromJson : @"https://itunes.apple.com/in/rss/topmovies/limit=50/genre=4431/json" ForDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TBMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    TBMModelClass *model = [_dataArray objectAtIndex:indexPath.row];
    
    NSString *imageUrl = model.imageUrl;
    cell.name = model.movieName;
    cell.artistName = model.artistName;
    cell.moveRealeaseDate = model.releaseDate;
    cell.moviePrice = model.price;
    cell.sNo = (int)(indexPath.row +1);
    [cell configureCellWithImageUrl:imageUrl];
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 1)];
    separatorLineView.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:separatorLineView];
    return cell;
}
#pragma mark- Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TBMDetailViewController* detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailViewController"];
    TBMModelClass *modelObject =[_dataArray objectAtIndex:indexPath.row];
    
    detailVC.imageUrlString = modelObject.imageUrl;
    detailVC.movieTitle = modelObject.movieName;
    detailVC.summary = modelObject.summary;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - TBMDataFetchDelegate Methods
/**
 
 @breif :  Data Fetch Delegate Method to set the dataArray 
           after successful reading of json file
 @param : responseArray ,an array of TBMModelClass objects
 
 @return : void 
 
*/
-(void)didFinishFetchingData:(NSMutableArray*)responseArray {
    
    self.dataArray = responseArray;
    [self.tableView reloadData];
    
}

/**
 @breif :Data Fetch Delagate Method to infrom any error in json 
          data fectching
 
 @param :error, an object of NSError
 
 @return :void
 */
-(void)didFailFetchingData:(NSError*)error {
  
    NSLog(@"Failed to read Json Data");
    
}

@end
