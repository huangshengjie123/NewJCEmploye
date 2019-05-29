//
//  JCModel_DistributionCarPData.m
//
//  Created by   on 2018/10/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionCarPData.h"
#import "JCModel_DistributionCarPGroupRelations.h"


NSString *const kJCModel_DistributionCarPDataOwner = @"owner";
NSString *const kJCModel_DistributionCarPDataOrg = @"org";
NSString *const kJCModel_DistributionCarPDataParent = @"parent";
NSString *const kJCModel_DistributionCarPDataId = @"id";
NSString *const kJCModel_DistributionCarPDataLevel = @"level";
NSString *const kJCModel_DistributionCarPDataDescription = @"description";
NSString *const kJCModel_DistributionCarPDataType = @"type";
NSString *const kJCModel_DistributionCarPDataName = @"name";
NSString *const kJCModel_DistributionCarPDataGroupRelations = @"groupRelations";


@interface JCModel_DistributionCarPData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionCarPData

@synthesize owner = _owner;
@synthesize org = _org;
@synthesize parent = _parent;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize level = _level;
@synthesize dataDescription = _dataDescription;
@synthesize type = _type;
@synthesize name = _name;
@synthesize groupRelations = _groupRelations;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.owner = [[self objectOrNilForKey:kJCModel_DistributionCarPDataOwner fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_DistributionCarPDataOrg fromDictionary:dict];
            self.parent = [self objectOrNilForKey:kJCModel_DistributionCarPDataParent fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_DistributionCarPDataId fromDictionary:dict];
            self.level = [self objectOrNilForKey:kJCModel_DistributionCarPDataLevel fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_DistributionCarPDataDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_DistributionCarPDataType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_DistributionCarPDataName fromDictionary:dict];
    NSObject *receivedJCModel_DistributionCarPGroupRelations = [dict objectForKey:kJCModel_DistributionCarPDataGroupRelations];
    NSMutableArray *parsedJCModel_DistributionCarPGroupRelations = [NSMutableArray array];
    
    if ([receivedJCModel_DistributionCarPGroupRelations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DistributionCarPGroupRelations) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DistributionCarPGroupRelations addObject:[JCModel_DistributionCarPGroupRelations modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DistributionCarPGroupRelations isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DistributionCarPGroupRelations addObject:[JCModel_DistributionCarPGroupRelations modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DistributionCarPGroupRelations]];
    }

    self.groupRelations = [NSArray arrayWithArray:parsedJCModel_DistributionCarPGroupRelations];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_DistributionCarPDataOwner];
    [mutableDict setValue:self.org forKey:kJCModel_DistributionCarPDataOrg];
    [mutableDict setValue:self.parent forKey:kJCModel_DistributionCarPDataParent];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_DistributionCarPDataId];
    [mutableDict setValue:self.level forKey:kJCModel_DistributionCarPDataLevel];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_DistributionCarPDataDescription];
    [mutableDict setValue:self.type forKey:kJCModel_DistributionCarPDataType];
    [mutableDict setValue:self.name forKey:kJCModel_DistributionCarPDataName];
    NSMutableArray *tempArrayForGroupRelations = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.groupRelations) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroupRelations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroupRelations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroupRelations] forKey:kJCModel_DistributionCarPDataGroupRelations];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_DistributionCarPDataOwner];
    self.org = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataOrg];
    self.parent = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataParent];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataId];
    self.level = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataLevel];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataDescription];
    self.type = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataName];
    self.groupRelations = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPDataGroupRelations];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_DistributionCarPDataOwner];
    [aCoder encodeObject:_org forKey:kJCModel_DistributionCarPDataOrg];
    [aCoder encodeObject:_parent forKey:kJCModel_DistributionCarPDataParent];
    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_DistributionCarPDataId];
    [aCoder encodeObject:_level forKey:kJCModel_DistributionCarPDataLevel];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_DistributionCarPDataDescription];
    [aCoder encodeObject:_type forKey:kJCModel_DistributionCarPDataType];
    [aCoder encodeObject:_name forKey:kJCModel_DistributionCarPDataName];
    [aCoder encodeObject:_groupRelations forKey:kJCModel_DistributionCarPDataGroupRelations];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionCarPData *copy = [[JCModel_DistributionCarPData alloc] init];
    
    
    
    if (copy) {

        copy.owner = self.owner;
        copy.org = [self.org copyWithZone:zone];
        copy.parent = [self.parent copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.level = [self.level copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.groupRelations = [self.groupRelations copyWithZone:zone];
    }
    
    return copy;
}


@end
