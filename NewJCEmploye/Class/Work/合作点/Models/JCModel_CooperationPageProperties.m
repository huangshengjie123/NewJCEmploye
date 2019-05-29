//
//  JCModel_CooperationPageProperties.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPageProperties.h"


NSString *const kJCModel_CooperationPagePropertiesSize = @"size";
NSString *const kJCModel_CooperationPagePropertiesStart = @"start";
NSString *const kJCModel_CooperationPagePropertiesEnd = @"end";
NSString *const kJCModel_CooperationPagePropertiesCount = @"count";
NSString *const kJCModel_CooperationPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_CooperationPagePropertiesPageNum = @"pageNum";


@interface JCModel_CooperationPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_CooperationPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_CooperationPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_CooperationPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_CooperationPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_CooperationPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_CooperationPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_CooperationPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_CooperationPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_CooperationPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_CooperationPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_CooperationPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_CooperationPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_CooperationPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_CooperationPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_CooperationPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_CooperationPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_CooperationPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_CooperationPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_CooperationPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_CooperationPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_CooperationPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_CooperationPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_CooperationPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_CooperationPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPageProperties *copy = [[JCModel_CooperationPageProperties alloc] init];
    
    
    
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
