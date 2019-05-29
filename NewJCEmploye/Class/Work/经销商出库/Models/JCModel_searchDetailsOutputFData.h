//
//  JCModel_searchDetailsOutputFData.h
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_searchDetailsOutputFPageProperties;

@interface JCModel_searchDetailsOutputFData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_searchDetailsOutputFPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
