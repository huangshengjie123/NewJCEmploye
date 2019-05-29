//
//  JCModel_EmpSupportProbationClinchBase.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportProbationClinchBase.h"
#import "JCModel_EmpSupportProbationClinchFranchiserOrder.h"


NSString *const kJCModel_EmpSupportProbationClinchBaseCommand = @"command";
NSString *const kJCModel_EmpSupportProbationClinchBaseCurrent = @"current";
NSString *const kJCModel_EmpSupportProbationClinchBaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_EmpSupportProbationClinchBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportProbationClinchBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize franchiserOrder = _franchiserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_EmpSupportProbationClinchBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_EmpSupportProbationClinchBaseCurrent fromDictionary:dict];
            self.franchiserOrder = [JCModel_EmpSupportProbationClinchFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportProbationClinchBaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_EmpSupportProbationClinchBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_EmpSupportProbationClinchBaseCurrent];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_EmpSupportProbationClinchBaseFranchiserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_EmpSupportProbationClinchBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_EmpSupportProbationClinchBaseCurrent];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_EmpSupportProbationClinchBaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_EmpSupportProbationClinchBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_EmpSupportProbationClinchBaseCurrent];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_EmpSupportProbationClinchBaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportProbationClinchBase *copy = [[JCModel_EmpSupportProbationClinchBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
