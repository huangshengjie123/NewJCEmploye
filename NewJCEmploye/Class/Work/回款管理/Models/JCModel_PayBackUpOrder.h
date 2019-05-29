//
//  JCModel_PayBackUpOrder.h
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_PayBackUpOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orderIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
