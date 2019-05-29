//
//  JCModel_InterstIncomeCreditComInfo.h
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_InterstIncomeCreditComInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *orgName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
