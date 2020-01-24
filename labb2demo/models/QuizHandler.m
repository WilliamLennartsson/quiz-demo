//
//  QuizHandler.m
//  labb2demo
//
//  Created by William Lennartsson on 2020-01-24.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

#import "QuizHandler.h"

@implementation QuizHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Generates questions in init so that we dont have to do it whenever we initialize our QuizHandler
        [self generateQuestions];
    }
    return self;
}

- (BOOL)rightOrWrongGuess:(NSString *)guess {
    // guess = Gul
    // correctAnswer = activeQuestion.correctAnswer
    // if guess == correctAnswer. return YES
    return [guess isEqualToString: self.activeQuestion.correctAnswer];
}

- (Quiz *)newQuiz {
    // Sending back random question from self.questions
    int randomIndex = arc4random_uniform((int)[self.questions count]);
    Quiz *q = self.questions[randomIndex];
    // Stores the selected question for easier use later.
    // Ex. when we need to check if the guess is correct
    self.activeQuestion = q;
    return q;
}

- (void)generateQuestions {
    Quiz *quiz1 = [[Quiz alloc] initWithQuestion:@"Vilken färg är månen?" correctAnswer:@"Ost" wrongAnswer1:@"Blå" wrongAnswer2:@"Grön" wrongAnswer3:@"Gul"];
    // .... create more Quiz objects and add them to the array..
    self.questions = [NSArray arrayWithObjects:quiz1, nil];
}

@end
