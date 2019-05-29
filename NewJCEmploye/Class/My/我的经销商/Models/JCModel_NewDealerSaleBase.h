//
//  JCModel_NewDealerSaleBase.h
//
//  Created by   on 2018/9/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewDealerSaleFranchiserOrder;

@interface JCModel_NewDealerSaleBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *sellGroupId;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *needOutStore;
@property (nonatomic, strong) NSString *storeHourse;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_NewDealerSaleFranchiserOrder *franchiserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
