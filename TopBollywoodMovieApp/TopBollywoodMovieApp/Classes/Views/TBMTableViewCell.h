//
//  TBMTableViewCell.h
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBMImageDownloadDelegate.h"

@interface TBMTableViewCell : UITableViewCell<TBMImageDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ImageInCell;
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *artist;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *artistName;
@property (copy, nonatomic) NSString *moveRealeaseDate;
@property (copy, nonatomic)  NSString *moviePrice;
@property (assign,nonatomic)int sNo;
-(void)configureCellWithImageUrl:(NSString*)imageUrl;
@end
