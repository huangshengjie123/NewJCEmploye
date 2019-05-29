//
//  JCModel_warehouseRejectJsonBase.h
//
//  Created by   on 2018/5/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_warehouseRejectJsonInOutOrder;

@interface JCModel_warehouseRejectJsonBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, assign) BOOL isStoreOutCheckPass;
@property (nonatomic, strong) JCModel_warehouseRejectJsonInOutOrder *inOutOrder;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *backReason;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
