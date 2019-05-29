//
//  JCModel_AgreedJoinGroupBase.m
//
//  Created by   on 2018/10/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AgreedJoinGroupBase.h"
#import "JCModel_AgreedJoinGroupWorkGroup.h"


NSString *const kJCModel_AgreedJoinGroupBaseCommand = @"command";
NSString *const kJCModel_AgreedJoinGroupBaseCurrent = @"current";
NSString *const kJCModel_AgreedJoinGroupBaseWorkGroup = @"workGroup";
NSString *const kJCModel_AgreedJoinGroupBaseTaskId = @"taskId";
NSString *const kJCModel_AgreedJoinGroupBaseIsJoinCheckPass = @"isJoinCheckPass";
NSString *const kJCModel_AgreedJoinGroupBaseType = @"type";


@interface JCModel_AgreedJoinGroupBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AgreedJoinGroupBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize workGroup = _workGroup;
@synthesize taskId = _taskId;
@synthesize isJoinCheckPass = _isJoinCheckPass;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_AgreedJoinGroupBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_AgreedJoinGroupBaseCurrent fromDictionary:dict];
            self.workGroup = [JCModel_AgreedJoinGroupWorkGroup modelObjectWithDictionary:[dict objectForKey:kJCModel_AgreedJoinGroupBaseWorkGroup]];
            self.taskId = [self objectOrNilForKey:kJCModel_AgreedJoinGroupBaseTaskId fromDictionary:dict];
            self.isJoinCheckPass = [self objectOrNilForKey:kJCModel_AgreedJoinGroupBaseIsJoinCheckPass fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_AgreedJoinGroupBaseType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_AgreedJoinGroupBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_AgreedJoinGroupBaseCurrent];
    [mutableDict setValue:[self.workGroup dictionaryRepresentation] forKey:kJCModel_AgreedJoinGroupBaseWorkGroup];
    [mutableDict setValue:self.taskId forKey:kJCModel_AgreedJoinGroupBaseTaskId];
    [mutableDict setValue:self.isJoinCheckPass forKey:kJCModel_AgreedJoinGroupBaseIsJoinCheckPass];
    [mutableDict setValue:self.type forKey:kJCModel_AgreedJoinGroupBaseType];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_AgreedJoinGroupBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_AgreedJoinGroupBaseCurrent];
    self.workGroup = [aDecoder decodeObjectForKey:kJCModel_AgreedJoinGroupBaseWorkGroup];
    self.taskId = [aDecoder decodeObjectForKey:kJCModel_AgreedJoinGroupBaseTaskId];
    self.isJoinCheckPass = [aDecoder decodeObjectForKey:kJCModel_AgreedJoinGroupBaseIsJoinCheckPass];
    self.type = [aDecoder decodeObjectForKey:kJCModel_AgreedJoinGroupBaseType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_AgreedJoinGroupBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_AgreedJoinGroupBaseCurrent];
    [aCoder encodeObject:_workGroup forKey:kJCModel_AgreedJoinGroupBaseWorkGroup];
    [aCoder encodeObject:_taskId forKey:kJCModel_AgreedJoinGroupBaseTaskId];
    [aCoder encodeObject:_isJoinCheckPass forKey:kJCModel_AgreedJoinGroupBaseIsJoinCheckPass];
    [aCoder encodeObject:_type forKey:kJCModel_AgreedJoinGroupBaseType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AgreedJoinGroupBase *copy = [[JCModel_AgreedJoinGroupBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.workGroup = [self.workGroup copyWithZone:zone];
        copy.taskId = [self.taskId copyWithZone:zone];
        copy.isJoinCheckPass = [self.isJoinCheckPass copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
