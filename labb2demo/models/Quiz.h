//
//  Quiz.h
//  labb2demo
//
//  Created by William Lennartsson on 2020-01-24.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Quiz : NSObject
// fråga
@property (nonatomic) NSString *question;
// fel svar x 3
@property (nonatomic) NSString *wrongAnswer1;
@property (nonatomic) NSString *wrongAnswer2;
@property (nonatomic) NSString *wrongAnswer3;
// rätt svar
@property (nonatomic) NSString *correctAnswer;

- (instancetype) initWithQuestion: (NSString*)question correctAnswer: (NSString*)correctAnswer
    wrongAnswer1: (NSString*)wrongAnswer1
    wrongAnswer2: (NSString*)wrongAnswer2
    wrongAnswer3: (NSString*)wrongAnswer3;

- (NSArray*) shuffleAnswers;

@end

NS_ASSUME_NONNULL_END
