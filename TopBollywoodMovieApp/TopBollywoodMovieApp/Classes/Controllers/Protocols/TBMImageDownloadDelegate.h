//
//  TBMImageDownloadDelegate.h
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TBMImageDownloadDelegate <NSObject>
@optional
-(void)ImageDownloadFails:(NSError*)error;

-(void)didFinishDownloadingImage:(UIImage*)image;

@end
