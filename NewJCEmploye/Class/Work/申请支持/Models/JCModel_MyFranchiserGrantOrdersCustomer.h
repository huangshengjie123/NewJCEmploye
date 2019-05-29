//
//  JCModel_MyFranchiserGrantOrdersCustomer.h
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_MyFranchiserGrantOrdersCustomerDetail;

@interface JCModel_MyFranchiserGrantOrdersCustomer : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *wxopenid;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, assign) id account;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *isRegister;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *introducerName;
@property (nonatomic, strong) JCModel_MyFranchiserGrantOrdersCustomerDetail *customerDetail;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double customerIdentifier;
@property (nonatomic, strong) NSString *introducer;
@property (nonatomic, strong) NSString *curCom;
@property (nonatomic, strong) NSString *guide;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *customerDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
