//
//  TBMImageCache.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMImageCache.h"

static TBMImageCache *instance = nil;

@implementation TBMImageCache

/**
 @breif : This method creates sigleton object for TBMImageCache Class
 
 @return : returns an instance of type TBMImageCache.
 */
+ (TBMImageCache *) sharedInstance
{
    static dispatch_once_t imageCachPredicate;
    dispatch_once (&imageCachPredicate, ^{
        instance = [[TBMImageCache alloc]init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.imageCache = [[NSCache alloc]init];
    }
    
    return self;
}
/**
 @breif : This method searches the image in imageCache
          dictionary with the imageUrl.
 @param : imageUrl contains url for downloading the image
 
 @return: image contains the image from imagecache.
 
 */

-(UIImage*)imageForUrl:(NSString*)imageUrl {
    
    UIImage *image = [self.imageCache objectForKey:imageUrl];
    return image;
}

/**
 
 @breif : This method saves the image in imageCache dictionary for
           the key imageUrl.
 @param : image contains the downloaded image.
          imageUrl contains the url for downloading the image.
 */
-(void)saveImage:(UIImage*)image ForUrl:(NSString*)imageUrl {
    [self.imageCache setObject:image forKey:imageUrl];
}

@end
