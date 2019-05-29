//
//  JCModel_HomeToNewGroupWorkGroup.h
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_HomeToNewGroupWorkGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *workGroupIdentifier;
@property (nonatomic, strong) NSArray *groupRelations;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
