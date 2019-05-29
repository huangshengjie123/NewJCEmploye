//
//  JCModel_EmpSupportProbationClinchFranchiserOrder.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportProbationClinchFranchiserOrder.h"


NSString *const kJCModel_EmpSupportProbationClinchFranchiserOrderId = @"id";


@interface JCModel_EmpSupportProbationClinchFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportProbationClinchFranchiserOrder

@synthesize franchiserOrderIdentifier = _franchiserOrderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiserOrderIdentifier = [self objectOrNilForKey:kJCModel_EmpSupportProbationClinchFranchiserOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserOrderIdentifier forKey:kJCModel_EmpSupportProbationClinchFranchiserOrderId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.franchiserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_EmpSupportProbationClinchFranchiserOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserOrderIdentifier forKey:kJCModel_EmpSupportProbationClinchFranchiserOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportProbationClinchFranchiserOrder *copy = [[JCModel_EmpSupportProbationClinchFranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiserOrderIdentifier = [self.franchiserOrderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
