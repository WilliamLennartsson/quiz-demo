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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerButtons;

@property (nonatomic) QuizHandler *handler;
@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.handler = [[QuizHandler alloc] init];
    // Quiz *q = self.handler.questions[0];
    Quiz *q = [self.handler newQuiz];
    // NSLog(@"%@", q.question);
    [self updateUI:q];
}

// Update UI
- (void) updateUI: (Quiz*)quiz {
    NSArray *answers = [quiz shuffleAnswers];
    for (int i = 0; i < 4; i++){
        [self.answerButtons[i] setTitle: answers[i] forState:UIControlStateNormal];
    }
    self.questionLabel.text = quiz.question;
}

- (IBAction)guessBtnPressed:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]){
        UIButton *button = (UIButton*)sender;
        NSString *guess = button.titleLabel.text;
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

// TODO: rightOrWrongLabel hidden and working
// TODO: 5 frågor sen game over
// TODO: Visa score

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
