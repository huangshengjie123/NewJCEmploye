//
//  JCModel_ReturnVisitCustomer.h
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ReturnVisitCustomerDetail;

@interface JCModel_ReturnVisitCustomer : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double customerIdentifier;
@property (nonatomic, assign) id guide;
@property (nonatomic, assign) id introducer;
@property (nonatomic, assign) id curCom;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id tag;
@property (nonatomic, assign) id createTime;
@property (nonatomic, assign) id wxopenid;
@property (nonatomic, assign) id staffName;
@property (nonatomic, assign) id account;
@property (nonatomic, strong) JCModel_ReturnVisitCustomerDetail *customerDetail;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
