//
//  TBMImageDownload.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMImageDownload.h"
#import "TBMImageDownloadDelegate.h"
#import "TBMImageCache.h"
//Added space 
@interface TBMImageDownload()<NSURLConnectionDelegate>


@property (strong,nonatomic)NSString* imageUrl;
@property(assign,nonatomic)id<TBMImageDownloadDelegate>delegate;


@end  

@implementation TBMImageDownload

/**
 @breif: This method initializes delegate and imageurl properties of TBMImageDownload class
 @param :url contains the url for downloading image.
         delegate of type TBMImageDownloadDelegate.
 @return : instance of type TBMImageDownload. 
 */

-(instancetype)initWithImageUrl:(NSString*)url forDelegate:(id<TBMImageDownloadDelegate>)delegate {
    
    self = [super init];
    if(self) {
        
        _delegate = delegate;
        self.imageUrl = url;
    }
    return self;
}
/**
 @breif : This method downloads images for the given imageUrl after establishing connection to
          the server.It also finds image in the imageCache dictionary of TBMImageCache Class.If 
          image is found in imageCache it is not downloaded again.
 */

- (void)main {
    
    if (self.imageUrl) {
        
        TBMImageCache* imageCache = [TBMImageCache sharedInstance];
        
        UIImage* cachedImage = [imageCache imageForUrl:_imageUrl];
                if (cachedImage) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        if ([self.delegate respondsToSelector:@selector(didFinishDownloadingImage:)]) {
                            [self.delegate didFinishDownloadingImage:cachedImage];
                        }
                        
                        
                    });


                }else {
        
        NSURL *URL = [NSURL URLWithString:self.imageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          
                                          if (!error) {
                                              TBMImageCache *imageCache = [TBMImageCache sharedInstance];
                                              UIImage* image = [UIImage imageWithData:data];
                                              [imageCache saveImage:image ForUrl:self.imageUrl];
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  
                                                  if ([self.delegate respondsToSelector:@selector(didFinishDownloadingImage:)]) {
                                                      [self.delegate didFinishDownloadingImage:image];
                                                  }
                                                  
                                                  
                                              });
                                              
                                          }else {
                                              if ([self.delegate respondsToSelector:@selector(ImageDownloadFails:)]) {
                                                  [self.delegate ImageDownloadFails:error];
                                              }
                                          }
                                      }];
        
        [task resume];
              }
    }
}
@end
