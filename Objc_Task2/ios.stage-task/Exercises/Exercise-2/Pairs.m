#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    int num = [number intValue];
    int result = 0;
    
    for (int i = 0; i < [array count]; i++) {
        int f = [[array objectAtIndex:i] intValue];
        for (int a = 1; a < [array count]; a++) {
            int b = [[array objectAtIndex: a] intValue];
            if (b - f == num) {
                result++;
            }
        }
    }
    
    return result;
}

@end
