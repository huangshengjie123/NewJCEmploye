//
//  JCModel_NewPayBackUpOrder.h
//
//  Created by   on 2019/1/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewPayBackUpOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orderIdentifier;
@property (nonatomic, strong) NSArray *payments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
