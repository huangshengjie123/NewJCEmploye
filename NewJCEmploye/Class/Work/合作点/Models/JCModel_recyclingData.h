//
//  JCModel_recyclingData.h
//
//  Created by   on 2019/1/16
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_recyclingData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) double unit;
@property (nonatomic, assign) double state;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
