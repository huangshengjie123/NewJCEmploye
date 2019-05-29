//
//  JCModel_ScrapApprovalBase.m
//
//  Created by   on 2019/4/11
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ScrapApprovalBase.h"
#import "JCModel_ScrapApprovalInOutOrder.h"


NSString *const kJCModel_ScrapApprovalBaseCurrent = @"current";
NSString *const kJCModel_ScrapApprovalBaseInOutOrder = @"inOutOrder";
NSString *const kJCModel_ScrapApprovalBaseCommand = @"command";
NSString *const kJCModel_ScrapApprovalBaseIsCheck = @"isCheck";


@interface JCModel_ScrapApprovalBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ScrapApprovalBase

@synthesize current = _current;
@synthesize inOutOrder = _inOutOrder;
@synthesize command = _command;
@synthesize isCheck = _isCheck;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_ScrapApprovalBaseCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_ScrapApprovalInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_ScrapApprovalBaseInOutOrder]];
            self.command = [self objectOrNilForKey:kJCModel_ScrapApprovalBaseCommand fromDictionary:dict];
            self.isCheck = [[self objectOrNilForKey:kJCModel_ScrapApprovalBaseIsCheck fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_ScrapApprovalBaseCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_ScrapApprovalBaseInOutOrder];
    [mutableDict setValue:self.command forKey:kJCModel_ScrapApprovalBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCheck] forKey:kJCModel_ScrapApprovalBaseIsCheck];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_ScrapApprovalBaseCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_ScrapApprovalBaseInOutOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_ScrapApprovalBaseCommand];
    self.isCheck = [aDecoder decodeBoolForKey:kJCModel_ScrapApprovalBaseIsCheck];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_ScrapApprovalBaseCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_ScrapApprovalBaseInOutOrder];
    [aCoder encodeObject:_command forKey:kJCModel_ScrapApprovalBaseCommand];
    [aCoder encodeBool:_isCheck forKey:kJCModel_ScrapApprovalBaseIsCheck];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ScrapApprovalBase *copy = [[JCModel_ScrapApprovalBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.isCheck = self.isCheck;
    }
    
    return copy;
}


@end
