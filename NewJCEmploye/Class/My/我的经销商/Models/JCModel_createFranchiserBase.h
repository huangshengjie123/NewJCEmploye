//
//  JCModel_createFranchiserBase.h
//
//  Created by   on 2018/9/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_createFranchiserBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *stores;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double balance;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
