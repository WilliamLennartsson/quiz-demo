//
//  Quiz.m
//  labb2demo
//
//  Created by William Lennartsson on 2020-01-24.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

- (instancetype)initWithQuestion:(NSString *)question correctAnswer:(NSString *)correctAnswer wrongAnswer1:(NSString *)wrongAnswer1 wrongAnswer2:(NSString *)wrongAnswer2 wrongAnswer3:(NSString *)wrongAnswer3 {
    self = [super init];
    if (self) {
        self.question = question;
        self.correctAnswer = correctAnswer;
        self.wrongAnswer1 = wrongAnswer1;
        self.wrongAnswer2 = wrongAnswer2;
        self.wrongAnswer3 = wrongAnswer3;
    }
    return self;
}

- (NSArray *)shuffleAnswers {
    // Array with all answers
    NSMutableArray *shuffledArray = [NSMutableArray arrayWithObjects:self.correctAnswer, self.wrongAnswer1, self.wrongAnswer2, self.wrongAnswer3, nil];
    for (int i = 0; i < 4; i++) {
        // RandomIndex based on count of answers
        int randomIndex = arc4random_uniform([shuffledArray count]);
        if (i != randomIndex) {
            // Store arr[i] in temp
            NSString *temp = shuffledArray[i];
            // arr[i] = arr[randomI]
            // Temp is used to not lose the value at arr[i]
            // At this point arr[i] === arr[randomI]
            shuffledArray[i] = shuffledArray[randomIndex];
            // arr[randomI] = temp.
            shuffledArray[randomIndex] = temp;
        }
    }
    return shuffledArray;
}

@end
