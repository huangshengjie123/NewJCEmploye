//
//  JCModel_CreatCustomer2Base.m
//
//  Created by   on 2019/1/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CreatCustomer2Base.h"
#import "JCModel_CreatCustomer2CustomerAddressList.h"
#import "JCModel_CreatCustomer2CustomerDetail.h"


NSString *const kJCModel_CreatCustomer2BaseType = @"type";
NSString *const kJCModel_CreatCustomer2BaseGuide = @"guide";
NSString *const kJCModel_CreatCustomer2BaseCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_CreatCustomer2BaseName = @"name";
NSString *const kJCModel_CreatCustomer2BaseTag = @"tag";
NSString *const kJCModel_CreatCustomer2BaseCustomerDetail = @"customerDetail";


@interface JCModel_CreatCustomer2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CreatCustomer2Base

@synthesize type = _type;
@synthesize guide = _guide;
@synthesize customerAddressList = _customerAddressList;
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
            self.type = [self objectOrNilForKey:kJCModel_CreatCustomer2BaseType fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_CreatCustomer2BaseGuide fromDictionary:dict];
    NSObject *receivedJCModel_CreatCustomer2CustomerAddressList = [dict objectForKey:kJCModel_CreatCustomer2BaseCustomerAddressList];
    NSMutableArray *parsedJCModel_CreatCustomer2CustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_CreatCustomer2CustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CreatCustomer2CustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CreatCustomer2CustomerAddressList addObject:[JCModel_CreatCustomer2CustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CreatCustomer2CustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CreatCustomer2CustomerAddressList addObject:[JCModel_CreatCustomer2CustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CreatCustomer2CustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_CreatCustomer2CustomerAddressList];
            self.name = [self objectOrNilForKey:kJCModel_CreatCustomer2BaseName fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_CreatCustomer2BaseTag fromDictionary:dict];
            self.customerDetail = [JCModel_CreatCustomer2CustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_CreatCustomer2BaseCustomerDetail]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kJCModel_CreatCustomer2BaseType];
    [mutableDict setValue:self.guide forKey:kJCModel_CreatCustomer2BaseGuide];
    NSMutableArray *tempArrayForCustomerAddressList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.customerAddressList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCustomerAddressList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCustomerAddressList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_CreatCustomer2BaseCustomerAddressList];
    [mutableDict setValue:self.name forKey:kJCModel_CreatCustomer2BaseName];
    [mutableDict setValue:self.tag forKey:kJCModel_CreatCustomer2BaseTag];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_CreatCustomer2BaseCustomerDetail];

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

    self.type = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2BaseType];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2BaseGuide];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2BaseCustomerAddressList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2BaseName];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2BaseTag];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2BaseCustomerDetail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kJCModel_CreatCustomer2BaseType];
    [aCoder encodeObject:_guide forKey:kJCModel_CreatCustomer2BaseGuide];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_CreatCustomer2BaseCustomerAddressList];
    [aCoder encodeObject:_name forKey:kJCModel_CreatCustomer2BaseName];
    [aCoder encodeObject:_tag forKey:kJCModel_CreatCustomer2BaseTag];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_CreatCustomer2BaseCustomerDetail];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CreatCustomer2Base *copy = [[JCModel_CreatCustomer2Base alloc] init];
    
    
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
    }
    
    return copy;
}


@end
