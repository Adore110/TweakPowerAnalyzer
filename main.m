#import <Foundation/Foundation.h>
#include <roothide.h>

int main(int argc, char *argv[]) {
    @autoreleasepool {
        printf("=== 插件列表读取测试 ===\n");
        
        // 尝试读取 dpkg 状态文件
        NSString *path = jbroot(@"/var/lib/dpkg/status");
        printf("尝试读取路径: %s\n", [path UTF8String]);
        
        NSString *content = [NSString stringWithContentsOfFile:path
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
        
        if (!content) {
            printf("读取失败！路径可能不对。\n");
            return 1;
        }
        
        printf("读取成功！文件大小: %lu 字节\n", (unsigned long)content.length);
        
        // 简单数一下有多少个 Package 行
        NSArray *lines = [content componentsSeparatedByString:@"\n"];
        int count = 0;
        for (NSString *line in lines) {
            if ([line hasPrefix:@"Package:"]) {
                count++;
            }
        }
        printf("找到 %d 个包\n", count);
    }
    return 0;
}
