//
//  JCModel_ReturnVisitData.h
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ReturnVisitPageProperties;

@interface JCModel_ReturnVisitData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_ReturnVisitPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
