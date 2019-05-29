//
//  JCmodel_newCustomer2List.h
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCmodel_newCustomer2CustomerDetail;

@interface JCmodel_newCustomer2List : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) id introducer;
@property (nonatomic, strong) NSString *curCom;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, strong) NSString *staffMbPhone;
@property (nonatomic, strong) NSString *introducerName;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id tag;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) id wxopenid;
@property (nonatomic, strong) NSString *staffName;
@property (nonatomic, strong) NSString *cardId;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) JCmodel_newCustomer2CustomerDetail *customerDetail;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *introduceMbPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
