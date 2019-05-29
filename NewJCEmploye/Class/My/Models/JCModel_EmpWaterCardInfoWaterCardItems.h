//
//  JCModel_EmpWaterCardInfoWaterCardItems.h
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_EmpWaterCardInfoWaterCardItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *waterCardItemsIdentifier;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) id unit;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
