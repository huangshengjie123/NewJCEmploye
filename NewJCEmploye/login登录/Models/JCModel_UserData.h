//
//  JCModel_UserData.h
//
//  Created by   on 2018/5/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_UserData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *thePasswd;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, assign) double lock;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
