//
//  JCModel_PackageData.h
//
//  Created by   on 2018/6/12
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_PackageData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) NSInteger type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
