//
//  JCModel_FranchiserByUid1Data.h
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_FranchiserByUid1Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSArray *stores;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double balance;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
