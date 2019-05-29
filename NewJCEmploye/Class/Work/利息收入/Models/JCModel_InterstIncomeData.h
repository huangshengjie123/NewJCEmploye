//
//  JCModel_InterstIncomeData.h
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_InterstIncomePageProperties;

@interface JCModel_InterstIncomeData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_InterstIncomePageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
