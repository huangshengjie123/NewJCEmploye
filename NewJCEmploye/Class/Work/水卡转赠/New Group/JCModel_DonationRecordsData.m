//
//  JCModel_DonationRecordsData.m
//
//  Created by   on 2018/12/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DonationRecordsData.h"
#import "JCModel_DonationRecordsList.h"


NSString *const kJCModel_DonationRecordsDataPageProperties = @"pageProperties";
NSString *const kJCModel_DonationRecordsDataList = @"list";


@interface JCModel_DonationRecordsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DonationRecordsData

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
            self.pageProperties = [self objectOrNilForKey:kJCModel_DonationRecordsDataPageProperties fromDictionary:dict];
    NSObject *receivedJCModel_DonationRecordsList = [dict objectForKey:kJCModel_DonationRecordsDataList];
    NSMutableArray *parsedJCModel_DonationRecordsList = [NSMutableArray array];
    
    if ([receivedJCModel_DonationRecordsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DonationRecordsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DonationRecordsList addObject:[JCModel_DonationRecordsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DonationRecordsList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DonationRecordsList addObject:[JCModel_DonationRecordsList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DonationRecordsList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_DonationRecordsList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageProperties forKey:kJCModel_DonationRecordsDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_DonationRecordsDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_DonationRecordsDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_DonationRecordsDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DonationRecordsData *copy = [[JCModel_DonationRecordsData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
