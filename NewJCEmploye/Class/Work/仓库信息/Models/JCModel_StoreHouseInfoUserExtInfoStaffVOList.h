//
//  JCModel_StoreHouseInfoUserExtInfoStaffVOList.h
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_StoreHouseInfoUserExtInfoStaffVOList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userExtInfoStaffVOListIdentifier;
@property (nonatomic, assign) double staff;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
