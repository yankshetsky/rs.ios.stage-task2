#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    int i = 0;
    long a = [numbersArray count];
    NSString *string = [[NSString alloc] init];
    
    if (a == 4) {
        
        while (i < [numbersArray count]) {
            if ([[numbersArray objectAtIndex:i] intValue] <= 0){
                string = @"a";
                break;
            } else if([[numbersArray objectAtIndex:i] intValue] >= 255) {
                string = @"b";
                break;
            } else {
                [mutableArray insertObject:[numbersArray objectAtIndex:i] atIndex:i];
                i++;
            }
        }
        
    } else if (a < 4 && a > 0) {
        
        while (i < a) {
            if ([[numbersArray objectAtIndex:i] intValue] <= 0){
                string = @"a";
                break;
            } else if([[numbersArray objectAtIndex:i] intValue] >= 255) {
                string = @"b";
                break;
            } else {
                [mutableArray insertObject:[numbersArray objectAtIndex:i] atIndex:i];
                i++;
            }
        }
        
        
        for (long b = a; b < 4; b++) {
            [mutableArray insertObject:@(0) atIndex:b];
        }
        
    } else if (a > 4) {
        while (i < 4) {
            if ([[numbersArray objectAtIndex:i] intValue] <= 0){
                string = @"a";
                break;
            } else if([[numbersArray objectAtIndex:i] intValue] >= 255) {
                string = @"b";
                break;
            } else {
                [mutableArray insertObject:[numbersArray objectAtIndex:i] atIndex:i];
                i++;
            }
        }
    }
    
    if ([string isEqualToString:@"a"]) {
        return string = @"Negative numbers are not valid for input.";
    } else if ([string isEqualToString:@"b"]) {
        return string = @"The numbers in the input array can be in the range from 0 to 255.";
    } else {
        NSString *string = [mutableArray componentsJoinedByString:@"."];
        return string;
    }
}

@end
