//
//  JCModel_distribute_confirmPurchaserOrder.h
//
//  Created by   on 2018/9/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_distribute_confirmPurchaserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *purchaserOrderIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
