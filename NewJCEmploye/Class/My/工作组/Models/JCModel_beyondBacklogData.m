//
//  JCModel_beyondBacklogData.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_beyondBacklogData.h"


NSString *const kJCModel_beyondBacklogDataProcessId = @"processId";
NSString *const kJCModel_beyondBacklogDataProcessDefinitionKey = @"processDefinitionKey";
NSString *const kJCModel_beyondBacklogDataProcessBusinessId = @"processBusinessId";
NSString *const kJCModel_beyondBacklogDataParams = @"params";
NSString *const kJCModel_beyondBacklogDataAssignee = @"assignee";
NSString *const kJCModel_beyondBacklogDataProcessName = @"processName";
NSString *const kJCModel_beyondBacklogDataCreateTime = @"createTime";
NSString *const kJCModel_beyondBacklogDataTaskId = @"taskId";
NSString *const kJCModel_beyondBacklogDataProcessStartTime = @"processStartTime";
NSString *const kJCModel_beyondBacklogDataBusinessId = @"businessId";
NSString *const kJCModel_beyondBacklogDataStatus = @"status";
NSString *const kJCModel_beyondBacklogDataName = @"name";


@interface JCModel_beyondBacklogData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_beyondBacklogData

@synthesize processId = _processId;
@synthesize processDefinitionKey = _processDefinitionKey;
@synthesize processBusinessId = _processBusinessId;
@synthesize params = _params;
@synthesize assignee = _assignee;
@synthesize processName = _processName;
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
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.processId = [self objectOrNilForKey:kJCModel_beyondBacklogDataProcessId fromDictionary:dict];
            self.processDefinitionKey = [self objectOrNilForKey:kJCModel_beyondBacklogDataProcessDefinitionKey fromDictionary:dict];
            self.processBusinessId = [self objectOrNilForKey:kJCModel_beyondBacklogDataProcessBusinessId fromDictionary:dict];
            self.params = [self objectOrNilForKey:kJCModel_beyondBacklogDataParams fromDictionary:dict];
            self.assignee = [self objectOrNilForKey:kJCModel_beyondBacklogDataAssignee fromDictionary:dict];
            self.processName = [self objectOrNilForKey:kJCModel_beyondBacklogDataProcessName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_beyondBacklogDataCreateTime fromDictionary:dict];
            self.taskId = [self objectOrNilForKey:kJCModel_beyondBacklogDataTaskId fromDictionary:dict];
            self.processStartTime = [self objectOrNilForKey:kJCModel_beyondBacklogDataProcessStartTime fromDictionary:dict];
            self.businessId = [self objectOrNilForKey:kJCModel_beyondBacklogDataBusinessId fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_beyondBacklogDataStatus fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_beyondBacklogDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.processId forKey:kJCModel_beyondBacklogDataProcessId];
    [mutableDict setValue:self.processDefinitionKey forKey:kJCModel_beyondBacklogDataProcessDefinitionKey];
    [mutableDict setValue:self.processBusinessId forKey:kJCModel_beyondBacklogDataProcessBusinessId];
    [mutableDict setValue:self.params forKey:kJCModel_beyondBacklogDataParams];
    [mutableDict setValue:self.assignee forKey:kJCModel_beyondBacklogDataAssignee];
    [mutableDict setValue:self.processName forKey:kJCModel_beyondBacklogDataProcessName];
    [mutableDict setValue:self.createTime forKey:kJCModel_beyondBacklogDataCreateTime];
    [mutableDict setValue:self.taskId forKey:kJCModel_beyondBacklogDataTaskId];
    [mutableDict setValue:self.processStartTime forKey:kJCModel_beyondBacklogDataProcessStartTime];
    [mutableDict setValue:self.businessId forKey:kJCModel_beyondBacklogDataBusinessId];
    [mutableDict setValue:self.status forKey:kJCModel_beyondBacklogDataStatus];
    [mutableDict setValue:self.name forKey:kJCModel_beyondBacklogDataName];

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

    self.processId = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataProcessId];
    self.processDefinitionKey = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataProcessDefinitionKey];
    self.processBusinessId = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataProcessBusinessId];
    self.params = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataParams];
    self.assignee = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataAssignee];
    self.processName = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataProcessName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataCreateTime];
    self.taskId = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataTaskId];
    self.processStartTime = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataProcessStartTime];
    self.businessId = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataBusinessId];
    self.status = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataStatus];
    self.name = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_processId forKey:kJCModel_beyondBacklogDataProcessId];
    [aCoder encodeObject:_processDefinitionKey forKey:kJCModel_beyondBacklogDataProcessDefinitionKey];
    [aCoder encodeObject:_processBusinessId forKey:kJCModel_beyondBacklogDataProcessBusinessId];
    [aCoder encodeObject:_params forKey:kJCModel_beyondBacklogDataParams];
    [aCoder encodeObject:_assignee forKey:kJCModel_beyondBacklogDataAssignee];
    [aCoder encodeObject:_processName forKey:kJCModel_beyondBacklogDataProcessName];
    [aCoder encodeObject:_createTime forKey:kJCModel_beyondBacklogDataCreateTime];
    [aCoder encodeObject:_taskId forKey:kJCModel_beyondBacklogDataTaskId];
    [aCoder encodeObject:_processStartTime forKey:kJCModel_beyondBacklogDataProcessStartTime];
    [aCoder encodeObject:_businessId forKey:kJCModel_beyondBacklogDataBusinessId];
    [aCoder encodeObject:_status forKey:kJCModel_beyondBacklogDataStatus];
    [aCoder encodeObject:_name forKey:kJCModel_beyondBacklogDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_beyondBacklogData *copy = [[JCModel_beyondBacklogData alloc] init];
    
    
    
    if (copy) {

        copy.processId = [self.processId copyWithZone:zone];
        copy.processDefinitionKey = [self.processDefinitionKey copyWithZone:zone];
        copy.processBusinessId = [self.processBusinessId copyWithZone:zone];
        copy.params = [self.params copyWithZone:zone];
        copy.assignee = [self.assignee copyWithZone:zone];
        copy.processName = [self.processName copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.taskId = [self.taskId copyWithZone:zone];
        copy.processStartTime = [self.processStartTime copyWithZone:zone];
        copy.businessId = [self.businessId copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
