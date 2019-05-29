//
//  JCModel_NewDistributionCarDetailsCars.h
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewDistributionCarDetailsCars : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double uid;
@property (nonatomic, assign) id carItems;
@property (nonatomic, assign) double carsIdentifier;
@property (nonatomic, strong) NSString *plate;
@property (nonatomic, assign) id orgName;
@property (nonatomic, assign) id com;
@property (nonatomic, assign) id name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
