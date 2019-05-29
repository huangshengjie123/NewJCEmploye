//
//  JCModel_reWritePurchaserOrderPurchaserOrder.h
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_reWritePurchaserOrderPurchaserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *purchaserOrderIdentifier;
@property (nonatomic, strong) NSArray *purchaserOrderCosts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
