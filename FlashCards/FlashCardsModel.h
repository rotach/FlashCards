//
//  FlashCardsModel.h
//  FlashCards
//
//  Created by John Rotach on 10/23/12.
//  Copyright (c) 2012 John Rotach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashCardsProblem.h"

@interface FlashCardsModel : NSObject {
    
    NSMutableArray *problemList;
}

- (FlashCardsProblem *)getProblem;
- (FlashCardsProblem *)randomAdditionProblem;
- (FlashCardsProblem *)randomSubtractionProblem;

@end
