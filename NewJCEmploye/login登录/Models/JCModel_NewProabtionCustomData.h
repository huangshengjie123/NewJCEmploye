//
//  JCModel_NewProabtionCustomData.h
//
//  Created by   on 2019/2/15
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewProabtionCustomPageProperties;

@interface JCModel_NewProabtionCustomData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_NewProabtionCustomPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
