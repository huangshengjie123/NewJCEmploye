//
//  JCModel_probationOrderCustomer.h
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_probationOrderCustomer : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double customerIdentifier;
@property (nonatomic, assign) id guide;
@property (nonatomic, assign) id areaId;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) id customerDescription;
@property (nonatomic, assign) id introducer;
@property (nonatomic, assign) id sex;
@property (nonatomic, assign) id from;
@property (nonatomic, assign) id introducerName;
@property (nonatomic, assign) id weChat;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, assign) id createTime;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) id isRegister;
@property (nonatomic, assign) id account;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
