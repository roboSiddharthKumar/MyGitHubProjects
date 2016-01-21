//
//  TBMTableViewCell.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMTableViewCell.h"
#import "TBMNetworkManager.h"

@implementation TBMTableViewCell

/**
 @breif : convenience method to call the downloadImageForUrl method 
          of TBMNetworkManager.
 @param : imageUrl contains url for downloading the image.
          delegate: self which conforms with  <ImageDownloadDelegate>
 @return: void
 */

-(void)configureCellWithImageUrl:(NSString*)imageUrl {
    [self.activityIndicator startAnimating];
    self.movieName.text = self.name;
    self.artist.text = self.artistName;
    self.releaseDate.text = self.moveRealeaseDate;
    self.price.text = self.moviePrice;
    self.serialNumberLabel.text = [NSString stringWithFormat:@"%d", self.sNo];
    [[TBMNetworkManager sharedInstance] downloadImageForUrl:imageUrl forDelegate:self];
}

#pragma mark - TBImageDownloadDelegate Methods

/**
 
 @breif : Image Download Delegate Methods to set the imageView of cells
 with corresponding Images.
 @param : image, an object of UIImage class contains downloaded
 image
 @return : void
 
 */
-(void)didFinishDownloadingImage:(UIImage*)image {
    
    
    [self.activityIndicator stopAnimating];
    [self.ImageInCell setImage:image];
}
/**
 
 @breif : Image Download Delegate Methods to inform if any error occurs
 in downloading Image.
 @param : error, an object of NSError
 @return : void
 
 */

-(void)ImageDownloadFails:(NSError*)error {
   [self.activityIndicator stopAnimating];
    NSLog(@"Error in downloading image");
}
@end
