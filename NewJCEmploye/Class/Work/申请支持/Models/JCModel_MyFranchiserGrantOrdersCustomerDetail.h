//
//  JCModel_MyFranchiserGrantOrdersCustomerDetail.h
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MyFranchiserGrantOrdersCustomerDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, assign) double customerDetailIdentifier;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *income;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *customerDetailDescription;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *interest;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
