//
//  JCModel_ReceivableOrderData.h
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ReceivableOrderPageProperties;

@interface JCModel_ReceivableOrderData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_ReceivableOrderPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
