//
//  JCModel_GetItemPriceData.h
//
//  Created by   on 2018/11/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_GetItemPriceData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unit;
@property (nonatomic, assign) double priceFrK;
@property (nonatomic, assign) double priceFra;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSArray *itemsList;
@property (nonatomic, assign) id dataDescription;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double priceCoo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
