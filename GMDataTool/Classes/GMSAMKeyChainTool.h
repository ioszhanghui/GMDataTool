//
//  GMSAMKeyChainTool.h
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/10/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GMSAMKeyChainTool : NSObject

/*查询所有c钥匙串 存的信息*/
+(NSArray*)SAMKeyChainList;
/*保存数据*/
+(void)saveContent:(id)content forKey:(NSString*)key;
/*获取对应key的数据*/
+(id)getContentforKey:(NSString*)key;
/*删除对应key的数据*/
+(void)deleteContentforKey:(NSString*)key;
/*清除所有的数据*/
+(void)clearAllContent;

@end

NS_ASSUME_NONNULL_END
