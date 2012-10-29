//
//  FlashCardsProblem.m
//  FlashCards
//
//  Created by John Rotach on 10/24/12.
//  Copyright (c) 2012 John Rotach. All rights reserved.
//

#import "FlashCardsProblem.h"

@implementation FlashCardsProblem

@synthesize problem = _problem;
@synthesize answer = _answer;

-(FlashCardsProblem *) initWithProblem: (NSString *)p andAnswer: (int) n {
    [self setProblem:p];
    [self setAnswer: [NSNumber numberWithInt:n]];
    return self;
}

@end
