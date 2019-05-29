//
//  JCModel_FinfoData.h
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_FinfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic, assign) double balance;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSArray *stores;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
