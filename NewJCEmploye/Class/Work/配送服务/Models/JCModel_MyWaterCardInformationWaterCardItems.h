//
//  JCModel_MyWaterCardInformationWaterCardItems.h
//
//  Created by   on 2018/7/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MyWaterCardInformationWaterCardItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double   num;
@property (nonatomic, strong) NSString *waterCardItemsIdentifier;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, assign) double   item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
