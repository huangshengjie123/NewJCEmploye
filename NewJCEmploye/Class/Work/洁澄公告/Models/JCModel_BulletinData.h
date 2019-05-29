//
//  JCModel_BulletinData.h
//
//  Created by   on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_BulletinPageProperties;

@interface JCModel_BulletinData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_BulletinPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
