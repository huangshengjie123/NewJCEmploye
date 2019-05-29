//
//  JCModel_EmpSupportProbationClinchBase.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_EmpSupportProbationClinchFranchiserOrder;

@interface JCModel_EmpSupportProbationClinchBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_EmpSupportProbationClinchFranchiserOrder *franchiserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
