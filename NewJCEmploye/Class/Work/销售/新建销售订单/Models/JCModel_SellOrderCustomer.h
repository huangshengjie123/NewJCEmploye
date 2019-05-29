//
//  JCModel_SellOrderCustomer.h
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_SellOrderCustomerDetail;

@interface JCModel_SellOrderCustomer : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id account;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, assign) double customerIdentifier;
@property (nonatomic, strong) JCModel_SellOrderCustomerDetail *customerDetail;
@property (nonatomic, assign) id guide;
@property (nonatomic, assign) id tag;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id createTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
