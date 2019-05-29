//
//  JCModel_AllOutInputOrderData.m
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AllOutInputOrderData.h"
#import "JCModel_AllOutInputOrderParams.h"


NSString *const kJCModel_AllOutInputOrderDataStatus = @"status";
NSString *const kJCModel_AllOutInputOrderDataTaskId = @"taskId";
NSString *const kJCModel_AllOutInputOrderDataParams = @"params";
NSString *const kJCModel_AllOutInputOrderDataProcessId = @"processId";
NSString *const kJCModel_AllOutInputOrderDataProcessStartTime = @"processStartTime";
NSString *const kJCModel_AllOutInputOrderDataProcessBusinessId = @"processBusinessId";
NSString *const kJCModel_AllOutInputOrderDataAssignee = @"assignee";
NSString *const kJCModel_AllOutInputOrderDataProcessName = @"processName";
NSString *const kJCModel_AllOutInputOrderDataProcessDefinitionKey = @"processDefinitionKey";
NSString *const kJCModel_AllOutInputOrderDataName = @"name";
NSString *const kJCModel_AllOutInputOrderDataCreateTime = @"createTime";


@interface JCModel_AllOutInputOrderData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AllOutInputOrderData

@synthesize status = _status;
@synthesize taskId = _taskId;
@synthesize params = _params;
@synthesize processId = _processId;
@synthesize processStartTime = _processStartTime;
@synthesize processBusinessId = _processBusinessId;
@synthesize assignee = _assignee;
@synthesize processName = _processName;
@synthesize processDefinitionKey = _processDefinitionKey;
@synthesize name = _name;
@synthesize createTime = _createTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataStatus fromDictionary:dict];
            self.taskId = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataTaskId fromDictionary:dict];
            self.params = [JCModel_AllOutInputOrderParams modelObjectWithDictionary:[dict objectForKey:kJCModel_AllOutInputOrderDataParams]];
            self.processId = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataProcessId fromDictionary:dict];
            self.processStartTime = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataProcessStartTime fromDictionary:dict];
            self.processBusinessId = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataProcessBusinessId fromDictionary:dict];
            self.assignee = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataAssignee fromDictionary:dict];
            self.processName = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataProcessName fromDictionary:dict];
            self.processDefinitionKey = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataProcessDefinitionKey fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_AllOutInputOrderDataCreateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kJCModel_AllOutInputOrderDataStatus];
    [mutableDict setValue:self.taskId forKey:kJCModel_AllOutInputOrderDataTaskId];
    [mutableDict setValue:[self.params dictionaryRepresentation] forKey:kJCModel_AllOutInputOrderDataParams];
    [mutableDict setValue:self.processId forKey:kJCModel_AllOutInputOrderDataProcessId];
    [mutableDict setValue:self.processStartTime forKey:kJCModel_AllOutInputOrderDataProcessStartTime];
    [mutableDict setValue:self.processBusinessId forKey:kJCModel_AllOutInputOrderDataProcessBusinessId];
    [mutableDict setValue:self.assignee forKey:kJCModel_AllOutInputOrderDataAssignee];
    [mutableDict setValue:self.processName forKey:kJCModel_AllOutInputOrderDataProcessName];
    [mutableDict setValue:self.processDefinitionKey forKey:kJCModel_AllOutInputOrderDataProcessDefinitionKey];
    [mutableDict setValue:self.name forKey:kJCModel_AllOutInputOrderDataName];
    [mutableDict setValue:self.createTime forKey:kJCModel_AllOutInputOrderDataCreateTime];

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

    self.status = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataStatus];
    self.taskId = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataTaskId];
    self.params = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataParams];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataProcessId];
    self.processStartTime = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataProcessStartTime];
    self.processBusinessId = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataProcessBusinessId];
    self.assignee = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataAssignee];
    self.processName = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataProcessName];
    self.processDefinitionKey = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataProcessDefinitionKey];
    self.name = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderDataCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kJCModel_AllOutInputOrderDataStatus];
    [aCoder encodeObject:_taskId forKey:kJCModel_AllOutInputOrderDataTaskId];
    [aCoder encodeObject:_params forKey:kJCModel_AllOutInputOrderDataParams];
    [aCoder encodeObject:_processId forKey:kJCModel_AllOutInputOrderDataProcessId];
    [aCoder encodeObject:_processStartTime forKey:kJCModel_AllOutInputOrderDataProcessStartTime];
    [aCoder encodeObject:_processBusinessId forKey:kJCModel_AllOutInputOrderDataProcessBusinessId];
    [aCoder encodeObject:_assignee forKey:kJCModel_AllOutInputOrderDataAssignee];
    [aCoder encodeObject:_processName forKey:kJCModel_AllOutInputOrderDataProcessName];
    [aCoder encodeObject:_processDefinitionKey forKey:kJCModel_AllOutInputOrderDataProcessDefinitionKey];
    [aCoder encodeObject:_name forKey:kJCModel_AllOutInputOrderDataName];
    [aCoder encodeObject:_createTime forKey:kJCModel_AllOutInputOrderDataCreateTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AllOutInputOrderData *copy = [[JCModel_AllOutInputOrderData alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.taskId = [self.taskId copyWithZone:zone];
        copy.params = [self.params copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.processStartTime = [self.processStartTime copyWithZone:zone];
        copy.processBusinessId = [self.processBusinessId copyWithZone:zone];
        copy.assignee = [self.assignee copyWithZone:zone];
        copy.processName = [self.processName copyWithZone:zone];
        copy.processDefinitionKey = [self.processDefinitionKey copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
    }
    
    return copy;
}


@end
