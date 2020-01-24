//
//  QuizHandler.h
//  labb2demo
//
//  Created by William Lennartsson on 2020-01-24.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quiz.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuizHandler : NSObject
// Alla frågor
@property (nonatomic) NSArray *questions;
// Aktiv fråga
@property (nonatomic) Quiz *activeQuestion;
// Poäng
@property (nonatomic) int score;
// Skapa upp alla frågor
- (void) generateQuestions;
// Om det är rätt eller fel
- (BOOL) rightOrWrongGuess :(NSString*)guess;
// Kolla om man har vunnit
//- (BOOL) didWinGame: (int)score;
// Nytt quiz
- (Quiz*) newQuiz;
@end

NS_ASSUME_NONNULL_END
