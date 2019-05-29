//
//  JCModel_seachModelData2Base.h
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_seachModelData2Base : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cycle;
@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, strong) NSString *cycleNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
