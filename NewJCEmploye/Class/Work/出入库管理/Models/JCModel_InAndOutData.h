//
//  JCModel_InAndOutData.h
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_InAndOutPageProperties;

@interface JCModel_InAndOutData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_InAndOutPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
