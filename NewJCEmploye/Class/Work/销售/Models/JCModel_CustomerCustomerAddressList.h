//
//  JCModel_CustomerCustomerAddressList.h
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CustomerCustomerAddressList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cusId;
@property (nonatomic, assign) double customerAddressListIdentifier;
@property (nonatomic, strong) NSString *deliveryTime;
@property (nonatomic, strong) NSString *address;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
