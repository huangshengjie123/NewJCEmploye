//
//  JCModel_InterstIncomeDebiter.h
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_InterstIncomeDebiter : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double debiterIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *mbPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
