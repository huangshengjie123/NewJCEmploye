//
//  JCModel_MyFranchiserGrantOrdersData.h
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_MyFranchiserGrantOrdersPageProperties;

@interface JCModel_MyFranchiserGrantOrdersData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_MyFranchiserGrantOrdersPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
