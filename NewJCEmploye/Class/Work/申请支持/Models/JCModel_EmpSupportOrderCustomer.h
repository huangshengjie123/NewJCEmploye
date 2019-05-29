//
//  JCModel_EmpSupportOrderCustomer.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_EmpSupportOrderCustomerDetail;

@interface JCModel_EmpSupportOrderCustomer : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id wxopenid;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, assign) id account;
@property (nonatomic, assign) id weChat;
@property (nonatomic, assign) id sex;
@property (nonatomic, assign) id isRegister;
@property (nonatomic, assign) id areaId;
@property (nonatomic, assign) id introducerName;
@property (nonatomic, strong) JCModel_EmpSupportOrderCustomerDetail *customerDetail;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id tag;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double customerIdentifier;
@property (nonatomic, assign) id introducer;
@property (nonatomic, assign) id curCom;
@property (nonatomic, assign) id guide;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) id from;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, assign) id createTime;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) id customerDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
