//
//  TBMModelClass.m
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import "TBMModelClass.h"
#import "TBMConstants.h"

@implementation TBMModelClass

/**
 The convenience methods to set the movie contents
 
 @param: jsonData contents dictionary.
 
 @returns: instancetype The TBModelClass instance type.
 
 */

-(instancetype)initWithData:(NSDictionary *)jsonData{
    
    self.movieName=[[jsonData objectForKey:k_MovieName]objectForKey:k_MovieNameLabel];
    self.artistName=[[jsonData objectForKey:k_Artist]objectForKey:k_ArtistLabel];
    self.releaseDate=[[[jsonData objectForKey:k_ReleaseDate]objectForKey:k_ReleaseDateAttribute]objectForKey:k_ReleaseDateLabel];
    self.price=[[jsonData objectForKey:k_Price]objectForKey:k_priceLabel];
    self.imageUrl =[[[jsonData objectForKey:k_ImageUrl]objectAtIndex:2]objectForKey:k_ImageUrlLabel];
    self.summary =[[jsonData objectForKey:k_Summary]objectForKey:k_SummaryLabel];
    return self;
    
}

@end
