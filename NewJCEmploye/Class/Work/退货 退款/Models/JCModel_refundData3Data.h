//
//  JCModel_refundData3Data.h
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_refundData3PageProperties;

@interface JCModel_refundData3Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_refundData3PageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
