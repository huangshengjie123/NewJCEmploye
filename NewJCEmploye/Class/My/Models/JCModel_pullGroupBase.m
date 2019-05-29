//
//  JCModel_pullGroupBase.m
//
//  Created by   on 2018/10/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_pullGroupBase.h"
#import "JCModel_pullGroupWorkGroup.h"


NSString *const kJCModel_pullGroupBaseApplicant = @"applicant";
NSString *const kJCModel_pullGroupBaseWorkGroup = @"workGroup";
NSString *const kJCModel_pullGroupBaseType = @"type";
NSString *const kJCModel_pullGroupBaseCommand = @"command";


@interface JCModel_pullGroupBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_pullGroupBase

@synthesize applicant = _applicant;
@synthesize workGroup = _workGroup;
@synthesize type = _type;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.applicant = [self objectOrNilForKey:kJCModel_pullGroupBaseApplicant fromDictionary:dict];
            self.workGroup = [JCModel_pullGroupWorkGroup modelObjectWithDictionary:[dict objectForKey:kJCModel_pullGroupBaseWorkGroup]];
            self.type = [self objectOrNilForKey:kJCModel_pullGroupBaseType fromDictionary:dict];
            self.command = [self objectOrNilForKey:kJCModel_pullGroupBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.applicant forKey:kJCModel_pullGroupBaseApplicant];
    [mutableDict setValue:[self.workGroup dictionaryRepresentation] forKey:kJCModel_pullGroupBaseWorkGroup];
    [mutableDict setValue:self.type forKey:kJCModel_pullGroupBaseType];
    [mutableDict setValue:self.command forKey:kJCModel_pullGroupBaseCommand];

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

    self.applicant = [aDecoder decodeObjectForKey:kJCModel_pullGroupBaseApplicant];
    self.workGroup = [aDecoder decodeObjectForKey:kJCModel_pullGroupBaseWorkGroup];
    self.type = [aDecoder decodeObjectForKey:kJCModel_pullGroupBaseType];
    self.command = [aDecoder decodeObjectForKey:kJCModel_pullGroupBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_applicant forKey:kJCModel_pullGroupBaseApplicant];
    [aCoder encodeObject:_workGroup forKey:kJCModel_pullGroupBaseWorkGroup];
    [aCoder encodeObject:_type forKey:kJCModel_pullGroupBaseType];
    [aCoder encodeObject:_command forKey:kJCModel_pullGroupBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_pullGroupBase *copy = [[JCModel_pullGroupBase alloc] init];
    
    
    
    if (copy) {

        copy.applicant = [self.applicant copyWithZone:zone];
        copy.workGroup = [self.workGroup copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
