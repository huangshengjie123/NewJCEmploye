//
//  JCModel_NewSellBase.h
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewSellOrder;

@interface JCModel_NewSellBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isPre;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_NewSellOrder *order;
@property (nonatomic, assign) double preId;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
