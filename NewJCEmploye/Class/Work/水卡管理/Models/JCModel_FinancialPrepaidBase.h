//
//  JCModel_FinancialPrepaidBase.h
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_FinancialPrepaidBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *purid;
@property (nonatomic, strong) NSString *waterCardId;
@property (nonatomic, strong) NSArray *itemXNums;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
