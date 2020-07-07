//
//  QuestionData.swift
//  Life
//
//  Created by Павел Попов on 12/07/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import Foundation

protocol Questionable {
    var questions: [String] { get }
    var predefinedAnswers: [[Bool]] { get }
    func getMostPredefinedAnswer(with userAnswers: [Bool]) -> PersonCharacter
}

struct FearOfRelationships: Questionable {
    let questions = ["Can you hate someone?", "Can you love someone?", "Do you want to be loved?", "Do you remember bad things?", "If you could fulfil one wish, would it be revenge?", "Do you often have dreams at night?", "Are you a Hypochondriac?", "Are you favourable to space flights?", "Do you have any personal quirk which is hard to explain?", "Do you often masturbate?", "Are you afraid of your sexual responsibilities?", "Do you feel sorry for yourself?", "Are you aggressive towards yourself?", "Do you love yourself?", "Do you feel fear in the outside world?", "Do you feel fear inside you?", "Do you get affected by others’ opinions?", "Do you trust other people?", "Are you afraid of death?", "Are you afraid of life? ", "Do you love your father?", "Do you love your mother?"]
    let predefinedAnswers = [
        [false,
         true, true,
         false, false,
         true, true,
         false, false, false,
         true, true,
         false, false, false,
         true, true, true, true, true,
         false,
         true],
        [true,
         false,
         true,
         false,
         true, true, true,
         false,
         true, true,
         false, false,
         true, true, true, true, true,
         false,
         true, true, true,
         false],
        [true, true, true, true,
        false,
        true,
        false,
        true, true, true,
        false,
        true, true, true, true,
        false,
        true, true,
        false, false,
        true, true,],
    ]
    
    func getMostPredefinedAnswer(with userAnswers: [Bool]) -> PersonCharacter {
        var maxCount = 0
        var maxCountIndex = 0
        predefinedAnswers.enumerated().forEach { (index, predefined) in
            let matchCount = zip(predefined, userAnswers).enumerated().filter() {
                $1.0 == $1.1
            }
            if matchCount.count>maxCount {
                maxCount = matchCount.count
                maxCountIndex = index
            }
            print("Index: \(index), matchCount: \(matchCount.count)" )
        }
        print("maxMatched: \(maxCount), maxIndex: \(maxCountIndex)" )
        if maxCountIndex == 0 {
            return .CQ1
        } else if maxCountIndex == 1 {
            return .CQ2
        } else {
            return .CQ3
        }
    }
    
}

struct QuestionFactory {
    
    static func getQuestionable(for selected: String) -> Questionable? {
        switch selected {
        case "Fear of Relationships":
            return FearOfRelationships()
        default:
            return nil
        }
    }
    
}

//Это сделано норм, удобно
enum PersonCharacter {
    case CQ1, CQ2, CQ3
    
    var diagnosis: String {
        switch self {
        case .CQ1:
            return "You show early signs of depression.  You seek close contacts that are based on trust. You have a great wish to love and be loved. It has already made you dependent on you friends and family. Your relationships with them can be described as “I need you because I love you” and “I love you because I need you”. You are afraid of being left alone, neglected, and forgotten. You feel desperate sometimes."
        case .CQ2:
            return "Most likely, you are afraid of risks, changes, time. You fear death and have a secret desire to become immortal. You are attached to old things and environment. It is possible that you are an avid collector of some items or artefacts. You need some guarantee of eternity and immortality. You are conservative and excessively principled sometimes. You have a lot of prejudices and biases. You cannot stand people who question your beliefs. Very often, new discoveries and theories look like mistakes and even outright deception to you. “Times are changing and we are changing with them,” - this one is not about you. At times, you become obsessed by a peculiar idea which sometimes leads to irresistible actions. You seek power and knowledge in order to avoid unanticipated situations. You lack audacity and always doubt everything. You are obsessed with sexual thoughts that, you think, are dirty as well as sexual motives. You can feel fear and guilt after masturbation. You act tentatively with your sexual partners because you consider sexuality as a disgraceful (“dirty”) and perverse feeling."
        case .CQ3:
            return "You love freedom and strive for changes. You are fond of novelty. You are fond of risk. You look for opportunities to build your best future. You do not like to live by the book, you evade responsibilities. You do not want to be tied to anything. Past is not something you care about. You always try to live in the present, seize the day and grab the moment. You can picture yourself in another body or as the opposite gender. You are fond of costume parties where you can choose whichever age, character, and sex you want. You depend on your desires and strive to keep your youth. You do not want to know what is bad and what is wrong. You are often unpredictable so others hardly understand you. You love playing different roles as the situation demands. Erotic games and foreplay are frequently more important for you than fulfilling your sexual desires. This might lead towards frigidity and sexual disfunction if you have unclear gender identity."
        }
    }
    
    var recommendation: String {
        switch self {
        case .CQ1:
            return "It is a classic example of early-onset depression. Yet, it follows a benign course so it is can be healed. You need to develop a constantly high level of autonomy and independence in order to be free from your dependencies. You should work on enriching your inner life so you could feel safe and sound inside yourself. Your issues would be addressed in a quicker and more efficient way if you decided to see a therapist. Best of luck."
        case .CQ2:
            return "You need to develop a more open perspective on life. Try to loosen up, set yourself free from your inner fears and complexes. Dance classes or some drama club might do the job. You should try to let go of control. Trust others a little bit more than usual. Begin to change your life at least in tiny little things. You will see how you will like it gradually. Try  to embrace the thought that quite often, there is more than one thing to do, more than one way to go. Be sure that the decision that you made was the right one at that very moment so quit thinking about it afterwords. Pursue career in Government Sector, Surgery, Finances and Banking, Law, or Education. You can see a Therapist if you have a chance, you should choose them by yourself though. Best of luck!"
        case .CQ3:
            return "It is advisable that you see a Therapist in order to explore your childhood. It was the time when you evolved as a person, with your personhood and gender identity. You should learn how to be mutually in love. You should not demand too much from your partner, friends, and family. It is a good thing to accept the idea that your partner is also entitled to freedom just like you. You can embrace the thought that you will always be beautiful and attractive at any age. Develop your inner world beauty. Do not ask for “Big” love right away, start small. Do not be afraid of setbacks and failure. Try to avoid merging with your partner, getting identified with them. You should fall in love with your own unique self. Eventually, it will help you to fall in love with your partner’s unique self. Do not forget that people love you because of your liveliness, open-mindedness, and mirth. Best of luck!"
        }
    }
    
}

//Bad Model - Всю работу с моделями и датой нужно держать внутри

//var questions: [Question] = [
//
//    //1
//    Question(text: "Can you hate someone?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //2
//    Question(text: "Can you love someone?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ2),
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ3)]),
//    //3
//    Question(text: "Do you want to be loved?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //4
//    Question(text: "Do you remember bad things?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "No", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //5
//    Question(text: "If you could fulfil one wish, would it be revenge?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "No", type: .CQ3)]),
//    //6
//    Question(text: "Do you often have dreams at night?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //7
//    Question(text: "Are you a Hypochondriac?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "No", type: .CQ3)]),
//    //8
//    Question(text: "Are you favourable to space flights?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "No", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //9
//    Question(text: "Do you have any personal quirk which is hard to explain?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //10
//    Question(text: "Do you often masturbate?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //11
//    Question(text: "Are you afraid of your sexual responsibilities?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "No", type: .CQ2),
//        Answer(text: "No", type: .CQ3)]),
//    //12
//    Question(text: "Do you feel sorry for yourself?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "No", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //13
//    Question(text: "Are you aggressive towards yourself?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //14
//    Question(text: "Do you love yourself?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //15
//    Question(text: "Do you feel fear in the outside world?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //16
//    Question(text: "Do you feel fear inside you?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "No", type: .CQ3)]),
//    //17
//    Question(text: "Do you get affected by others’ opinions?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //18
//    Question(text: "Do you trust other people?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "No", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //19
//    Question(text: "Are you afraid of death?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "No", type: .CQ3)]),
//    //20
//    Question(text: "Are you afraid of life? ", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "No", type: .CQ3)]),
//    //21
//    Question(text: "Do you love your father?", responseType: .single, answers: [
//        Answer(text: "No", type: .CQ1),
//        Answer(text: "Yes", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)]),
//    //22
//    Question(text: "Do you love your mother?", responseType: .single, answers: [
//        Answer(text: "Yes", type: .CQ1),
//        Answer(text: "No", type: .CQ2),
//        Answer(text: "Yes", type: .CQ3)])
//]

struct Question {
    var text: String
    var responseType: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single
}

struct Answer {
    var text: String
    var type: PersonCharacter
}

//Altaria: others > self, Blissy: sensitive to others feelings, Zygaarde: protector of ecosystem, Bronzon: people think you're a diety

