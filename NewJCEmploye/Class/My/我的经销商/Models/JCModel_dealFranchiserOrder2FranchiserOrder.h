//
//  JCModel_dealFranchiserOrder2FranchiserOrder.h
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_dealFranchiserOrder2FranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, assign) double customerId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
