//
//  JCModel_WorkLogData.h
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_WorkLogPageProperties;

@interface JCModel_WorkLogData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_WorkLogPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
