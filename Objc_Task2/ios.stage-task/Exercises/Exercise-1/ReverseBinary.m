#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {

    NSMutableArray *new = [[NSMutableArray alloc] init];
    
    while (n > 0) {
        int r = n % 2; // r = 0
        n /= 2; // n = 1
        [new insertObject:@(r) atIndex:0];
    }

    long i = [new count];
    
    do {
        [new insertObject:@(0) atIndex:0];
        i++;
    } while (i < 8);
    
    NSArray *reverse = [[new reverseObjectEnumerator] allObjects];
    NSString *reverseString = [reverse componentsJoinedByString:@""];
    long c = strtol([reverseString UTF8String], NULL, 2);
    
    return c;
    
}
