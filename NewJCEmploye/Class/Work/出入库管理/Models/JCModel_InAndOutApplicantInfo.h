//
//  JCModel_InAndOutApplicantInfo.h
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_InAndOutApplicantInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double applicantInfoIdentifier;
@property (nonatomic, assign) id lastName;
@property (nonatomic, assign) id phone;
@property (nonatomic, assign) id firstName;
@property (nonatomic, assign) id mbPhone;
@property (nonatomic, assign) id sex;
@property (nonatomic, assign) id weChat;
@property (nonatomic, assign) id xpath;
@property (nonatomic, assign) id address;
@property (nonatomic, assign) id qq;
@property (nonatomic, assign) id orgName;
@property (nonatomic, assign) id email;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
