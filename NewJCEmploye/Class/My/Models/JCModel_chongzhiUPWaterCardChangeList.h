//
//  JCModel_chongzhiUPWaterCardChangeList.h
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_chongzhiUPWaterCardChangeList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *staffCardId;
@property (nonatomic, assign) double item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
