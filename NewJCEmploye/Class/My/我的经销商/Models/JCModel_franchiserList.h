//
//  JCModel_franchiserList.h
//
//  Created by   on 2018/9/11
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_franchiserList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id ratio;
@property (nonatomic, assign) double balance;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSArray *stores;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
