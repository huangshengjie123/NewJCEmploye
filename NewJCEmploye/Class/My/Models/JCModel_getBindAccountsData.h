//
//  JCModel_getBindAccountsData.h
//
//  Created by   on 2018/12/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_getBindAccountsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *xpath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
