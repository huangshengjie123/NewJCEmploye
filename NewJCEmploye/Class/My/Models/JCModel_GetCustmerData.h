//
//  JCModel_GetCustmerData.h
//
//  Created by   on 2019/2/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_GetCustmerCustomerDetail;

@interface JCModel_GetCustmerData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) id introducer;
@property (nonatomic, assign) id curCom;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id tag;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *wxopenid;
@property (nonatomic, strong) NSString *staffName;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) JCModel_GetCustmerCustomerDetail *customerDetail;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *id;



+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
