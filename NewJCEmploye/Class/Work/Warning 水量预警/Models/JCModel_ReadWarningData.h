//
//  JCModel_ReadWarningData.h
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ReadWarningPageProperties;

@interface JCModel_ReadWarningData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_ReadWarningPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
