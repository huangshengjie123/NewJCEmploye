//
//  JCModel_CooperationPoiontOrderItems.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CooperationPoiontOrderItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *itemsIdentifier;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) double unit;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
