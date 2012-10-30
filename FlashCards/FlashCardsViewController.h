//
//  FlashCardsViewController.h
//  FlashCards
//
//  Created by John Rotach on 10/23/12.
//  Copyright (c) 2012 John Rotach. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "FlashCardsProblem.h"

@interface FlashCardsViewController : UIViewController {
    
    NSMutableArray *workingList;
    AVAudioPlayer *correctPlayer;
    AVAudioPlayer *wrongPlayer;
    FlashCardsProblem *currentProblem;
    int totalProblems;
    int problemsComplete;
    NSDate *startTime;
}

@property (weak, nonatomic) IBOutlet UILabel *problem;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (weak, nonatomic) IBOutlet UISegmentedControl *probType;

@property (weak, nonatomic) IBOutlet UIView *startView;


- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)answerPressed;
- (IBAction)clearPressed;
- (IBAction)problemTypeChanged;
- (IBAction)startPressed;

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)r;

@end
