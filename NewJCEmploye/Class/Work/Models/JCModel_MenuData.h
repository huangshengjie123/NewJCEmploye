//
//  JCModel_MenuData.h
//
//  Created by   on 2018/5/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MenuData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) double cataId;
@property (nonatomic, strong) NSString *authId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
