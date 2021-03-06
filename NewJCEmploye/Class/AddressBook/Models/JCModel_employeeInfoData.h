//
//  JCModel_employeeInfoData.h
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_employeeInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
