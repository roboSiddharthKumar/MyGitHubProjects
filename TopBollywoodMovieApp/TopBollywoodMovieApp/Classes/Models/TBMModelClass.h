//
//  TBMModelClass.h
//  TopBollywoodMovieApp
//
//  Created by Siddharth Kumar on 04/01/16.
//  Copyright © 2016 Robosoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBMModelClass : NSObject
@property (copy,nonatomic) NSString *movieName;
@property (copy,nonatomic) NSString *artistName;
@property (copy,nonatomic) NSString *releaseDate;
@property (copy,nonatomic) NSString *price;
@property (copy,nonatomic) NSString *imageUrl;
@property (copy,nonatomic) NSString *summary;
-(id)initWithData:(NSDictionary *)jsonData;
@end
