//
//  JCModel_EmpSupportOrderFranchiserDetail.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_EmpSupportOrderFranchiserDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiserDetailIdentifier;
@property (nonatomic, assign) id guide;
@property (nonatomic, assign) id areaId;
@property (nonatomic, assign) id uid;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) id com;
@property (nonatomic, assign) id ratio;
@property (nonatomic, assign) id balance;
@property (nonatomic, assign) id type;
@property (nonatomic, assign) id cash;
@property (nonatomic, assign) id address;
@property (nonatomic, assign) id isAction;
@property (nonatomic, assign) id stores;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
