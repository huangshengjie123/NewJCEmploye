//
//  JCModel_newPurchaserOrderBase.h
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_newPurchaserOrderPurchaserOrder;

@interface JCModel_newPurchaserOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_newPurchaserOrderPurchaserOrder *purchaserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
