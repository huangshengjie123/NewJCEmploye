//
//  JCModel_watercardRecordsData.m
//
//  Created by   on 2018/10/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_watercardRecordsData.h"
#import "JCModel_watercardRecordsPageProperties.h"
#import "JCModel_watercardRecordsList.h"


NSString *const kJCModel_watercardRecordsDataPageProperties = @"pageProperties";
NSString *const kJCModel_watercardRecordsDataList = @"list";


@interface JCModel_watercardRecordsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_watercardRecordsData

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
            self.pageProperties = [JCModel_watercardRecordsPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_watercardRecordsDataPageProperties]];
    NSObject *receivedJCModel_watercardRecordsList = [dict objectForKey:kJCModel_watercardRecordsDataList];
    NSMutableArray *parsedJCModel_watercardRecordsList = [NSMutableArray array];
    
    if ([receivedJCModel_watercardRecordsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_watercardRecordsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_watercardRecordsList addObject:[JCModel_watercardRecordsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_watercardRecordsList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_watercardRecordsList addObject:[JCModel_watercardRecordsList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_watercardRecordsList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_watercardRecordsList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_watercardRecordsDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_watercardRecordsDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_watercardRecordsDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_watercardRecordsDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_watercardRecordsData *copy = [[JCModel_watercardRecordsData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
