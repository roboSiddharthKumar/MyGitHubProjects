//
//  TBMImageCache.h
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TBMImageCache : NSObject
@property (strong,nonatomic)NSCache* imageCache;

+ (instancetype)sharedInstance;
-(UIImage*)imageForUrl:(NSString*)imageUrl;
-(void)saveImage:(UIImage*)image ForUrl:(NSString*)imageUrl;

@end
