//
//  TBMJsonDataFetch.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMJsonDataFetch.h"
#import "TBMConstants.h"

@implementation TBMJsonDataFetch
/**
 @breif: This method is used for retrieving movie details from json file.
 */
-(void) fetch
{
    [self retrieveMovieDetails];
}

/**
 @brief : This method is used for used for initializing the delegate and dataUrl property
 @param : url ,contains url for establishing connection with json file.
          delegate, of type TBMDataFetchDelegate.
 @return :Returns an instace of type TBMJsonDataFetch.
 */
-(instancetype)initWithDataUrl:(NSString*)url forDelegate:(id<TBMDataFetchDelegate>)delegate {
    
    self = [super init];
    if(self) {
        
        _delegate = delegate;
        self.dataUrl = url;
    }
    return self;
}

/**
 @brief : Method responsible to set the model class object.
 @param : inData : data sent after reading the json file.
 */
-(void) fillModelObject:(NSData *) inData
{
    NSDictionary *details = [NSJSONSerialization JSONObjectWithData:inData options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray* resultArray = [[NSMutableArray alloc]init];
    
    NSDictionary *dictionary = [[details objectForKey:k_Feed]objectForKey:k_Entry];
    for (NSDictionary *dict in dictionary) {
    TBMModelClass* modelClass = [[TBMModelClass alloc]initWithData:dict];
    [resultArray addObject:modelClass];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
    if ([self.delegate respondsToSelector:@selector(didFinishFetchingData:)]) {
        [self.delegate didFinishFetchingData:resultArray];
    }});
}


/**
 Main Method
 
 */
-(void) main
{
    [self fetch];
}

/**
 @breif : The method establishes the connection with the server and fetches the data.
 */
-(void)retrieveMovieDetails{
        
        
        NSURL *URL = [NSURL URLWithString:self.dataUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error == nil) {
                [self fillModelObject:data];
                
            }else {
                if ([self.delegate respondsToSelector:@selector(didFailFetchingData:)]) {
                    [self.delegate didFailFetchingData:error];
                }
            }
            
            
        }];
        
        [task resume];
        
    }
@end

