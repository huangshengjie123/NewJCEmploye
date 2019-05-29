//
//  JCModel_WaterCardWaterCardItems.h
//
//  Created by   on 2018/6/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WaterCardWaterCardItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *waterCardItemsIdentifier;
@property (nonatomic, assign) id num;
@property (nonatomic, assign) id itemName;
@property (nonatomic, assign) id item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
