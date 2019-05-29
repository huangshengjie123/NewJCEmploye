//
//  JCModel_UpdateCustmerInfoBase.m
//
//  Created by   on 2018/8/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_UpdateCustmerInfoBase.h"
#import "JCModel_UpdateCustmerInfoCustomerDetail.h"


NSString *const kJCModel_UpdateCustmerInfoBaseId = @"id";
NSString *const kJCModel_UpdateCustmerInfoBaseName = @"name";
NSString *const kJCModel_UpdateCustmerInfoBaseTag = @"tag";
NSString *const kJCModel_UpdateCustmerInfoBaseCustomerDetail = @"customerDetail";


@interface JCModel_UpdateCustmerInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_UpdateCustmerInfoBase

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize name = _name;
@synthesize tag = _tag;
@synthesize customerDetail = _customerDetail;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoBaseId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoBaseName fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoBaseTag fromDictionary:dict];
            self.customerDetail = [JCModel_UpdateCustmerInfoCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_UpdateCustmerInfoBaseCustomerDetail]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kJCModel_UpdateCustmerInfoBaseId];
    [mutableDict setValue:self.name forKey:kJCModel_UpdateCustmerInfoBaseName];
    [mutableDict setValue:self.tag forKey:kJCModel_UpdateCustmerInfoBaseTag];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_UpdateCustmerInfoBaseCustomerDetail];

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

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoBaseId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoBaseName];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoBaseTag];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoBaseCustomerDetail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kJCModel_UpdateCustmerInfoBaseId];
    [aCoder encodeObject:_name forKey:kJCModel_UpdateCustmerInfoBaseName];
    [aCoder encodeObject:_tag forKey:kJCModel_UpdateCustmerInfoBaseTag];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_UpdateCustmerInfoBaseCustomerDetail];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_UpdateCustmerInfoBase *copy = [[JCModel_UpdateCustmerInfoBase alloc] init];
    
    
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
    }
    
    return copy;
}


@end
