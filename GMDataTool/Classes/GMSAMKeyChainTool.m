//
//  GMSAMKeyChainTool.m
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/10/10.
//

#import "GMSAMKeyChainTool.h"
#import "SAMKeychain.h"

@implementation GMSAMKeyChainTool

/*保存数据*/
+(void)saveContent:(id)content forKey:(NSString*)key{
    if (!content||!key||!isString(content)) {
        return;
    }
    [SAMKeychain setPassword:content forService:[GMAppInfoTool appBundleID] account:key];
}

static inline BOOL isString(id obj){
    
    if ([obj isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}
/*获取对应key的数据*/
+(id)getContentforKey:(NSString*)key{
    
    if (!key) {
        return nil;
    }
    return [SAMKeychain passwordForService:[GMAppInfoTool appBundleID] account:key];
}
/*删除对应key的数据*/
+(void)deleteContentforKey:(NSString*)key{
    if (!key) {
        return;
    }
    [SAMKeychain deletePasswordForService:[GMAppInfoTool appBundleID] account:key];
}
/*清除所有的数据*/
+(void)clearAllContent{
    
    NSArray * keyChainList = [SAMKeychain accountsForService:[GMAppInfoTool appBundleID]];
    [keyChainList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self deleteContentforKey:[obj objectForKey:kSAMKeychainAccountKey]];
    }];
}

/*查询所有c钥匙串 存的信息*/
+(NSArray*)SAMKeyChainList{
    return [SAMKeychain accountsForService:[GMAppInfoTool appBundleID]];
}

@end
