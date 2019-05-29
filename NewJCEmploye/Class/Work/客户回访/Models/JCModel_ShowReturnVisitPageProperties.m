//
//  JCModel_ShowReturnVisitPageProperties.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitPageProperties.h"


NSString *const kJCModel_ShowReturnVisitPagePropertiesSize = @"size";
NSString *const kJCModel_ShowReturnVisitPagePropertiesStart = @"start";
NSString *const kJCModel_ShowReturnVisitPagePropertiesEnd = @"end";
NSString *const kJCModel_ShowReturnVisitPagePropertiesCount = @"count";
NSString *const kJCModel_ShowReturnVisitPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_ShowReturnVisitPagePropertiesPageNum = @"pageNum";


@interface JCModel_ShowReturnVisitPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_ShowReturnVisitPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_ShowReturnVisitPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_ShowReturnVisitPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_ShowReturnVisitPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_ShowReturnVisitPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_ShowReturnVisitPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_ShowReturnVisitPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_ShowReturnVisitPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_ShowReturnVisitPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_ShowReturnVisitPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_ShowReturnVisitPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_ShowReturnVisitPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_ShowReturnVisitPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_ShowReturnVisitPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_ShowReturnVisitPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_ShowReturnVisitPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_ShowReturnVisitPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_ShowReturnVisitPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitPageProperties *copy = [[JCModel_ShowReturnVisitPageProperties alloc] init];
    
    
    
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
