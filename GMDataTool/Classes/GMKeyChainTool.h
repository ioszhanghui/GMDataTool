//
//  GMKeyChainTool.h
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/10/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GMKeyChainTool : NSObject
/*如果支持  钥匙串 APP信息  共享 在启动配置 keychaingroup标识
 *
 *
 */
+(void)configKeyChainGroupID:(NSString*)groupID;

/*保存数据
 * (id)kSecAttrAccount  保存账号
 * (id)kSecValueData    保存密码
 */
+(void)saveAccountInfo:(id)object;
/*获取账户信息*/
+(id)accountInfo;
/*获取密码信息*/
+(id)passwordInfo;
/*保存密码信息*/
+(void)savePasswordInfo:(id)object;
/*重置 Identifier 下的数据*/
+(void)resetKeyChainData;
@end

NS_ASSUME_NONNULL_END
