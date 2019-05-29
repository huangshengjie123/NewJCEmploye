//
//  JCModel_HomeToNewGroupBase.m
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_HomeToNewGroupBase.h"
#import "JCModel_HomeToNewGroupWorkGroup.h"


NSString *const kJCModel_HomeToNewGroupBaseCurrent = @"current";
NSString *const kJCModel_HomeToNewGroupBaseTaskId = @"taskId";
NSString *const kJCModel_HomeToNewGroupBaseWorkGroup = @"workGroup";
NSString *const kJCModel_HomeToNewGroupBaseCommand = @"command";
NSString *const kJCModel_HomeToNewGroupBaseIsCreateCheckPass = @"isCreateCheckPass";


@interface JCModel_HomeToNewGroupBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_HomeToNewGroupBase

@synthesize current = _current;
@synthesize taskId = _taskId;
@synthesize workGroup = _workGroup;
@synthesize command = _command;
@synthesize isCreateCheckPass = _isCreateCheckPass;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_HomeToNewGroupBaseCurrent fromDictionary:dict];
            self.taskId = [self objectOrNilForKey:kJCModel_HomeToNewGroupBaseTaskId fromDictionary:dict];
            self.workGroup = [JCModel_HomeToNewGroupWorkGroup modelObjectWithDictionary:[dict objectForKey:kJCModel_HomeToNewGroupBaseWorkGroup]];
            self.command = [self objectOrNilForKey:kJCModel_HomeToNewGroupBaseCommand fromDictionary:dict];
            self.isCreateCheckPass = [[self objectOrNilForKey:kJCModel_HomeToNewGroupBaseIsCreateCheckPass fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_HomeToNewGroupBaseCurrent];
    [mutableDict setValue:self.taskId forKey:kJCModel_HomeToNewGroupBaseTaskId];
    [mutableDict setValue:[self.workGroup dictionaryRepresentation] forKey:kJCModel_HomeToNewGroupBaseWorkGroup];
    [mutableDict setValue:self.command forKey:kJCModel_HomeToNewGroupBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCreateCheckPass] forKey:kJCModel_HomeToNewGroupBaseIsCreateCheckPass];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_HomeToNewGroupBaseCurrent];
    self.taskId = [aDecoder decodeObjectForKey:kJCModel_HomeToNewGroupBaseTaskId];
    self.workGroup = [aDecoder decodeObjectForKey:kJCModel_HomeToNewGroupBaseWorkGroup];
    self.command = [aDecoder decodeObjectForKey:kJCModel_HomeToNewGroupBaseCommand];
    self.isCreateCheckPass = [aDecoder decodeBoolForKey:kJCModel_HomeToNewGroupBaseIsCreateCheckPass];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_HomeToNewGroupBaseCurrent];
    [aCoder encodeObject:_taskId forKey:kJCModel_HomeToNewGroupBaseTaskId];
    [aCoder encodeObject:_workGroup forKey:kJCModel_HomeToNewGroupBaseWorkGroup];
    [aCoder encodeObject:_command forKey:kJCModel_HomeToNewGroupBaseCommand];
    [aCoder encodeBool:_isCreateCheckPass forKey:kJCModel_HomeToNewGroupBaseIsCreateCheckPass];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_HomeToNewGroupBase *copy = [[JCModel_HomeToNewGroupBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.taskId = [self.taskId copyWithZone:zone];
        copy.workGroup = [self.workGroup copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.isCreateCheckPass = self.isCreateCheckPass;
    }
    
    return copy;
}


@end
