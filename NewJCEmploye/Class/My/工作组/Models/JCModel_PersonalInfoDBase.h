//
//  JCModel_PersonalInfoDBase.h
//
//  Created by   on 2018/11/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_PersonalInfoDBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *result;
@property (nonatomic, assign) id num;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) id msg;
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
