//
//  JCModel_FinancialGroupData.m
//
//  Created by   on 2018/6/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinancialGroupData.h"


NSString *const kJCModel_FinancialGroupDataOwner = @"owner";
NSString *const kJCModel_FinancialGroupDataOrg = @"org";
NSString *const kJCModel_FinancialGroupDataParent = @"parent";
NSString *const kJCModel_FinancialGroupDataId = @"id";
NSString *const kJCModel_FinancialGroupDataLevel = @"level";
NSString *const kJCModel_FinancialGroupDataDescription = @"description";
NSString *const kJCModel_FinancialGroupDataType = @"type";
NSString *const kJCModel_FinancialGroupDataName = @"name";
NSString *const kJCModel_FinancialGroupDataGroupRelations = @"groupRelations";


@interface JCModel_FinancialGroupData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinancialGroupData

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
            self.owner = [[self objectOrNilForKey:kJCModel_FinancialGroupDataOwner fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_FinancialGroupDataOrg fromDictionary:dict];
            self.parent = [self objectOrNilForKey:kJCModel_FinancialGroupDataParent fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_FinancialGroupDataId fromDictionary:dict];
            self.level = [self objectOrNilForKey:kJCModel_FinancialGroupDataLevel fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_FinancialGroupDataDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_FinancialGroupDataType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_FinancialGroupDataName fromDictionary:dict];
            self.groupRelations = [self objectOrNilForKey:kJCModel_FinancialGroupDataGroupRelations fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_FinancialGroupDataOwner];
    [mutableDict setValue:self.org forKey:kJCModel_FinancialGroupDataOrg];
    [mutableDict setValue:self.parent forKey:kJCModel_FinancialGroupDataParent];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_FinancialGroupDataId];
    [mutableDict setValue:self.level forKey:kJCModel_FinancialGroupDataLevel];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_FinancialGroupDataDescription];
    [mutableDict setValue:self.type forKey:kJCModel_FinancialGroupDataType];
    [mutableDict setValue:self.name forKey:kJCModel_FinancialGroupDataName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroupRelations] forKey:kJCModel_FinancialGroupDataGroupRelations];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_FinancialGroupDataOwner];
    self.org = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataOrg];
    self.parent = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataParent];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataId];
    self.level = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataLevel];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataDescription];
    self.type = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataName];
    self.groupRelations = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupDataGroupRelations];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_FinancialGroupDataOwner];
    [aCoder encodeObject:_org forKey:kJCModel_FinancialGroupDataOrg];
    [aCoder encodeObject:_parent forKey:kJCModel_FinancialGroupDataParent];
    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_FinancialGroupDataId];
    [aCoder encodeObject:_level forKey:kJCModel_FinancialGroupDataLevel];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_FinancialGroupDataDescription];
    [aCoder encodeObject:_type forKey:kJCModel_FinancialGroupDataType];
    [aCoder encodeObject:_name forKey:kJCModel_FinancialGroupDataName];
    [aCoder encodeObject:_groupRelations forKey:kJCModel_FinancialGroupDataGroupRelations];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinancialGroupData *copy = [[JCModel_FinancialGroupData alloc] init];
    
    
    
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
