//
//  JCModel_RecordsConsumptionData.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_RecordsConsumptionData.h"
#import "JCModel_RecordsConsumptionPageProperties.h"
#import "JCModel_RecordsConsumptionList.h"


NSString *const kJCModel_RecordsConsumptionDataPageProperties = @"pageProperties";
NSString *const kJCModel_RecordsConsumptionDataList = @"list";


@interface JCModel_RecordsConsumptionData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_RecordsConsumptionData

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
            self.pageProperties = [JCModel_RecordsConsumptionPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_RecordsConsumptionDataPageProperties]];
    NSObject *receivedJCModel_RecordsConsumptionList = [dict objectForKey:kJCModel_RecordsConsumptionDataList];
    NSMutableArray *parsedJCModel_RecordsConsumptionList = [NSMutableArray array];
    
    if ([receivedJCModel_RecordsConsumptionList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_RecordsConsumptionList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_RecordsConsumptionList addObject:[JCModel_RecordsConsumptionList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_RecordsConsumptionList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_RecordsConsumptionList addObject:[JCModel_RecordsConsumptionList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_RecordsConsumptionList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_RecordsConsumptionList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_RecordsConsumptionDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_RecordsConsumptionDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_RecordsConsumptionDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_RecordsConsumptionDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_RecordsConsumptionData *copy = [[JCModel_RecordsConsumptionData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
