//
//  JCModel_DepartmentState.m
//
//  Created by   on 2018/4/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentState.h"


NSString *const kJCModel_DepartmentStateChecked = @"checked";
NSString *const kJCModel_DepartmentStateExpanded = @"expanded";
NSString *const kJCModel_DepartmentStateSelected = @"selected";
NSString *const kJCModel_DepartmentStateDisabled = @"disabled";


@interface JCModel_DepartmentState ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentState

@synthesize checked = _checked;
@synthesize expanded = _expanded;
@synthesize selected = _selected;
@synthesize disabled = _disabled;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.checked = [[self objectOrNilForKey:kJCModel_DepartmentStateChecked fromDictionary:dict] boolValue];
            self.expanded = [[self objectOrNilForKey:kJCModel_DepartmentStateExpanded fromDictionary:dict] boolValue];
            self.selected = [[self objectOrNilForKey:kJCModel_DepartmentStateSelected fromDictionary:dict] boolValue];
            self.disabled = [[self objectOrNilForKey:kJCModel_DepartmentStateDisabled fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.checked] forKey:kJCModel_DepartmentStateChecked];
    [mutableDict setValue:[NSNumber numberWithBool:self.expanded] forKey:kJCModel_DepartmentStateExpanded];
    [mutableDict setValue:[NSNumber numberWithBool:self.selected] forKey:kJCModel_DepartmentStateSelected];
    [mutableDict setValue:[NSNumber numberWithBool:self.disabled] forKey:kJCModel_DepartmentStateDisabled];

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

    self.checked = [aDecoder decodeBoolForKey:kJCModel_DepartmentStateChecked];
    self.expanded = [aDecoder decodeBoolForKey:kJCModel_DepartmentStateExpanded];
    self.selected = [aDecoder decodeBoolForKey:kJCModel_DepartmentStateSelected];
    self.disabled = [aDecoder decodeBoolForKey:kJCModel_DepartmentStateDisabled];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_checked forKey:kJCModel_DepartmentStateChecked];
    [aCoder encodeBool:_expanded forKey:kJCModel_DepartmentStateExpanded];
    [aCoder encodeBool:_selected forKey:kJCModel_DepartmentStateSelected];
    [aCoder encodeBool:_disabled forKey:kJCModel_DepartmentStateDisabled];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DepartmentState *copy = [[JCModel_DepartmentState alloc] init];
    
    
    
    if (copy) {

        copy.checked = self.checked;
        copy.expanded = self.expanded;
        copy.selected = self.selected;
        copy.disabled = self.disabled;
    }
    
    return copy;
}


@end
