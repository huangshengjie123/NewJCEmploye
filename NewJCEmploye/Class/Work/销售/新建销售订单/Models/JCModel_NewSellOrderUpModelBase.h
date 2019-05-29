//
//  JCModel_NewSellOrderUpModelBase.h
//
//  Created by   on 2018/7/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewSellOrderUpModelOrder;

@interface JCModel_NewSellOrderUpModelBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isPre;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, assign) BOOL isOutStore;
@property (nonatomic, strong) JCModel_NewSellOrderUpModelOrder *order;
@property (nonatomic, strong) NSString *preId;
@property (nonatomic, strong) NSString *sellGroupId;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *storeHourse;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
