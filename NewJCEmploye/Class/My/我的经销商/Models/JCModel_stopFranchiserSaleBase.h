//
//  JCModel_stopFranchiserSaleBase.h
//
//  Created by   on 2019/4/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_stopFranchiserSaleFranchiserInOutOrder;

@interface JCModel_stopFranchiserSaleBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_stopFranchiserSaleFranchiserInOutOrder *franchiserInOutOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
