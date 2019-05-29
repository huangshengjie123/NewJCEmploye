//
//  JCModel_distribute_checkPurchaserOrder.h
//
//  Created by   on 2018/9/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_distribute_checkPurchaserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *purchaserOrderIdentifier;
@property (nonatomic, strong) NSString *distributer;
@property (nonatomic, strong) NSString *storeHouseId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
