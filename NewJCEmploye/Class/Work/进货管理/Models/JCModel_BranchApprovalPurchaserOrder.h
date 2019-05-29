//
//  JCModel_BranchApprovalPurchaserOrder.h
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_BranchApprovalPurchaserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *purchaserOrderIdentifier;
@property (nonatomic, strong) NSString *inStoreHouseId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
