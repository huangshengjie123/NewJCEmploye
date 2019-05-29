//
//  JCModel_franchiserStores.h
//
//  Created by   on 2018/9/11
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_franchiserStores : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *storesIdentifier;
@property (nonatomic, assign) double item;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
