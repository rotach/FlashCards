//
//  FlashCardsViewController.m
//  FlashCards
//
//  Created by John Rotach on 10/23/12.
//  Copyright (c) 2012 John Rotach. All rights reserved.
//

#import "FlashCardsViewController.h"
#import "FlashCardsModel.h"

@interface FlashCardsViewController ()
@property (nonatomic, strong) FlashCardsModel *model;
@end

@implementation FlashCardsViewController

@synthesize problem = _problem;
@synthesize model = _model;

- (FlashCardsModel *)model {
    if (!_model) {
        _model = [[FlashCardsModel alloc] init];
    }
    return _model;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *chimePath = [[NSBundle mainBundle] pathForResource:@"magic-chime-02" ofType:@"mp3"];
    //NSLog(@"%@", chimePath);
    NSURL *chimeURL = [NSURL fileURLWithPath:chimePath];
    NSString *buzzPath = [[NSBundle mainBundle] pathForResource:@"fail-buzzer-01" ofType:@"mp3"];
    //NSLog(@"%@", buzzPath);
    NSURL *buzzURL = [NSURL fileURLWithPath:buzzPath];
    
    NSError *error;
    correctPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:chimeURL error:&error];
    correctPlayer.numberOfLoops = 0;
    wrongPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:buzzURL error:&error];
    wrongPlayer.numberOfLoops = 0;
    
    if (correctPlayer == nil || wrongPlayer == nil) {
        NSLog(@"%@", [error description]);
    }
    
    [self newProblem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)numberPressed:(UIButton *)sender {
    [[self answer] setText:[[[self answer] text] stringByAppendingString:[sender currentTitle]]];
}
- (IBAction)answerPressed {
    if ([[[self answer] text] intValue] == [[currentProblem answer] integerValue]) {
        [[self answer] setTextColor:[UIColor greenColor]];

        [correctPlayer play];
        [self performSelector:@selector(newProblem) withObject:nil afterDelay:1];
    } else {
        [self answerRed];
        [wrongPlayer play];
        [self performSelector:@selector(answerOrange) withObject:nil afterDelay:1];
        [self performSelector:@selector(drawProblem) withObject:nil afterDelay:1];
    }
}

- (IBAction)clearPressed {
    [[self answer] setText:@""];
    [[self answer] setTextColor:[UIColor orangeColor]];
}

- (IBAction)problemTypeChanged {
    [self newProblem];
}


- (void)newProblem {
    if ([[self probType] selectedSegmentIndex] == 0) {
        currentProblem = [[self model] randomAdditionProblem];
    } else {
        currentProblem = [[self model] randomSubtractionProblem];
    }
    //currentProblem = [[self model] getProblem];
    [self drawProblem];
    [self answerOrange];
}

- (void)drawProblem {
    [[self problem] setText:[currentProblem problem]];
    [[self answer] setText:@""];
}

- (void)answerRed {
    [[self answer] setTextColor:[UIColor redColor]];
}

- (void)answerGreen {
    [[self answer] setTextColor:[UIColor greenColor]];
}

- (void)answerOrange {
    [[self answer] setTextColor:[UIColor orangeColor]];
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)r {
    //NSLog(@"Swipe!");
    //[self loadProblems];
    [self newProblem];
}
@end
