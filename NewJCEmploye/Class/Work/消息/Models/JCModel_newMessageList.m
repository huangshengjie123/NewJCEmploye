//
//  JCModel_newMessageList.m
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newMessageList.h"


NSString *const kJCModel_newMessageListFormId = @"formId";
NSString *const kJCModel_newMessageListContent = @"content";
NSString *const kJCModel_newMessageListFrom = @"from";
NSString *const kJCModel_newMessageListTitle = @"title";
NSString *const kJCModel_newMessageListSendTime = @"sendTime";
NSString *const kJCModel_newMessageListTag = @"tag";
NSString *const kJCModel_newMessageListMsgId = @"msgId";
NSString *const kJCModel_newMessageListTo = @"to";
NSString *const kJCModel_newMessageListPath = @"path";
NSString *const kJCModel_newMessageListType = @"type";


@interface JCModel_newMessageList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newMessageList

@synthesize formId = _formId;
@synthesize content = _content;
@synthesize from = _from;
@synthesize title = _title;
@synthesize sendTime = _sendTime;
@synthesize tag = _tag;
@synthesize msgId = _msgId;
@synthesize to = _to;
@synthesize path = _path;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.formId = [self objectOrNilForKey:kJCModel_newMessageListFormId fromDictionary:dict];
            self.content = [self objectOrNilForKey:kJCModel_newMessageListContent fromDictionary:dict];
            self.from = [self objectOrNilForKey:kJCModel_newMessageListFrom fromDictionary:dict];
            self.title = [self objectOrNilForKey:kJCModel_newMessageListTitle fromDictionary:dict];
            self.sendTime = [self objectOrNilForKey:kJCModel_newMessageListSendTime fromDictionary:dict];
            self.tag = [[self objectOrNilForKey:kJCModel_newMessageListTag fromDictionary:dict] doubleValue];
            self.msgId = [[self objectOrNilForKey:kJCModel_newMessageListMsgId fromDictionary:dict] doubleValue];
            self.to = [[self objectOrNilForKey:kJCModel_newMessageListTo fromDictionary:dict] doubleValue];
            self.path = [self objectOrNilForKey:kJCModel_newMessageListPath fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_newMessageListType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.formId forKey:kJCModel_newMessageListFormId];
    [mutableDict setValue:self.content forKey:kJCModel_newMessageListContent];
    [mutableDict setValue:self.from forKey:kJCModel_newMessageListFrom];
    [mutableDict setValue:self.title forKey:kJCModel_newMessageListTitle];
    [mutableDict setValue:self.sendTime forKey:kJCModel_newMessageListSendTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tag] forKey:kJCModel_newMessageListTag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.msgId] forKey:kJCModel_newMessageListMsgId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.to] forKey:kJCModel_newMessageListTo];
    [mutableDict setValue:self.path forKey:kJCModel_newMessageListPath];
    [mutableDict setValue:self.type forKey:kJCModel_newMessageListType];

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

    self.formId = [aDecoder decodeObjectForKey:kJCModel_newMessageListFormId];
    self.content = [aDecoder decodeObjectForKey:kJCModel_newMessageListContent];
    self.from = [aDecoder decodeObjectForKey:kJCModel_newMessageListFrom];
    self.title = [aDecoder decodeObjectForKey:kJCModel_newMessageListTitle];
    self.sendTime = [aDecoder decodeObjectForKey:kJCModel_newMessageListSendTime];
    self.tag = [aDecoder decodeDoubleForKey:kJCModel_newMessageListTag];
    self.msgId = [aDecoder decodeDoubleForKey:kJCModel_newMessageListMsgId];
    self.to = [aDecoder decodeDoubleForKey:kJCModel_newMessageListTo];
    self.path = [aDecoder decodeObjectForKey:kJCModel_newMessageListPath];
    self.type = [aDecoder decodeObjectForKey:kJCModel_newMessageListType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_formId forKey:kJCModel_newMessageListFormId];
    [aCoder encodeObject:_content forKey:kJCModel_newMessageListContent];
    [aCoder encodeObject:_from forKey:kJCModel_newMessageListFrom];
    [aCoder encodeObject:_title forKey:kJCModel_newMessageListTitle];
    [aCoder encodeObject:_sendTime forKey:kJCModel_newMessageListSendTime];
    [aCoder encodeDouble:_tag forKey:kJCModel_newMessageListTag];
    [aCoder encodeDouble:_msgId forKey:kJCModel_newMessageListMsgId];
    [aCoder encodeDouble:_to forKey:kJCModel_newMessageListTo];
    [aCoder encodeObject:_path forKey:kJCModel_newMessageListPath];
    [aCoder encodeObject:_type forKey:kJCModel_newMessageListType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newMessageList *copy = [[JCModel_newMessageList alloc] init];
    
    
    
    if (copy) {

        copy.formId = [self.formId copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.from = [self.from copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.sendTime = [self.sendTime copyWithZone:zone];
        copy.tag = self.tag;
        copy.msgId = self.msgId;
        copy.to = self.to;
        copy.path = [self.path copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
