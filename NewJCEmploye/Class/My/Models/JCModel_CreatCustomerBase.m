//
//  JCModel_CreatCustomerBase.m
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CreatCustomerBase.h"
#import "JCModel_CreatCustomerCustomerAddressList.h"
#import "JCModel_CreatCustomerCustomerDetail.h"


NSString *const kJCModel_CreatCustomerBaseType = @"type";
NSString *const kJCModel_CreatCustomerBaseCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_CreatCustomerBaseName = @"name";
NSString *const kJCModel_CreatCustomerBaseCurCom = @"curCom";
NSString *const kJCModel_CreatCustomerBaseCustomerDetail = @"customerDetail";


@interface JCModel_CreatCustomerBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CreatCustomerBase

@synthesize type = _type;
@synthesize customerAddressList = _customerAddressList;
@synthesize name = _name;
@synthesize curCom = _curCom;
@synthesize customerDetail = _customerDetail;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.type = [self objectOrNilForKey:kJCModel_CreatCustomerBaseType fromDictionary:dict];
    NSObject *receivedJCModel_CreatCustomerCustomerAddressList = [dict objectForKey:kJCModel_CreatCustomerBaseCustomerAddressList];
    NSMutableArray *parsedJCModel_CreatCustomerCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_CreatCustomerCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CreatCustomerCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CreatCustomerCustomerAddressList addObject:[JCModel_CreatCustomerCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CreatCustomerCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CreatCustomerCustomerAddressList addObject:[JCModel_CreatCustomerCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CreatCustomerCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_CreatCustomerCustomerAddressList];
            self.name = [self objectOrNilForKey:kJCModel_CreatCustomerBaseName fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCModel_CreatCustomerBaseCurCom fromDictionary:dict];
            self.customerDetail = [JCModel_CreatCustomerCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_CreatCustomerBaseCustomerDetail]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kJCModel_CreatCustomerBaseType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_CreatCustomerBaseCustomerAddressList];
    [mutableDict setValue:self.name forKey:kJCModel_CreatCustomerBaseName];
    [mutableDict setValue:self.curCom forKey:kJCModel_CreatCustomerBaseCurCom];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_CreatCustomerBaseCustomerDetail];

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

    self.type = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerBaseType];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerBaseCustomerAddressList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerBaseName];
    self.curCom = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerBaseCurCom];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerBaseCustomerDetail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kJCModel_CreatCustomerBaseType];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_CreatCustomerBaseCustomerAddressList];
    [aCoder encodeObject:_name forKey:kJCModel_CreatCustomerBaseName];
    [aCoder encodeObject:_curCom forKey:kJCModel_CreatCustomerBaseCurCom];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_CreatCustomerBaseCustomerDetail];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CreatCustomerBase *copy = [[JCModel_CreatCustomerBase alloc] init];
    
    
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.curCom = [self.curCom copyWithZone:zone];
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
    }
    
    return copy;
}


@end
