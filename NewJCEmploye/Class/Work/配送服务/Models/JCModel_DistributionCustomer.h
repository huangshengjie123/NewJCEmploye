//
//  JCModel_DistributionCustomer.h
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_DistributionCustomerDetail;

@interface JCModel_DistributionCustomer : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id account;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, assign) double customerIdentifier;
@property (nonatomic, strong) JCModel_DistributionCustomerDetail *customerDetail;
@property (nonatomic, assign) id guide;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id createTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
