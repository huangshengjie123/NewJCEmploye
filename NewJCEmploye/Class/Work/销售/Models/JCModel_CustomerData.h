//
//  JCModel_CustomerData.h
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_CustomerPageProperties;

@interface JCModel_CustomerData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_CustomerPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
