//
//  TBMNetworkManager.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMNetworkManager.h"
#import "TBMImageDownload.h"
#import "TBMJsonDataFetch.h"

@implementation TBMNetworkManager
/**
 @brief: This method creates sigleton instance for the TBMNetworkManager class
 @return : sharedInstance, an instace of type TBMNetworkManager.
 */
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static TBMNetworkManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [TBMNetworkManager new];
        sharedInstance.operationQueue=[[NSOperationQueue alloc]init];
    });
    return sharedInstance;
}

/**
 @breif: This method create an intance of TBMImageDownload class and adds it to the operation queue.
 @param: imageUrl,contains url for downloading Image.
         delegate of type TBMImageDownloadDelegate.
 */
-(void) downloadImageForUrl:(NSString*)imageUrl forDelegate:(id<TBMImageDownloadDelegate>)delegate {
    TBMImageDownload *operation=[[TBMImageDownload alloc]initWithImageUrl:imageUrl forDelegate:delegate];
    [self.operationQueue addOperation:operation];
    
}
/**
 @breif: This method create an intance of TBMJsonDataFetch class and adds it to the operation queue.
 @param: imageUrl,contains url for fetching data from json.
 delegate of type TBMJsonDataFetch.
 */

-(void)fetchDataFromJson : (NSString *)dataUrl ForDelegate:(id<TBMDataFetchDelegate>)delegate {
    TBMJsonDataFetch * operation = [[TBMJsonDataFetch alloc]initWithDataUrl:dataUrl forDelegate:delegate];
    operation.delegate = delegate;
    [self.operationQueue addOperation:operation];
    
}

@end
