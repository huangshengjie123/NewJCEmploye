//
//  JCModel_probationOrderPageProperties.h
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_probationOrderPageProperties : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double size;
@property (nonatomic, assign) double start;
@property (nonatomic, assign) double endProperty;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, assign) double pageNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
