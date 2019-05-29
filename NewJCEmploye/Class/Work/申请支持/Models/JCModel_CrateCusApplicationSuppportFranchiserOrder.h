//
//  JCModel_CrateCusApplicationSuppportFranchiserOrder.h
//
//  Created by   on 2018/12/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CrateCusApplicationSuppportFranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double customerId;
@property (nonatomic, strong) NSString *comments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
