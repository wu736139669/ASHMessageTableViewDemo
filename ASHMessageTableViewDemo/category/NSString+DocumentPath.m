//
//  NSString+DocumentPath.m
//  气泡
//
//  Created by zzy on 14-5-15.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "NSString+DocumentPath.h"

@implementation NSString (DocumentPath)
+(NSString *)documentPathWith:(NSString *)fileName
{

    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
}
@end
