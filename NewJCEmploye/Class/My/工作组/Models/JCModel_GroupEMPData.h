//
//  JCModel_GroupEMPData.h
//
//  Created by   on 2018/11/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_GroupEMPPageProperties;

@interface JCModel_GroupEMPData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_GroupEMPPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
