//
//  JCModel_ProabtionCustomData.h
//
//  Created by   on 2018/4/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ProabtionCustomPageProperties;

@interface JCModel_ProabtionCustomData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_ProabtionCustomPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
