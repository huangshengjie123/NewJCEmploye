//
//  JCModel_supportCreateOrderFranchiserOrder.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_supportCreateOrderFranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiserOrderIdentifier;
@property (nonatomic, assign) double getamount;
@property (nonatomic, strong) NSArray *orderCosts;
@property (nonatomic, strong) NSArray *orderPresents;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
