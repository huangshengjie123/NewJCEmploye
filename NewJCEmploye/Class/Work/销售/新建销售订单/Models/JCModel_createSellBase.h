//
//  JCModel_createSellBase.h
//
//  Created by   on 2018/6/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_createSellOrder;

@interface JCModel_createSellBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isPre;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, assign) BOOL isOutStore;
@property (nonatomic, strong) JCModel_createSellOrder *order;
@property (nonatomic, strong) NSString *preId;
@property (nonatomic, strong) NSString *sellGroupId;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *storeHourse;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
