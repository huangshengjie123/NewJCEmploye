//
//  JCModel_MyFranchiserGrantOrdersCustomerAddressList.h
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MyFranchiserGrantOrdersCustomerAddressList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double addressId;
@property (nonatomic, strong) NSString *deliveryTime;
@property (nonatomic, strong) NSString *linkman;
@property (nonatomic, assign) double cusId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *xpath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
