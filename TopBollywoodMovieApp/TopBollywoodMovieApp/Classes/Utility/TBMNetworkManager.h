//
//  TBMNetworkManager.h
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBMImageDownloadDelegate.h"
#import "TBMJsonDataFetch.h"

@interface TBMNetworkManager : NSObject
@property(strong,nonatomic)NSOperationQueue *operationQueue;
+ (instancetype)sharedInstance;

-(void) downloadImageForUrl:(NSString*)imageUrl forDelegate:(id<TBMImageDownloadDelegate>)delegate;
-(void)fetchDataFromJson:(NSString *)dataUrl ForDelegate:(id<TBMDataFetchDelegate>)delegate;

@end
