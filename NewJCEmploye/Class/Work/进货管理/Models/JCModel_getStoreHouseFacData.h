//
//  JCModel_getStoreHouseFacData.h
//
//  Created by   on 2018/9/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_getStoreHouseFacPageProperties;

@interface JCModel_getStoreHouseFacData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_getStoreHouseFacPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
