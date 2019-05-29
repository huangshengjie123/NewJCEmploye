//
//  JCModel_ItemsItemOne.h
//
//  Created by   on 2018/5/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ItemsItemOne : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unit;
@property (nonatomic, assign) double itemOneIdentifier;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSArray *itemsList;
@property (nonatomic, strong) NSString *itemOneDescription;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
