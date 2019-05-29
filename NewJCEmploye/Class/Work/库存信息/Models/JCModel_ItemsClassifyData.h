//
//  JCModel_ItemsClassifyData.h
//
//  Created by   on 2018/5/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ItemsClassifyData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unit;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) id itemsList;
@property (nonatomic, assign) id dataDescription;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
