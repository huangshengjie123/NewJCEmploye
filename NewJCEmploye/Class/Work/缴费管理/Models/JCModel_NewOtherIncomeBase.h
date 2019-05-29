//
//  JCModel_NewOtherIncomeBase.h
//
//  Created by   on 2019/3/9
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewOtherIncomeBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double amount;
@property (nonatomic, strong) NSString *comment;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
