//
//  JCModel_MyFranchiserGrantOrdersCustomerPrepare.h
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MyFranchiserGrantOrdersCustomerPrepare : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double customerPrepareIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *customerPrepareDescription;
@property (nonatomic, strong) NSString *introducer;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, assign) double from;
@property (nonatomic, strong) NSString *introducerName;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double isRegister;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
