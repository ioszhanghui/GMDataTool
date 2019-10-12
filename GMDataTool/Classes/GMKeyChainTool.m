//
//  GMKeyChainTool.m
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/10/10.
//

#import "GMKeyChainTool.h"
#import "GMKeyChainHeader.h"
@interface GMKeyChainTool ()
/*单例*/
@property(nonatomic,class,readonly)GMKeyChainTool * keyChainTool;
/*钥匙串保存工具类*/
@property(nonatomic,strong) KeychainItemWrapper * keyWrapper;
/*钥匙串 Group标示*/
@property(nonatomic,copy)NSString * keyChainGroup;

@end


@implementation GMKeyChainTool

/*如果支持  钥匙串 APP信息  共享 在启动配置 keychaingroup标识
 *
 *
 */
+(void)configKeyChainGroupID:(NSString*)groupID{
    [GMKeyChainTool keyChainTool].keyChainGroup = groupID;
}

-(instancetype)init{
    if (self=[super init]) {
        
    }
    return self;
}

-(KeychainItemWrapper*)keyWrapper{
    if (!_keyWrapper) {
        _keyWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:[UIDevice currentDevice].IDFA accessGroup:nil];//xxxx 自定义
    }
    return _keyWrapper;
}

static inline BOOL isString(id obj){
    if ([obj isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}

+(void)saveAccountInfo:(id)object{
    [self saveObject:object forKey:(id)kSecAttrAccount];
}

/*获取账户信息*/
+(id)accountInfo{
   return [self objectValueForKey:(id)kSecAttrAccount];
}
/*获取密码信息*/
+(id)passwordInfo{
   return [self objectValueForKey:(id)kSecValueData];
}
/*保存密码信息*/
+(void)savePasswordInfo:(id)object{
    [self saveObject:object forKey:(id)kSecValueData];
}

/*保存数据*/
+(void)saveObject:(id)object forKey:(NSString*)key{
    if (isString(object)) {
        [[GMKeyChainTool keyChainTool].keyWrapper setObject:object forKey:key];
    }
}

/*获取钥匙串的值*/
+(id)objectValueForKey:(NSString*)key{
    return [[GMKeyChainTool keyChainTool].keyWrapper  objectForKey:key];
}
/*重置 Identifier 下的数据*/
+(void)resetKeyChainData{
    [[GMKeyChainTool keyChainTool].keyWrapper resetKeychainItem];
}

+(GMKeyChainTool *)keyChainTool{
    
    static dispatch_once_t onceToken;
    static GMKeyChainTool * keyChainTool = nil;
    dispatch_once(&onceToken, ^{
        keyChainTool = [GMKeyChainTool new];
    });
    return keyChainTool;
}
@end
