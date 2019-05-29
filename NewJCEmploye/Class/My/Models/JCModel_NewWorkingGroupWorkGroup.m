//
//  JCModel_NewWorkingGroupWorkGroup.m
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewWorkingGroupWorkGroup.h"


NSString *const kJCModel_NewWorkingGroupWorkGroupType = @"type";
NSString *const kJCModel_NewWorkingGroupWorkGroupOrg = @"org";
NSString *const kJCModel_NewWorkingGroupWorkGroupOwner = @"owner";
NSString *const kJCModel_NewWorkingGroupWorkGroupDescription = @"description";
NSString *const kJCModel_NewWorkingGroupWorkGroupName = @"name";
NSString *const kJCModel_NewWorkingGroupWorkGroupParent = @"parent";


@interface JCModel_NewWorkingGroupWorkGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewWorkingGroupWorkGroup

@synthesize type = _type;
@synthesize org = _org;
@synthesize owner = _owner;
@synthesize workGroupDescription = _workGroupDescription;
@synthesize name = _name;
@synthesize parent = _parent;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.type = [self objectOrNilForKey:kJCModel_NewWorkingGroupWorkGroupType fromDictionary:dict];
            self.org = [self objectOrNilForKey:kJCModel_NewWorkingGroupWorkGroupOrg fromDictionary:dict];
            self.owner = [self objectOrNilForKey:kJCModel_NewWorkingGroupWorkGroupOwner fromDictionary:dict];
            self.workGroupDescription = [self objectOrNilForKey:kJCModel_NewWorkingGroupWorkGroupDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_NewWorkingGroupWorkGroupName fromDictionary:dict];
            self.parent = [self objectOrNilForKey:kJCModel_NewWorkingGroupWorkGroupParent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kJCModel_NewWorkingGroupWorkGroupType];
    [mutableDict setValue:self.org forKey:kJCModel_NewWorkingGroupWorkGroupOrg];
    [mutableDict setValue:self.owner forKey:kJCModel_NewWorkingGroupWorkGroupOwner];
    [mutableDict setValue:self.workGroupDescription forKey:kJCModel_NewWorkingGroupWorkGroupDescription];
    [mutableDict setValue:self.name forKey:kJCModel_NewWorkingGroupWorkGroupName];
    [mutableDict setValue:self.parent forKey:kJCModel_NewWorkingGroupWorkGroupParent];

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

    self.type = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupWorkGroupType];
    self.org = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupWorkGroupOrg];
    self.owner = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupWorkGroupOwner];
    self.workGroupDescription = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupWorkGroupDescription];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupWorkGroupName];
    self.parent = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupWorkGroupParent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kJCModel_NewWorkingGroupWorkGroupType];
    [aCoder encodeObject:_org forKey:kJCModel_NewWorkingGroupWorkGroupOrg];
    [aCoder encodeObject:_owner forKey:kJCModel_NewWorkingGroupWorkGroupOwner];
    [aCoder encodeObject:_workGroupDescription forKey:kJCModel_NewWorkingGroupWorkGroupDescription];
    [aCoder encodeObject:_name forKey:kJCModel_NewWorkingGroupWorkGroupName];
    [aCoder encodeObject:_parent forKey:kJCModel_NewWorkingGroupWorkGroupParent];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewWorkingGroupWorkGroup *copy = [[JCModel_NewWorkingGroupWorkGroup alloc] init];
    
    
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.org = [self.org copyWithZone:zone];
        copy.owner = [self.owner copyWithZone:zone];
        copy.workGroupDescription = [self.workGroupDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.parent = [self.parent copyWithZone:zone];
    }
    
    return copy;
}


@end
