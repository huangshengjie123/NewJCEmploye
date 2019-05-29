//
//  JCModel_refundData3PageProperties.m
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_refundData3PageProperties.h"


NSString *const kJCModel_refundData3PagePropertiesSize = @"size";
NSString *const kJCModel_refundData3PagePropertiesStart = @"start";
NSString *const kJCModel_refundData3PagePropertiesEnd = @"end";
NSString *const kJCModel_refundData3PagePropertiesCount = @"count";
NSString *const kJCModel_refundData3PagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_refundData3PagePropertiesPageNum = @"pageNum";


@interface JCModel_refundData3PageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_refundData3PageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_refundData3PagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_refundData3PagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_refundData3PagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_refundData3PagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_refundData3PagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_refundData3PagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_refundData3PagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_refundData3PagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_refundData3PagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_refundData3PagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_refundData3PagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_refundData3PagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_refundData3PagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_refundData3PagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_refundData3PagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_refundData3PagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_refundData3PagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_refundData3PagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_refundData3PagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_refundData3PagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_refundData3PagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_refundData3PagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_refundData3PagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_refundData3PagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_refundData3PageProperties *copy = [[JCModel_refundData3PageProperties alloc] init];
    
    
    
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
