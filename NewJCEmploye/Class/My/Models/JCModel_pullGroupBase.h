//
//  JCModel_pullGroupBase.h
//
//  Created by   on 2018/10/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_pullGroupWorkGroup;

@interface JCModel_pullGroupBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *applicant;
@property (nonatomic, strong) JCModel_pullGroupWorkGroup *workGroup;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
