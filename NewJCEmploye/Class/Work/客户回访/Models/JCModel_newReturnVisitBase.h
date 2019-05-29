//
//  JCModel_newReturnVisitBase.h
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_newReturnVisitVisit, JCModel_newReturnVisitCommand;

@interface JCModel_newReturnVisitBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_newReturnVisitVisit *visit;
@property (nonatomic, strong) JCModel_newReturnVisitCommand *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
