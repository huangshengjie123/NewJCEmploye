//
//  JCModel_inOutRewriteItems.h
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_inOutRewriteItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, assign) double item;
@property (nonatomic, strong) NSString *test;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
