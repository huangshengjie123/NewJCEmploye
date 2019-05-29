//
//  JCModel_ReturnVisitPageProperties.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitPageProperties.h"


NSString *const kJCModel_ReturnVisitPagePropertiesSize = @"size";
NSString *const kJCModel_ReturnVisitPagePropertiesStart = @"start";
NSString *const kJCModel_ReturnVisitPagePropertiesEnd = @"end";
NSString *const kJCModel_ReturnVisitPagePropertiesCount = @"count";
NSString *const kJCModel_ReturnVisitPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_ReturnVisitPagePropertiesPageNum = @"pageNum";


@interface JCModel_ReturnVisitPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_ReturnVisitPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_ReturnVisitPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_ReturnVisitPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_ReturnVisitPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_ReturnVisitPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_ReturnVisitPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_ReturnVisitPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_ReturnVisitPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_ReturnVisitPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_ReturnVisitPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_ReturnVisitPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_ReturnVisitPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_ReturnVisitPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_ReturnVisitPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_ReturnVisitPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_ReturnVisitPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_ReturnVisitPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_ReturnVisitPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitPageProperties *copy = [[JCModel_ReturnVisitPageProperties alloc] init];
    
    
    
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
