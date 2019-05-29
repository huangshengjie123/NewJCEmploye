//
//  JCModel_RecordsConsumptionPageProperties.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_RecordsConsumptionPageProperties.h"


NSString *const kJCModel_RecordsConsumptionPagePropertiesSize = @"size";
NSString *const kJCModel_RecordsConsumptionPagePropertiesStart = @"start";
NSString *const kJCModel_RecordsConsumptionPagePropertiesEnd = @"end";
NSString *const kJCModel_RecordsConsumptionPagePropertiesCount = @"count";
NSString *const kJCModel_RecordsConsumptionPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_RecordsConsumptionPagePropertiesPageNum = @"pageNum";


@interface JCModel_RecordsConsumptionPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_RecordsConsumptionPageProperties

@synthesize size = _size;
@synthesize start = _start;
@synthesize endProperty = _endProperty;
@synthesize count = _count;
@synthesize totalPage = _totalPage;
@synthesize pageNum = _pageNum;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.size = [[self objectOrNilForKey:kJCModel_RecordsConsumptionPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_RecordsConsumptionPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_RecordsConsumptionPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_RecordsConsumptionPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_RecordsConsumptionPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_RecordsConsumptionPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_RecordsConsumptionPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_RecordsConsumptionPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_RecordsConsumptionPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_RecordsConsumptionPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_RecordsConsumptionPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_RecordsConsumptionPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_RecordsConsumptionPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_RecordsConsumptionPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_RecordsConsumptionPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_RecordsConsumptionPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_RecordsConsumptionPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_RecordsConsumptionPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_RecordsConsumptionPageProperties *copy = [[JCModel_RecordsConsumptionPageProperties alloc] init];
    
    
    
    if (copy) {

        copy.size = self.size;
        copy.start = self.start;
        copy.endProperty = self.endProperty;
        copy.count = self.count;
        copy.totalPage = self.totalPage;
        copy.pageNum = self.pageNum;
    }
    
    return copy;
}


@end
