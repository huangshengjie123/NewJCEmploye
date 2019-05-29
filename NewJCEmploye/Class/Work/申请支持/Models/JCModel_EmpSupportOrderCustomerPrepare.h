//
//  JCModel_EmpSupportOrderCustomerPrepare.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_EmpSupportOrderCustomerPrepare : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double customerPrepareIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *customerPrepareDescription;
@property (nonatomic, assign) id introducer;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, assign) double from;
@property (nonatomic, assign) id introducerName;
@property (nonatomic, assign) id weChat;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double isRegister;
@property (nonatomic, assign) id account;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
