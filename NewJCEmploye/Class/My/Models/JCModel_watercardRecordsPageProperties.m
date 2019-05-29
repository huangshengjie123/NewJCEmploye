//
//  JCModel_watercardRecordsPageProperties.m
//
//  Created by   on 2018/10/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_watercardRecordsPageProperties.h"


NSString *const kJCModel_watercardRecordsPagePropertiesSize = @"size";
NSString *const kJCModel_watercardRecordsPagePropertiesStart = @"start";
NSString *const kJCModel_watercardRecordsPagePropertiesEnd = @"end";
NSString *const kJCModel_watercardRecordsPagePropertiesCount = @"count";
NSString *const kJCModel_watercardRecordsPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_watercardRecordsPagePropertiesPageNum = @"pageNum";


@interface JCModel_watercardRecordsPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_watercardRecordsPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_watercardRecordsPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_watercardRecordsPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_watercardRecordsPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_watercardRecordsPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_watercardRecordsPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_watercardRecordsPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_watercardRecordsPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_watercardRecordsPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_watercardRecordsPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_watercardRecordsPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_watercardRecordsPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_watercardRecordsPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_watercardRecordsPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_watercardRecordsPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_watercardRecordsPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_watercardRecordsPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_watercardRecordsPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_watercardRecordsPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_watercardRecordsPageProperties *copy = [[JCModel_watercardRecordsPageProperties alloc] init];
    
    
    
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
