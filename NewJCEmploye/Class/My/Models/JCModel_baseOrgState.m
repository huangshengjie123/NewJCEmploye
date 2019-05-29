//
//  JCModel_baseOrgState.m
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_baseOrgState.h"


NSString *const kJCModel_baseOrgStateChecked = @"checked";
NSString *const kJCModel_baseOrgStateExpanded = @"expanded";
NSString *const kJCModel_baseOrgStateSelected = @"selected";
NSString *const kJCModel_baseOrgStateDisabled = @"disabled";


@interface JCModel_baseOrgState ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_baseOrgState

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
            self.checked = [[self objectOrNilForKey:kJCModel_baseOrgStateChecked fromDictionary:dict] boolValue];
            self.expanded = [[self objectOrNilForKey:kJCModel_baseOrgStateExpanded fromDictionary:dict] boolValue];
            self.selected = [[self objectOrNilForKey:kJCModel_baseOrgStateSelected fromDictionary:dict] boolValue];
            self.disabled = [[self objectOrNilForKey:kJCModel_baseOrgStateDisabled fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.checked] forKey:kJCModel_baseOrgStateChecked];
    [mutableDict setValue:[NSNumber numberWithBool:self.expanded] forKey:kJCModel_baseOrgStateExpanded];
    [mutableDict setValue:[NSNumber numberWithBool:self.selected] forKey:kJCModel_baseOrgStateSelected];
    [mutableDict setValue:[NSNumber numberWithBool:self.disabled] forKey:kJCModel_baseOrgStateDisabled];

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

    self.checked = [aDecoder decodeBoolForKey:kJCModel_baseOrgStateChecked];
    self.expanded = [aDecoder decodeBoolForKey:kJCModel_baseOrgStateExpanded];
    self.selected = [aDecoder decodeBoolForKey:kJCModel_baseOrgStateSelected];
    self.disabled = [aDecoder decodeBoolForKey:kJCModel_baseOrgStateDisabled];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_checked forKey:kJCModel_baseOrgStateChecked];
    [aCoder encodeBool:_expanded forKey:kJCModel_baseOrgStateExpanded];
    [aCoder encodeBool:_selected forKey:kJCModel_baseOrgStateSelected];
    [aCoder encodeBool:_disabled forKey:kJCModel_baseOrgStateDisabled];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_baseOrgState *copy = [[JCModel_baseOrgState alloc] init];
    
    
    
    if (copy) {

        copy.checked = self.checked;
        copy.expanded = self.expanded;
        copy.selected = self.selected;
        copy.disabled = self.disabled;
    }
    
    return copy;
}


@end
