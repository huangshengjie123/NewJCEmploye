//
//  JCModel_CustomerList.h
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CustomerList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, assign) id type;
@property (nonatomic, strong) NSString *income;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *interest;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
