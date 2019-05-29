//
//  JCModel_dealFranchiserProbationMProbation.h
//
//  Created by   on 2018/9/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_dealFranchiserProbationMProbation : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *probationIdentifier;
@property (nonatomic, assign) id endProperty;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) id start;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSArray *probationCosts;
@property (nonatomic, assign) double preid;
@property (nonatomic, assign) id cust;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
