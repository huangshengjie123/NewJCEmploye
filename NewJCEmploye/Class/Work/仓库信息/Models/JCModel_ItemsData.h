//
//  JCModel_ItemsData.h
//
//  Created by   on 2018/5/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ItemsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, assign) double state;
@property (nonatomic, strong) NSArray *itemOne;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) double user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
