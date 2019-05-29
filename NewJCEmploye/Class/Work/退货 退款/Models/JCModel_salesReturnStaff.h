//
//  JCModel_salesReturnStaff.h
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_salesReturnStaff : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double staffIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id mbPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
