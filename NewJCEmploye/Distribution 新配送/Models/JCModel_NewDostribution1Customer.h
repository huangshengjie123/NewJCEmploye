//
//  JCModel_NewDostribution1Customer.h
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewDostribution1CustomerDetail;

@interface JCModel_NewDostribution1Customer : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id account;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, assign) double customerIdentifier;
@property (nonatomic, assign) id wxopenid;
@property (nonatomic, strong) JCModel_NewDostribution1CustomerDetail *customerDetail;
@property (nonatomic, assign) id tag;
@property (nonatomic, assign) id guide;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id createTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
