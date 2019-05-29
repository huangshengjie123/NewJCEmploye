//
//  JCModel_DistributionPageProperties.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionPageProperties.h"


NSString *const kJCModel_DistributionPagePropertiesSize = @"size";
NSString *const kJCModel_DistributionPagePropertiesStart = @"start";
NSString *const kJCModel_DistributionPagePropertiesEnd = @"end";
NSString *const kJCModel_DistributionPagePropertiesCount = @"count";
NSString *const kJCModel_DistributionPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_DistributionPagePropertiesPageNum = @"pageNum";


@interface JCModel_DistributionPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_DistributionPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_DistributionPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_DistributionPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_DistributionPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_DistributionPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_DistributionPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_DistributionPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_DistributionPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_DistributionPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_DistributionPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_DistributionPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_DistributionPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_DistributionPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_DistributionPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_DistributionPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_DistributionPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_DistributionPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_DistributionPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_DistributionPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_DistributionPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_DistributionPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_DistributionPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_DistributionPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_DistributionPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionPageProperties *copy = [[JCModel_DistributionPageProperties alloc] init];
    
    
    
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
