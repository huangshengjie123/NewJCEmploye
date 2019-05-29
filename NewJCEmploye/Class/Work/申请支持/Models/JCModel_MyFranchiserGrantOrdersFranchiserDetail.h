//
//  JCModel_MyFranchiserGrantOrdersFranchiserDetail.h
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MyFranchiserGrantOrdersFranchiserDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiserDetailIdentifier;
@property (nonatomic, strong) NSString *guide;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, assign) id uid;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *ratio;
@property (nonatomic, strong) NSString *balance;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *cash;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *isAction;
@property (nonatomic, strong) NSString *stores;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
