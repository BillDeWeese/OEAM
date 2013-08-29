//
//  Notes.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/25/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "Notes.h"
#import "Constants.h"
#import "MasterViewController.h"

@implementation Notes

static NSMutableDictionary *allNotes;
static NSString *currentKey;

+(NSMutableDictionary *)getAllNotes
{
    if (allNotes == nil) {
        allNotes = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllNotesKey]];
    }
    return allNotes;
}


+(void)setCurrentKey:(NSString *)key
{
    currentKey = key;
}
+(NSString *)getCurrentKey
{
    return currentKey;
}
+(void)setNoteForCurrentKey:(NSString *)note
{
    [self setNote:note forKey:currentKey];
}
+(void)setNote:(NSString *)note forKey:(NSString *)key
{
    [allNotes setObject:note forKey:key];
}
+(void)saveNotes
{
    [[NSUserDefaults standardUserDefaults] setObject:allNotes forKey:kAllNotesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [[NSUbiquitousKeyValueStore defaultStore] setObject:allNotes forKey:kAllNotesKey];
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
 
}
+(void)removeObjectForKey:(NSString *)key
{
    [allNotes removeObjectForKey:key];
}

+(void)didReceiveCloudData:(NSDictionary *)d
{
    allNotes = [[NSMutableDictionary alloc] initWithDictionary:d];
    [self saveNotes];
    
    [[MasterViewController masterView] reload];

}

+(NSURL *)notesURL
{
    NSURL *url = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
    return [url URLByAppendingPathComponent:kAllNotesKey];
}


+(void)dataUpdatedFromCloud:(NSNotification *)notification
{
    NSDictionary *cloudData = [[NSUbiquitousKeyValueStore defaultStore] dictionaryForKey:kAllNotesKey];
    allNotes = [[NSMutableDictionary alloc] initWithDictionary:cloudData];
    [[MasterViewController masterView] reload];
}



@end
