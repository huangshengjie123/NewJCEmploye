//
//  JCmodel_newCustomer2Data.h
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCmodel_newCustomer2PageProperties;

@interface JCmodel_newCustomer2Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCmodel_newCustomer2PageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
