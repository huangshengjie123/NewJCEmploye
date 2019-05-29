//
//  JCModel_groupLeaderTransferwaterWaterCardChangeList.h
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_groupLeaderTransferwaterWaterCardChangeList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *staffCardId;
@property (nonatomic, assign) double num;
@property (nonatomic, assign) double item;
@property (nonatomic, strong) NSString *cusCardId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
