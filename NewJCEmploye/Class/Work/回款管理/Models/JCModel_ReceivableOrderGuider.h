//
//  JCModel_ReceivableOrderGuider.h
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ReceivableOrderGuider : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double guiderIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id mbPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
