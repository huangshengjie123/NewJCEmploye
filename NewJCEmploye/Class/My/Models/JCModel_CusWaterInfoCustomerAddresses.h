//
//  JCModel_CusWaterInfoCustomerAddresses.h
//
//  Created by   on 2018/8/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CusWaterInfoCustomerAddresses : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double addressId;
@property (nonatomic, assign) id deliveryTime;
@property (nonatomic, assign) double cusId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *xpath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
