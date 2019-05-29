//
//  JCModel_OtherIncomeData.h
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_OtherIncomePageProperties;

@interface JCModel_OtherIncomeData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_OtherIncomePageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
