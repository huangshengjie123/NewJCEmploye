//
//  JCModel_EmpSupportOrderFranProbation.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_EmpSupportOrderCustomer, JCModel_EmpSupportOrderFranchiserDetail;

@interface JCModel_EmpSupportOrderFranProbation : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franProbationIdentifier;
@property (nonatomic, assign) id comments;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) id hasOut;
@property (nonatomic, strong) NSArray *probationCosts;
@property (nonatomic, assign) id guider;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) id com;
@property (nonatomic, strong) JCModel_EmpSupportOrderCustomer *customer;
@property (nonatomic, assign) id soid;
@property (nonatomic, strong) JCModel_EmpSupportOrderFranchiserDetail *franchiserDetail;
@property (nonatomic, assign) BOOL isDeal;
@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, assign) double preid;
@property (nonatomic, assign) id endProperty;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) id cust;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
