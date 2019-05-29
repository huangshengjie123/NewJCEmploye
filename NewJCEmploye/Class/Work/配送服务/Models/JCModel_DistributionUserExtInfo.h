//
//  JCModel_DistributionUserExtInfo.h
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_DistributionUserExtInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userExtInfoIdentifier;
@property (nonatomic, assign) id lastName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) id firstName;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, assign) id sex;
@property (nonatomic, assign) id weChat;
@property (nonatomic, assign) id xpath;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) id qq;
@property (nonatomic, assign) id orgName;
@property (nonatomic, assign) id email;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
