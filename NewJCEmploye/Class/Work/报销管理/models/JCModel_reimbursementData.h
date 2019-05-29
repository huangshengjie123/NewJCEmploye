//
//  JCModel_reimbursementData.h
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_reimbursementPageProperties;

@interface JCModel_reimbursementData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_reimbursementPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
