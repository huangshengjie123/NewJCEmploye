//
//  JCModel_NewDostribution1Cars.h
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewDostribution1Cars : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id uid;
@property (nonatomic, assign) id carItems;
@property (nonatomic, assign) double carsIdentifier;
@property (nonatomic, assign) id plate;
@property (nonatomic, assign) id orgName;
@property (nonatomic, assign) id com;
@property (nonatomic, assign) id name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
