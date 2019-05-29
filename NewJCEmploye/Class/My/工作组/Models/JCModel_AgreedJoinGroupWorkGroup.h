//
//  JCModel_AgreedJoinGroupWorkGroup.h
//
//  Created by   on 2018/10/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_AgreedJoinGroupWorkGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *workGroupIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
