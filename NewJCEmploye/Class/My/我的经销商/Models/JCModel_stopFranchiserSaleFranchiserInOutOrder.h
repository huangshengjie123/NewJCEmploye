//
//  JCModel_stopFranchiserSaleFranchiserInOutOrder.h
//
//  Created by   on 2019/4/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_stopFranchiserSaleFranchiserInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiserInOutOrderIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
