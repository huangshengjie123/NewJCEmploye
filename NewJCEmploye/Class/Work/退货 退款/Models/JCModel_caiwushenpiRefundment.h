//
//  JCModel_caiwushenpiRefundment.h
//
//  Created by   on 2019/4/8
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_caiwushenpiRefundment : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *refundmentIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
