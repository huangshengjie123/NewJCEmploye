//
//  JCModel_reimbursementData.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementData.h"
#import "JCModel_reimbursementPageProperties.h"
#import "JCModel_reimbursementList.h"


NSString *const kJCModel_reimbursementDataPageProperties = @"pageProperties";
NSString *const kJCModel_reimbursementDataList = @"list";


@interface JCModel_reimbursementData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementData

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
            self.pageProperties = [JCModel_reimbursementPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_reimbursementDataPageProperties]];
    NSObject *receivedJCModel_reimbursementList = [dict objectForKey:kJCModel_reimbursementDataList];
    NSMutableArray *parsedJCModel_reimbursementList = [NSMutableArray array];
    
    if ([receivedJCModel_reimbursementList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_reimbursementList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_reimbursementList addObject:[JCModel_reimbursementList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_reimbursementList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_reimbursementList addObject:[JCModel_reimbursementList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_reimbursementList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_reimbursementList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_reimbursementDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_reimbursementDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_reimbursementDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_reimbursementDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_reimbursementDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_reimbursementDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementData *copy = [[JCModel_reimbursementData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
