#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *digits = [[NSMutableArray alloc] init];
    NSMutableArray *strings = [[NSMutableArray alloc] init];
    
    for (int a = 0; a < [array count]; a++) {
        NSMutableArray *check = [NSMutableArray arrayWithArray: [array objectAtIndex:a]];
        
        bool ravno = true;
        
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
    
    return final;
}

@end
