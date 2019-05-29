//
//  JCModel_ShowReturnVisitData.h
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ShowReturnVisitPageProperties;

@interface JCModel_ShowReturnVisitData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_ShowReturnVisitPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
