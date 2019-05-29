//
//  JCModel_HomeToNewGroupGroupRelations.h
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_HomeToNewGroupGroupRelations : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double number;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
