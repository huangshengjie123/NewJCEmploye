//
//  JCModel_watercardRecordsData.h
//
//  Created by   on 2018/10/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_watercardRecordsPageProperties;

@interface JCModel_watercardRecordsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_watercardRecordsPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
