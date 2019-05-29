//
//  JCModel_cancelIncomebase.h
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_cancelIncomebase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *internalBaseClassIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
