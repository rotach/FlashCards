//
//  FlashCardsProblem.h
//  FlashCards
//
//  Created by John Rotach on 10/24/12.
//  Copyright (c) 2012 John Rotach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlashCardsProblem : NSObject

@property (nonatomic, strong) NSString *problem;
@property (nonatomic, strong) NSNumber *answer;

-(FlashCardsProblem *) initWithProblem: (NSString *)p andAnswer: (int) n;

@end
