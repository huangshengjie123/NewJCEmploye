//
//  JCModel_rukumodelInOutOrder.h
//
//  Created by   on 2019/2/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_rukumodelInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *inOutOrderIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
