//
//  JCModel_GroupEMPList.h
//
//  Created by   on 2018/11/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_GroupEMPList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) id phone;
@property (nonatomic, assign) id mbPhone;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, assign) id weChat;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *saleGroupId;
@property (nonatomic, assign) id address;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, assign) double lock;
@property (nonatomic, assign) id qq;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id email;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
