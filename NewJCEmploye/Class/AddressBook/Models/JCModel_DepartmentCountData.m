//
//  JCModel_DepartmentCountData.m
//
//  Created by   on 2018/4/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentCountData.h"


NSString *const kJCModel_DepartmentCountDataOrgId = @"orgId";
NSString *const kJCModel_DepartmentCountDataOrgName = @"orgName";
NSString *const kJCModel_DepartmentCountDataNum = @"num";


@interface JCModel_DepartmentCountData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentCountData

@synthesize orgId = _orgId;
@synthesize orgName = _orgName;
@synthesize num = _num;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.orgId = [self objectOrNilForKey:kJCModel_DepartmentCountDataOrgId fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_DepartmentCountDataOrgName fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kJCModel_DepartmentCountDataNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orgId forKey:kJCModel_DepartmentCountDataOrgId];
    [mutableDict setValue:self.orgName forKey:kJCModel_DepartmentCountDataOrgName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_DepartmentCountDataNum];

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

    self.orgId = [aDecoder decodeObjectForKey:kJCModel_DepartmentCountDataOrgId];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_DepartmentCountDataOrgName];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_DepartmentCountDataNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orgId forKey:kJCModel_DepartmentCountDataOrgId];
    [aCoder encodeObject:_orgName forKey:kJCModel_DepartmentCountDataOrgName];
    [aCoder encodeDouble:_num forKey:kJCModel_DepartmentCountDataNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DepartmentCountData *copy = [[JCModel_DepartmentCountData alloc] init];
    
    
    
    if (copy) {

        copy.orgId = [self.orgId copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.num = self.num;
    }
    
    return copy;
}


@end
