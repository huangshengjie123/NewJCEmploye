//
//  JCModel_stopPurchaserOrderBase.h
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_stopPurchaserOrderPurchaserOrder;

@interface JCModel_stopPurchaserOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_stopPurchaserOrderPurchaserOrder *purchaserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
