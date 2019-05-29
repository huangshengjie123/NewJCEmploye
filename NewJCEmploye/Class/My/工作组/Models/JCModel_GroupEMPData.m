//
//  JCModel_GroupEMPData.m
//
//  Created by   on 2018/11/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GroupEMPData.h"
#import "JCModel_GroupEMPPageProperties.h"
#import "JCModel_GroupEMPList.h"


NSString *const kJCModel_GroupEMPDataPageProperties = @"pageProperties";
NSString *const kJCModel_GroupEMPDataList = @"list";


@interface JCModel_GroupEMPData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GroupEMPData

@synthesize pageProperties = _pageProperties;
@synthesize list = _list;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pageProperties = [JCModel_GroupEMPPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_GroupEMPDataPageProperties]];
    NSObject *receivedJCModel_GroupEMPList = [dict objectForKey:kJCModel_GroupEMPDataList];
    NSMutableArray *parsedJCModel_GroupEMPList = [NSMutableArray array];
    
    if ([receivedJCModel_GroupEMPList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_GroupEMPList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_GroupEMPList addObject:[JCModel_GroupEMPList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_GroupEMPList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_GroupEMPList addObject:[JCModel_GroupEMPList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_GroupEMPList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_GroupEMPList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_GroupEMPDataPageProperties];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.list) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_GroupEMPDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_GroupEMPDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_GroupEMPDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_GroupEMPDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_GroupEMPDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GroupEMPData *copy = [[JCModel_GroupEMPData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
