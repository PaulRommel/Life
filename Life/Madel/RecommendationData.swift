//
//  RecommendationData.swift
//  Life
//
//  Created by Павел Попов on 22/07/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import Foundation

enum PersonRecommendation {
    case R1, R2, R3
    
    var recommendation: String {
        switch self {
        case .R1:
            return "It is a classic example of early-onset depression. Yet, it follows a benign course so it is can be healed. You need to develop a constantly high level of autonomy and independence in order to be free from your dependencies. You should work on enriching your inner life so you could feel safe and sound inside yourself. Your issues would be addressed in a quicker and more efficient way if you decided to see a therapist. Best of luck."
        case .R2:
            return "You need to develop a more open perspective on life. Try to loosen up, set yourself free from your inner fears and complexes. Dance classes or some drama club might do the job. You should try to let go of control. Trust others a little bit more than usual. Begin to change your life at least in tiny little things. You will see how you will like it gradually. Try  to embrace the thought that quite often, there is more than one thing to do, more than one way to go. Be sure that the decision that you made was the right one at that very moment so quit thinking about it afterwords. Pursue career in Government Sector, Surgery, Finances and Banking, Law, or Education. You can see a Therapist if you have a chance, you should choose them by yourself though. Best of luck!"
        case .R3:
            return "It is advisable that you see a Therapist in order to explore your childhood. It was the time when you evolved as a person, with your personhood and gender identity. You should learn how to be mutually in love. You should not demand too much from your partner, friends, and family. It is a good thing to accept the idea that your partner is also entitled to freedom just like you. You can embrace the thought that you will always be beautiful and attractive at any age. Develop your inner world beauty. Do not ask for “Big” love right away, start small. Do not be afraid of setbacks and failure. Try to avoid merging with your partner, getting identified with them. You should fall in love with your own unique self. Eventually, it will help you to fall in love with your partner’s unique self. Do not forget that people love you because of your liveliness, open-mindedness, and mirth. Best of luck!"
        }
    }
}
