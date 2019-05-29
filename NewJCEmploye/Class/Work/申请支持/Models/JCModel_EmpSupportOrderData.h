//
//  JCModel_EmpSupportOrderData.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_EmpSupportOrderPageProperties;

@interface JCModel_EmpSupportOrderData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_EmpSupportOrderPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
