//
//  JCModel_BacklogData.m
//
//  Created by   on 2018/12/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BacklogData.h"
#import "JCModel_BacklogParams.h"


NSString *const kJCModel_BacklogDataProcessId = @"processId";
NSString *const kJCModel_BacklogDataProcessDefinitionKey = @"processDefinitionKey";
NSString *const kJCModel_BacklogDataProcessBusinessId = @"processBusinessId";
NSString *const kJCModel_BacklogDataParams = @"params";
NSString *const kJCModel_BacklogDataAssignee = @"assignee";
NSString *const kJCModel_BacklogDataProcessName = @"processName";
NSString *const kJCModel_BacklogDataUserName = @"userName";
NSString *const kJCModel_BacklogDataCreateTime = @"createTime";
NSString *const kJCModel_BacklogDataTaskId = @"taskId";
NSString *const kJCModel_BacklogDataProcessStartTime = @"processStartTime";
NSString *const kJCModel_BacklogDataBusinessId = @"businessId";
NSString *const kJCModel_BacklogDataStatus = @"status";
NSString *const kJCModel_BacklogDataName = @"name";


@interface JCModel_BacklogData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BacklogData

@synthesize processId = _processId;
@synthesize processDefinitionKey = _processDefinitionKey;
@synthesize processBusinessId = _processBusinessId;
@synthesize params = _params;
@synthesize assignee = _assignee;
@synthesize processName = _processName;
@synthesize userName = _userName;
@synthesize createTime = _createTime;
@synthesize taskId = _taskId;
@synthesize processStartTime = _processStartTime;
@synthesize businessId = _businessId;
@synthesize status = _status;
@synthesize name = _name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
            self.processId = [self objectOrNilForKey:kJCModel_BacklogDataProcessId fromDictionary:dict];
            self.processDefinitionKey = [self objectOrNilForKey:kJCModel_BacklogDataProcessDefinitionKey fromDictionary:dict];
            self.processBusinessId = [self objectOrNilForKey:kJCModel_BacklogDataProcessBusinessId fromDictionary:dict];
            self.params = [JCModel_BacklogParams modelObjectWithDictionary:[dict objectForKey:kJCModel_BacklogDataParams]];
            self.assignee = [self objectOrNilForKey:kJCModel_BacklogDataAssignee fromDictionary:dict];
            self.processName = [self objectOrNilForKey:kJCModel_BacklogDataProcessName fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kJCModel_BacklogDataUserName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_BacklogDataCreateTime fromDictionary:dict];
            self.taskId = [self objectOrNilForKey:kJCModel_BacklogDataTaskId fromDictionary:dict];
            self.processStartTime = [self objectOrNilForKey:kJCModel_BacklogDataProcessStartTime fromDictionary:dict];
            self.businessId = [self objectOrNilForKey:kJCModel_BacklogDataBusinessId fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_BacklogDataStatus fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_BacklogDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.processId forKey:kJCModel_BacklogDataProcessId];
    [mutableDict setValue:self.processDefinitionKey forKey:kJCModel_BacklogDataProcessDefinitionKey];
    [mutableDict setValue:self.processBusinessId forKey:kJCModel_BacklogDataProcessBusinessId];
    [mutableDict setValue:[self.params dictionaryRepresentation] forKey:kJCModel_BacklogDataParams];
    [mutableDict setValue:self.assignee forKey:kJCModel_BacklogDataAssignee];
    [mutableDict setValue:self.processName forKey:kJCModel_BacklogDataProcessName];
    [mutableDict setValue:self.userName forKey:kJCModel_BacklogDataUserName];
    [mutableDict setValue:self.createTime forKey:kJCModel_BacklogDataCreateTime];
    [mutableDict setValue:self.taskId forKey:kJCModel_BacklogDataTaskId];
    [mutableDict setValue:self.processStartTime forKey:kJCModel_BacklogDataProcessStartTime];
    [mutableDict setValue:self.businessId forKey:kJCModel_BacklogDataBusinessId];
    [mutableDict setValue:self.status forKey:kJCModel_BacklogDataStatus];
    [mutableDict setValue:self.name forKey:kJCModel_BacklogDataName];

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

    self.processId = [aDecoder decodeObjectForKey:kJCModel_BacklogDataProcessId];
    self.processDefinitionKey = [aDecoder decodeObjectForKey:kJCModel_BacklogDataProcessDefinitionKey];
    self.processBusinessId = [aDecoder decodeObjectForKey:kJCModel_BacklogDataProcessBusinessId];
    self.params = [aDecoder decodeObjectForKey:kJCModel_BacklogDataParams];
    self.assignee = [aDecoder decodeObjectForKey:kJCModel_BacklogDataAssignee];
    self.processName = [aDecoder decodeObjectForKey:kJCModel_BacklogDataProcessName];
    self.userName = [aDecoder decodeObjectForKey:kJCModel_BacklogDataUserName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_BacklogDataCreateTime];
    self.taskId = [aDecoder decodeObjectForKey:kJCModel_BacklogDataTaskId];
    self.processStartTime = [aDecoder decodeObjectForKey:kJCModel_BacklogDataProcessStartTime];
    self.businessId = [aDecoder decodeObjectForKey:kJCModel_BacklogDataBusinessId];
    self.status = [aDecoder decodeObjectForKey:kJCModel_BacklogDataStatus];
    self.name = [aDecoder decodeObjectForKey:kJCModel_BacklogDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_processId forKey:kJCModel_BacklogDataProcessId];
    [aCoder encodeObject:_processDefinitionKey forKey:kJCModel_BacklogDataProcessDefinitionKey];
    [aCoder encodeObject:_processBusinessId forKey:kJCModel_BacklogDataProcessBusinessId];
    [aCoder encodeObject:_params forKey:kJCModel_BacklogDataParams];
    [aCoder encodeObject:_assignee forKey:kJCModel_BacklogDataAssignee];
    [aCoder encodeObject:_processName forKey:kJCModel_BacklogDataProcessName];
    [aCoder encodeObject:_userName forKey:kJCModel_BacklogDataUserName];
    [aCoder encodeObject:_createTime forKey:kJCModel_BacklogDataCreateTime];
    [aCoder encodeObject:_taskId forKey:kJCModel_BacklogDataTaskId];
    [aCoder encodeObject:_processStartTime forKey:kJCModel_BacklogDataProcessStartTime];
    [aCoder encodeObject:_businessId forKey:kJCModel_BacklogDataBusinessId];
    [aCoder encodeObject:_status forKey:kJCModel_BacklogDataStatus];
    [aCoder encodeObject:_name forKey:kJCModel_BacklogDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_BacklogData *copy = [[JCModel_BacklogData alloc] init];

    if (copy) {

        copy.processId = [self.processId copyWithZone:zone];
        copy.processDefinitionKey = [self.processDefinitionKey copyWithZone:zone];
        copy.processBusinessId = [self.processBusinessId copyWithZone:zone];
        copy.params = [self.params copyWithZone:zone];
        copy.assignee = (id)[self.assignee copyWithZone:zone];
        copy.processName = [self.processName copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.taskId = [self.taskId copyWithZone:zone];
        copy.processStartTime = [self.processStartTime copyWithZone:zone];
        copy.businessId = (id)[self.businessId copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
