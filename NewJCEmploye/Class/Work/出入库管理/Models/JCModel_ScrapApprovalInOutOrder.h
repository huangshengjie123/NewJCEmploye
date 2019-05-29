//
//  JCModel_ScrapApprovalInOutOrder.h
//
//  Created by   on 2019/4/11
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ScrapApprovalInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *inOutOrderIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
