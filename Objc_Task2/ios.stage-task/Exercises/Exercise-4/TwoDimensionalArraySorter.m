#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *digits = [[NSMutableArray alloc] init];
    NSMutableArray *strings = [[NSMutableArray alloc] init];
    bool ravno = true;
    
    if ([[array objectAtIndex: 0] isKindOfClass: [NSArray class]]) {
        for (int i = 0; i < [array count]; i++) {
            NSMutableArray *check = [NSMutableArray arrayWithArray: [array objectAtIndex: i]];
            
            for (int b = 1; b < [check count]; b++) {
                
                if ([[check objectAtIndex: 0] isKindOfClass: [NSString class]]) {
                    if ([[check objectAtIndex: b] isKindOfClass: [NSString class]]) {
                        continue;
                    } else {
                        ravno = false;
                    }
                } else {
                    if ([[check objectAtIndex: b] isKindOfClass: [NSNumber class]]) {
                        continue;
                    } else {
                        ravno = false;
                    }
                }
            }
            if (ravno) {
                for (int b = 0; b < [check count]; b++) {
                    NSString *el = [check objectAtIndex:b];
                    if ([el isKindOfClass:NSNumber.class]) {
                        [digits addObject: el];
                    } else {
                        [strings addObject: el];
                    }
                }
            }
        }
    }
    else {
        for (int i = 1; i < [array count]; i++) {
            if ([[array objectAtIndex: 0] isKindOfClass: [NSString class]]) {
                if ([[array objectAtIndex: i] isKindOfClass: [NSString class]]) {
                    continue;
                } else {
                    ravno = false;
                }
            } else {
                if ([[array objectAtIndex: i] isKindOfClass: [NSNumber class]]) {
                    continue;
                } else {
                    ravno = false;
                }
            }
        }
            if (ravno) {
                for (int b = 0; b < [array count]; b++) {
                    NSString *el = [array objectAtIndex: b];
                    if ([el isKindOfClass:NSNumber.class]) {
                        [digits addObject: el];
                    } else {
                        [strings addObject: el];
                    }
                }
            }
    }
    
    NSArray *sortedStrings = [strings sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self"
                                                                ascending: YES];
    NSArray *sortedDigits = [digits sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    NSArray *final = [[NSArray alloc] init];
    
    if ([sortedStrings count] != 0 && [sortedDigits count] == 0) {
        final = sortedStrings;
    } else if ([sortedStrings count] == 0 && [sortedDigits count] != 0) {
        final = sortedDigits;
    } else {
        final = @[];
    }
    
    NSLog(@"%@", final);
    
    return final;
}

@end
