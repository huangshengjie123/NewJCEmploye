//
//  JCModel_empDataBData.h
//
//  Created by   on 2019/1/14
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_empDataBData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, assign) id xpath;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, assign) id orgName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
