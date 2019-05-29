//
//  JCModel_salesReturnData.h
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_salesReturnPageProperties;

@interface JCModel_salesReturnData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_salesReturnPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
