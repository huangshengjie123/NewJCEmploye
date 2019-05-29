//
//  JCmodel_newCustomer2CustomerDetail.h
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCmodel_newCustomer2CustomerDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double customerDetailIdentifier;
@property (nonatomic, strong) NSString *customerDetailDescription;
@property (nonatomic, assign) id phone;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *income;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *interest;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
