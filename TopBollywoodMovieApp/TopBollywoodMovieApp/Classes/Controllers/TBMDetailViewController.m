//
//  TBMDetailViewController.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMDetailViewController.h"
#import "TBMImageDownloadDelegate.h"
#import "TBMNetworkManager.h"
@interface TBMDetailViewController ()<TBMImageDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textArea;

@end

@implementation TBMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.movieTitle;
    self.textArea.text = self.summary;
     [[TBMNetworkManager sharedInstance] downloadImageForUrl:self.imageUrlString forDelegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - TBImageDownloadDelegate Methods
/**

 @breif : Image Download Delegate Methods to set the imageView
          with corresponding Image.
 @param : image, an object of UIImage class contains downloaded
          image
 @return : void

 */

-(void)didFinishDownloadingImage:(UIImage*)image {
    [self.imageView setImage:image];
}
/**
 
 @breif : Image Download Delegate Methods to inform if any error occurs
          in downloading Image.
 @param : error, an object of NSError
 @return : void
 
 */
-(void)ImageDownloadFails:(NSError*)error {
    NSLog(@"Error in Downloading image");
}

@end
