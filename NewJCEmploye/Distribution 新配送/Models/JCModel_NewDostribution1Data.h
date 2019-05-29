//
//  JCModel_NewDostribution1Data.h
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewDostribution1PageProperties;

@interface JCModel_NewDostribution1Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_NewDostribution1PageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
