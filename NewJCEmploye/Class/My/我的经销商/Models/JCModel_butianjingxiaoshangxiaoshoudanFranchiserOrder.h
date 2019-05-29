//
//  JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder.h
//
//  Created by   on 2019/4/3
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, assign) double customerId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
