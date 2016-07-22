//
//  SCUserDefaults.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCUserDefaults.h"
#import "Common.h"
@implementation SCUserDefaults

//存储
+ (void)saveUserName:(NSString *)uname {
    [[NSUserDefaults standardUserDefaults] setObject:uname forKey:@"user_name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
//读取
+ (NSString *)getUserName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
}

+ (void)savePassword:(NSString *)pwd {
    [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getPassword {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
}

+ (void)saveUserID:(NSNumber *)uID {
    [[NSUserDefaults standardUserDefaults] setObject:uID forKey:@"user_id"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSNumber *)getUserID {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
}

+ (void)saveFamilyID:(NSNumber *)fID {
    [[NSUserDefaults standardUserDefaults] setObject:fID forKey:@"family_id"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSNumber *)getFamilyID {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"family_id"];
}

+ (void)saveFileToken:(NSString *)fileToken {
    [[NSUserDefaults standardUserDefaults] setObject:fileToken forKey:@"file_token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getFileToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"file_token"];
}

+ (void)saveToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
}

+ (void)saveNoteStartActionIndex:(NSNumber *)index forUser:(NSNumber *)userID {
    [[NSUserDefaults standardUserDefaults] setObject:index forKey:[NSString stringWithFormat:@"note_action_index_%@", userID]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSNumber *)getNoteStartActionIndexforUser:(NSNumber *)userID {
    NSNumber *index = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"note_action_index_%@", userID]];
    if(index==nil) {
        return [NSNumber numberWithInt:0];
    } else {
        return index;
    }
}

+ (void)saveNoteStartIndex:(NSNumber *)index forUser:(NSNumber *)userID {
    [[NSUserDefaults standardUserDefaults] setObject:index forKey:[NSString stringWithFormat:@"note_index_%@", userID]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSNumber *)getNoteStartIndexforUser:(NSNumber *)userID {
    NSNumber *index = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"note_index_%@", userID]];
    if(index==nil) {
        return [NSNumber numberWithInt:0];
    } else {
        return index;
    }
}

+ (void)setIsAutoLogin:(BOOL)autoLogin {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:autoLogin] forKey:@"is_auto_login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getIsAutoLogin {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"is_auto_login"] boolValue];
}

+ (void)setIsReceiveNotificationOff:(BOOL)isReceiveOff {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:isReceiveOff] forKey:@"is_receive_off"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getReceiveNotificationOff {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"is_receive_off"] boolValue];
}

+ (void)setIsNotificationAlarmOff:(BOOL)isAlarmOff {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:isAlarmOff] forKey:@"is_alarm_off"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getNotificationAlarmOff {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"is_alarm_off"] boolValue];
}

+ (void)setHasNewNotification:(BOOL)hasNew {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:hasNew] forKey:@"has_new_notification"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NOTIFICATION_CHANGED
                                                        object:self
                                                      userInfo:nil];
}

+ (BOOL)getHasNewNotification {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"has_new_notification"] boolValue];
}

+ (void)setHasNewNotiFamily:(BOOL)hasNew {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:hasNew] forKey:@"has_new_noti_family"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if(!hasNew&&![self getHasNewNotiCircle]) {
        [self setHasNewNotification:NO];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NOTIFICATION_CHANGED
                                                            object:self
                                                          userInfo:nil];
    }
}
/**判断是否有新家庭消息*/
+ (BOOL)getHasNewNotiFamily {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"has_new_noti_family"] boolValue];
}

+ (void)setHasNewNotiCircle:(BOOL)hasNew {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:hasNew] forKey:@"has_new_noti_circle"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if(!hasNew&&![self getHasNewNotiFamily]) {
        [self setHasNewNotification:NO];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NOTIFICATION_CHANGED
                                                            object:self
                                                          userInfo:nil];
    }
}

+ (BOOL)getHasNewNotiCircle {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"has_new_noti_circle"] boolValue];
}

+ (void)setBackFromCircle:(BOOL)back {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:back] forKey:@"is_back_from_circle"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getBackFromCircle {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"is_back_from_circle"] boolValue];
}

+ (void)setBackFromMyOrders:(BOOL)back {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:back] forKey:@"is_back_from_myorders"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getBackFromMyOrders {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"is_back_from_myorders"] boolValue];
}

+ (void)setIsCircleCollectChanged:(BOOL)changed {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:changed] forKey:@"is_circle_colloect_changed"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getCircleCollectChanged {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"is_circle_colloect_changed"] boolValue];
}

+ (void)setIsCircleChanged:(BOOL)changed {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:changed] forKey:@"is_circle_changed"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getCircleChanged {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"is_circle_changed"] boolValue];
}

@end
