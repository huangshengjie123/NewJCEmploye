//
//  JCModel_groupLeaderTransferwaterBase.h
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_groupLeaderTransferwaterBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *waterCardChangeList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
