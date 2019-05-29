//
//  JCModel_CleanWaterBase.h
//
//  Created by   on 2018/12/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CleanWaterBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *toCardId;
@property (nonatomic, assign) double toCusId;
@property (nonatomic, assign) BOOL needBind;
@property (nonatomic, strong) NSArray *itemXNums;
@property (nonatomic, strong) NSString *fromCardId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
