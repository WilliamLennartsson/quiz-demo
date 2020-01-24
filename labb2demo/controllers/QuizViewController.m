//
//  QuizViewController.m
//  labb2demo
//
//  Created by William Lennartsson on 2020-01-24.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

#import "QuizViewController.h"
#import "QuizHandler.h"

@interface QuizViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightOrWrongLabel;
// All buttons stored in a collection to avoid copy paste
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerButtons;
// QuizHandler property to use all throughout the viewController
@property (nonatomic) QuizHandler *handler;
@end

@implementation QuizViewController

// TODO: rightOrWrongLabel hidden and working
// TODO: 5 frågor sen game over
// TODO: Visa score

- (void)viewDidLoad {
    [super viewDidLoad];
    self.handler = [[QuizHandler alloc] init];
    // Quiz *q = self.handler.questions[0];
    // Uppdatera UI // New quiz
    [self updateUI: [self.handler newQuiz]];
}

// Update UI
- (void) updateUI: (Quiz*)quiz {
    // Update questionLabel text
    self.questionLabel.text = quiz.question;
    // Get shuffled answers from quiz
    NSArray *answers = [quiz shuffleAnswers];
    // Loop through buttons
    for (int i = 0; i < 4; i++){
        // set title of button to a random answer
        [self.answerButtons[i] setTitle: answers[i] forState:UIControlStateNormal];
    }
}

- (IBAction)guessBtnPressed:(id)sender {
    // Check if sender is a button
    if ([sender isKindOfClass:[UIButton class]]){
        // typecast sender to UIButton
        UIButton *button = (UIButton*)sender;
        // Get guess from the button title
        NSString *guess = button.titleLabel.text;
        // Check if the answer is correct
        if ([self.handler rightOrWrongGuess: guess]) {
            // Correct guess
            // poäng ++
            self.handler.score++;
            // Uppdatera rightOrWrongLabel
            self.rightOrWrongLabel.text = @"Du gissade rätt";
        } else {
            // Not correct guess
            // poäng --
            self.handler.score--;
            // Uppdatera rightOrWrongLabel
            self.rightOrWrongLabel.text = @"Du gissade fel. Sms skickat till +46 1412 51 23";
        }
        NSLog(@"Score: %i", self.handler.score);
        // Uppdatera UI // Nytt quiz
        [self updateUI: [self.handler newQuiz]];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
