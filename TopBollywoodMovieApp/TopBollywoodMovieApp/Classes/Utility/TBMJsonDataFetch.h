//
//  TBMJsonDataFetch.h
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBMModelClass.h"
@protocol TBMDataFetchDelegate <NSObject>
@optional
-(void)didFinishFetchingData:(NSMutableArray*)responseArray;
-(void)didFailFetchingData:(NSError*)error;
@end

@interface TBMJsonDataFetch : NSOperation
@property (weak,nonatomic) id <TBMDataFetchDelegate> delegate;
@property (strong,nonatomic) NSMutableArray *array;
-(instancetype)initWithDataUrl:(NSString*)url forDelegate:(id<TBMDataFetchDelegate>)delegate;
@property (strong,nonatomic)NSString* dataUrl;

@end
