//
//  JCModel_probationOrderData.h
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_probationOrderPageProperties;

@interface JCModel_probationOrderData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_probationOrderPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
