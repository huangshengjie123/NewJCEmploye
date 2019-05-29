//
//  JCModel_PackageItems.h
//
//  Created by   on 2018/6/12
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_PackageItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double num;
@property (nonatomic, assign) double gid;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) id type;
@property (nonatomic, assign) double item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
