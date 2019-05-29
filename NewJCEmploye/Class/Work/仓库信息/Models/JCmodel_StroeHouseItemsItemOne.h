//
//  JCmodel_StroeHouseItemsItemOne.h
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCmodel_StroeHouseItemsItemOne : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unit;
@property (nonatomic, assign) double itemOneIdentifier;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSArray *itemsList;
@property (nonatomic, assign) id itemOneDescription;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
