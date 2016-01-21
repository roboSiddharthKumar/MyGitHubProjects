//
//  TBMImageDownload.h
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TBMImageDownloadDelegate.h"

@interface TBMImageDownload : NSOperation
-(instancetype)initWithImageUrl:(NSString*)url forDelegate:(id<TBMImageDownloadDelegate>)delegate;
@end
