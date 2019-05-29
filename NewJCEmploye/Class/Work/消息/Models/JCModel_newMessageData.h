//
//  JCModel_newMessageData.h
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_newMessagePageProperties;

@interface JCModel_newMessageData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_newMessagePageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
