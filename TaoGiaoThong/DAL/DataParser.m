//
//  DataParser.m
//  iMOE
//
//  Created by William (Van Thuong) on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataParser.h"
#import "FMDatabase.h"
#import "Constants.h"


static FMDatabase *db = nil;

@implementation DataParser

+(BOOL)openDatabase
{
    if(db == nil){
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
//        NSString *path = [documentsDirectory stringByAppendingPathComponent:DATABASE_NAME];
//        db = [[FMDatabase alloc] initWithPath:path];
    }
    
    return [db open];
    
}
//+(void)allocStoreListCategory:(NSMutableArray *)listCate AndCateType:(NSString *)cateType
//{
//    if([self openDatabase])
//    {
//        [db beginTransaction];
//        NSMutableArray *listExistCate = [self allocGetListCategoryByCate:cateType];
//        for (Content *content in listCate) {
//            if ([self checkCateIsNew:content AndListExistCate:listExistCate]) {
//                // Add new
//                [self allocStoreCategory:content];
//            }
//            else {
//                // Update
//                [self allocUpdateCategory:content];
//            }
//        }
//        [listExistCate release];
//
//        [db commit];
//   
//        [db close];
//        
//    }else
//    {   
//        NSLog(@"Could not open database");
//        
//    }
//}
//+(NSMutableArray *)allocGetListCategoryByCate:(NSString *)cateID
//{
//    if([self openDatabase])
//    {
//        NSMutableArray *listItem = [[NSMutableArray alloc] init];
//        
//        NSString *query = [[NSString alloc] initWithString:@"SELECT * FROM Content WHERE Category = ?"];
//        FMResultSet *rs = [db executeQuery:query,cateID];
//        while([rs next])
//        {
//            Content *content = [self allocContentWithResultSet:rs];
//            [listItem addObject:content];
//            [content release];
//        }
//        [query release];
//        [rs close];
//        [db close];
//        return listItem;
//        
//    }else
//    {
//        NSLog(@"Could not open database"); 
//    }
//    
//    return nil;
//    
//}
//+(Content*)allocContentWithResultSet:(FMResultSet*)resultSet
//{
//    Content *content = [[Content alloc] init];
//    content.eventID = [resultSet intForColumn:@"id"];
//    content.title = [resultSet stringForColumn:@"title"];
//    content.body = [resultSet stringForColumn:@"body"];
//    content.catagory = [resultSet stringForColumn:@"category"];
//    content.view = [resultSet intForColumn:@"views"];
//    content.likes = [resultSet intForColumn:@"likes"];
//    content.link = [resultSet stringForColumn:@"link"];
//    content.createdTime = [resultSet stringForColumn:@"createdTime"];
//    content.eventTime = [resultSet stringForColumn:@"eventTime"];
//    content.eventPlace = [resultSet stringForColumn:@"eventPlace"];
//    return content;
//}
//+(Content*)allocContentDetailWithResultSet:(FMResultSet*)resultSet
//{
//    Content *content = [[Content alloc] init];
//    content.eventID = [resultSet intForColumn:@"id"];
//    content.title = [resultSet stringForColumn:@"title"];
//    content.body = [resultSet stringForColumn:@"body"];
//    content.catagory = [resultSet stringForColumn:@"category"];
//    content.view = [resultSet intForColumn:@"views"];
//    content.likes = [resultSet intForColumn:@"likes"];
//    content.link = [resultSet stringForColumn:@"link"];
//    content.createdTime = [resultSet stringForColumn:@"createdTime"];
//    content.eventTime = [resultSet stringForColumn:@"eventTime"];
//    content.eventPlace = [resultSet stringForColumn:@"eventPlace"];
//    content.isLike = [resultSet boolForColumn:@"isLike"];
//    return content;
//}
//
//+(void)allocStoreCategory:(Content *)c
//{
//    if([self openDatabase])
//    {
//        NSString *insertQuery = [[NSString alloc] initWithFormat:@"INSERT INTO Content(id, title,body,category,views,likes,link,createdTime,eventTime,eventPlace) VALUES(?,?,?,?,?,?,?,?,?,?)"];
//        if(![db executeUpdate:insertQuery,[NSNumber numberWithInt:c.eventID], c.title,c.body,c.catagory,[NSNumber numberWithInt:c.view],[NSNumber numberWithInt:c.likes],c.link,c.createdTime,c.eventTime,c.eventPlace]){
//            NSLog(@"Could not insert - Error:%@", [db lastErrorMessage]);
//        }
//        [insertQuery release];
//        [db commit];
//        [db close];
//        
//    }else
//    {   
//        NSLog(@"Could not open database");
//        
//    }
//}
//
//+(Content *)allocGetCategoryBy:(int )fatherId
//{
//    if([self openDatabase])
//    {
//        NSString *query = [[NSString alloc] initWithFormat:@"SELECT * FROM Content WHERE id = %d",fatherId];
//        FMResultSet *rs = [db executeQuery:query];
//        Content *content = nil;
//        while([rs next])
//        {
//            content = [self allocContentWithResultSet:rs];
//        }
//        [query release];
//        [rs close];
//        [db close];
//        return content;
//        
//    }else
//    {
//        NSLog(@"Could not open database"); 
//    }
//    
//    return nil;
//}
//#pragma mark - cate detail
//+(void)allocStoreCategoryDetail:(Content *)c
//{
//    if([self openDatabase])
//    {
//        NSString *insertQuery = [[NSString alloc] initWithFormat:@"INSERT INTO ContentDetail(id, title,body,category,views,likes,link,eventTime,eventPlace,createdTime,isLike) VALUES(?,?,?,?,?,?,?,?,?,?,?)"];
//        if(![db executeUpdate:insertQuery,[NSNumber numberWithInt:c.eventID], c.title,c.body,c.catagory,[NSNumber numberWithInt:c.view],[NSNumber numberWithInt:c.likes],c.link,c.eventTime,c.eventPlace,c.createdTime,c.isLike]){
//            NSLog(@"Could not insert - Error:%@", [db lastErrorMessage]);
//        }
//        [insertQuery release];
//        //        [db clearCachedStatements];
//        [db commit];
//        [db close];
//        
//    }else
//    {   
//        NSLog(@"Could not open database");
//        
//    }
//}
//+(Content *)allocGetCategoryDetailBy:(int )fatherId
//{
//    if([self openDatabase])
//    {
//        NSString *query = [[NSString alloc] initWithFormat:@"SELECT * FROM ContentDetail WHERE id = %d",fatherId];
//        FMResultSet *rs = [db executeQuery:query];
//        Content *content = nil;
//        if ([rs next]) {
//            content = [self allocContentDetailWithResultSet:rs];
//        }
//        
//        [query release];
//        [rs close];
//        [db close];
//        return content;
//        
//    }else
//    {
//        NSLog(@"Could not open database"); 
//    }
//    
//    return nil;
//}
//
//+(void)allocUpdateCategoryDetail:(int )cate
//{
//    if([self openDatabase])
//    {
//        BOOL temp = true;
//        NSString *insertQuery = [[NSString alloc] initWithFormat:@"UPDATE ContentDetail SET isLike = ? WHERE id = ?"];
//        if(![db executeUpdate:insertQuery,[NSNumber numberWithBool:temp],[NSNumber numberWithInt:cate]]){
//            NSLog(@"Could not insert - Error:%@", [db lastErrorMessage]);
//        }
//        [insertQuery release];
//        [db commit];
//        [db close];
//        
//    }else
//    {   
//        NSLog(@"Could not open database");
//        
//    }
//}
//+(NSMutableArray *)allocGetListCategoryDetailByLiked
//{
//    if([self openDatabase])
//    {
//        NSMutableArray *listItem = [[NSMutableArray alloc] init];
//        
//        NSString *query = [[NSString alloc] initWithString:@"SELECT * FROM ContentDetail WHERE isLike = 1"];
//        FMResultSet *rs = [db executeQuery:query];
//        while([rs next])
//        {
//            Content *content = [self allocContentWithResultSet:rs];
//            [listItem addObject:content];
//            [content release];
//        }
//        [query release];
//        [rs close];
//        [db close];
//        return listItem;
//        
//    }else
//    {
//        NSLog(@"Could not open database"); 
//    }
//    
//    return nil;
//    
//}
//#pragma mark - UPDATE
//+(void)allocUpdateCategory:(Content *)cate
//{
//    if([self openDatabase])
//    {
//        NSString *insertQuery = [[NSString alloc] initWithFormat:@"UPDATE Content SET title = '%@',body = '%@', category = '%@', views = %d,likes = %d,link = %d, createdTime = '%@', eventTime = '%@', eventPlace = '%@' WHERE id = %d",cate.title,cate.body,cate.catagory,cate.view,cate.likes,cate.link,cate.createdTime,cate.eventTime,cate.eventPlace,cate.eventID];
//        if(![db executeUpdate:insertQuery]){
//            NSLog(@"Could not insert - Error:%@", [db lastErrorMessage]);
//        }
//        [insertQuery release];
//        
////        [db commit];
//        [db close];
//        
//    }else
//    {   
//        NSLog(@"Could not open database");
//        
//    }
//}
///*
// @param : Cate
// If cate is new - >  Return Yes  
// Else cate is exist - > Return No
// */
//+(BOOL)checkCateIsNew:(Content *)newCate AndListExistCate:(NSMutableArray *)listExistCate
//{
//    for (Content *content in listExistCate) {
//        if (content.eventID == newCate.eventID) {
//            return NO;
//        }
//    }
//    return YES;
//}
//+(NSMutableArray *)getListCateWithCateType:(NSString *)cateType
//{
//    NSMutableArray *listItem = [[NSMutableArray alloc] init];
//    NSString *query = [[NSString alloc] initWithString:@"SELECT * FROM Content WHERE Category = ?"];
//    FMResultSet *rs = [db executeQuery:query,cateType];
//    while([rs next])
//    {
//        Content *content = [self allocContentWithResultSet:rs];
//        [listItem addObject:content];
//        [content release];
//    }
//    [query release];
//    [rs close];
//    [db close];
//    [listItem release];
//    
//    return listItem;
//}
//+(void)startUpdateWithListCate:(NSMutableArray *)listNewCate AndCateType:(NSString *)cateType
//{
//    if ([self openDatabase]) {
//        NSMutableArray *listExistCate = [self getListCateWithCateType:cateType];
//        for (Content *content in listNewCate) {
//            if ([self checkCateIsNew:content AndListExistCate:listExistCate]) {
//                // Add new
//                [self allocStoreCategory:content];
//            }
//            else {
//                // Update
//                [self allocUpdateCategory:content];
//            }
//        }
//        [listExistCate release];
//    }
//}
@end
