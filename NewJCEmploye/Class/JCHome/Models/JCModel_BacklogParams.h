//
//  JCModel_BacklogParams.h
//
//  Created by   on 2018/12/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_BacklogParams : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double applicant;
@property (nonatomic, assign) double owner;
@property (nonatomic, strong) NSString *workGroup;
@property (nonatomic, assign) id initiator;
@property (nonatomic, strong) NSString *procType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
