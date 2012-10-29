//
//  FlashCardsModel.m
//  FlashCards
//
//  Created by John Rotach on 10/23/12.
//  Copyright (c) 2012 John Rotach. All rights reserved.
//

#import "FlashCardsModel.h"

@interface FlashCardsModel()

@end


@implementation FlashCardsModel

- (FlashCardsModel *)init {
    if (! problemList) {
        problemList = [[NSMutableArray alloc] init];
        /*
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"2+1" andAnswer:3]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"3+1" andAnswer:4]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"9+1" andAnswer:10]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"2+2" andAnswer:4]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"2+6" andAnswer:8]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"7+2" andAnswer:9]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"3+5" andAnswer:8]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"2+6" andAnswer:8]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"9+9" andAnswer:18]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"7+8" andAnswer:15]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"9+4" andAnswer:13]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"5+7" andAnswer:12]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"6+8" andAnswer:14]];
        [problemList addObject: [[FlashCardsProblem alloc] initWithProblem:@"9+8" andAnswer:17]];
         */
    }
    
    return self;
}

- (FlashCardsProblem *)getProblem {
    FlashCardsProblem *result = nil;

    if (problemList) {
        int probIdx = arc4random() % [problemList count];
        result = [problemList objectAtIndex:probIdx];
    }
    return result;
}

- (FlashCardsProblem *)randomAdditionProblem {
    int op1 = arc4random_uniform(11);
    int op2 = arc4random_uniform(11);
    
    return [[FlashCardsProblem alloc]
            initWithProblem: [NSString stringWithFormat:@"%d+%d", op1, op2]
            andAnswer:(op1 + op2)];
}

- (FlashCardsProblem *)randomSubtractionProblem {
    // can't have op1 as zero, then we'd get a divide by zero
    // when we calculate op2
    int op1 = 0;
    while (op1 == 0) {
        op1 = arc4random_uniform(21);
    }
    
    int op2 = arc4random_uniform(op1);
    
    return [[FlashCardsProblem alloc]
            initWithProblem: [NSString stringWithFormat:@"%d-%d", op1, op2]
            andAnswer:(op1 - op2)];
}

@end
