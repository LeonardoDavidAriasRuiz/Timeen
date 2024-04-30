//
//  TestType.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import SwiftUI

enum TestType: String, Codable {
    case error
    case synonym
    case antonym
    case translation
    case complete
    case conjugation
    case phrasalVerbs
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeString = try container.decode(String.self)
        self = TestType(rawValue: typeString) ?? .error
    }
    
    var title: String {
        switch self {
            case .error: return "Error"
            case .synonym: return "Sinónimos"
            case .antonym: return "Antónimos"
            case .translation: return "Traduce"
            case .complete: return "Completa"
            case .conjugation: return  "Conjuga"
            case .phrasalVerbs: return "Phrasal Verbs"
        }
    }
    
    var toRecordValue: Int {
        switch self {
            case .error: return 0
            case .synonym: return 1
            case .antonym: return 2
            case .translation: return 3
            case .complete: return 4
            case .conjugation: return 5
            case .phrasalVerbs: return 6
        }
    }
    
    var lottieIconName: String {
        switch self {
            case .error: return "ErrorDot"
            case .synonym: return "Balance"
            case .antonym: return "NegativeSymbol"
            case .translation: return "Book"
            case .complete: return "PaperBoat"
            case .conjugation: return "Clock"
            case .phrasalVerbs: return "LavaLamp"
        }
    }
    var lottieIconColoredName: String {
        switch self {
            case .error: return "ErrorDot"
            case .synonym: return "BalanceColored"
            case .antonym: return "NegativeSymbolColored"
            case .translation: return "BookColored"
            case .complete: return "PaperBoatColored"
            case .conjugation: return "ClockColored"
            case .phrasalVerbs: return "LavaLampColored"
        }
    }
    
    var color: Color {
        switch self {
            case .error: return Color.red
            case .synonym: return Color(.yellow)
            case .antonym: return Color(.red)
            case .translation: return Color(.blueGreen)
            case .complete: return Color(.blue)
            case .conjugation: return Color(.green)
            case .phrasalVerbs: return Color(.orange)
        }
    }
    
    var darColor: Color {
        switch self {
            case .error: return Color.black
            case .synonym: return Color(.darkYellow)
            case .antonym: return Color(.darkRed)
            case .translation: return Color(.darkBlueGreen)
            case .complete: return Color(.darkBlue)
            case .conjugation: return Color(.darkGreen)
            case .phrasalVerbs: return Color(.darkOrange)
        }
    }
    
    var testTime: Double {
        switch self {
            case .error: return 0
            case .synonym: return 60
            case .antonym: return 60
            case .translation: return 60
            case .complete: return 90
            case .conjugation: return 90
            case .phrasalVerbs: return 60
        }
    }
    
    var descriptionForRequest: String {
        switch self {
            case .error: return ""
            case .synonym: return """
                Como me lo debes de dar es de sinónimos
                Es un sentence y 4 opciones
                Solo una debe de ser la correcta
                El orden de las 4 debe de ser aleatorio
                Osea que la respuesta correcta puede estar en cualquier posicion
                Ejemplo:
                {
                    "number" : 0,
                    "testType": "synonym",
                    "questions": [
                        {
                            "number" : 1,
                            "sentence": "Bad",
                            "options": [
                                {"sentence": "Around", "isRight" : false},
                                {"sentence": "Wrong", "isRight" : true},
                                {"sentence": "Off", "isRight" : false},
                                {"sentence": "Under", "isRight" : false}
                            ]
                        },
                        {
                            "number" : 2,
                            "sentence": "Good",
                            "options": [
                                {"sentence": "Bad", "isRight" : false},
                                {"sentence": "Right", "isRight" : true},
                                {"sentence": "Salty", "isRight" : false},
                                {"sentence": "Hight", "isRight" : false}
                            ]
                        }
                    ]
                }
                """
            case .antonym: return """
                Como me lo debes de dar es de antónimos
                Es un sentence y 4 opciones
                Solo una debe de ser la correcta
                El orden de las 4 debe de ser aleatorio
                Osea que la respuesta correcta puede estar en cualquier posicion
                Ejemplo:
                {
                    "number" : 0,
                    "testType": "antonym",
                    "questions": [
                        {
                            "number" : 1,
                            "sentence": "Open",
                            "options": [
                                {"sentence": "Around", "isRight" : false},
                                {"sentence": "Close", "isRight" : true},
                                {"sentence": "Off", "isRight" : false},
                                {"sentence": "Under", "isRight" : false}
                            ]
                        },
                        {
                            "number" : 2,
                            "sentence": "Good",
                            "options": [
                                {"sentence": "Bad", "isRight" : true},
                                {"sentence": "Right", "isRight" : false},
                                {"sentence": "Fine", "isRight" : false},
                                {"sentence": "Salty", "isRight" : false}
                            ]
                        }
                    ]
                }
                """
            case .translation: return """
                Como me lo debes de dar es de traducciones
                Es un sentence y 4 opciones
                Solo una debe de ser la correcta
                El orden de las 4 debe de ser aleatorio
                Osea que la respuesta correcta puede estar en cualquier posicion
                Ejemplo:
                {
                    "number" : 0,
                    "testType": "translation",
                    "questions": [
                        {
                            "number" : 1,
                            "sentence": "Close",
                            "options": [
                                {"sentence": "Abierto", "isRight" : false},
                                {"sentence": "Cerrado", "isRight" : true},
                                {"sentence": "Al lado", "isRight" : false},
                                {"sentence": "Arriba", "isRight" : false}
                            ]
                        },
                        {
                            "number" : 2,
                            "sentence": "Malo",
                            "options": [
                                {"sentence": "Bad", "isRight" : true},
                                {"sentence": "Right", "isRight" : false},
                                {"sentence": "Fine", "isRight" : false},
                                {"sentence": "Salty", "isRight" : false}
                            ]
                        }
                    ]
                }
                """
            case .complete: return """
                Como me lo debes de dar es de completar la frase
                Es un sentence y 4 opciones
                Solo una debe de ser la correcta
                El orden de las 4 debe de ser aleatorio
                Osea que la respuesta correcta puede estar en cualquier posicion
                Ejemplo:
                {
                    "number" : 0,
                    "testType": "complete",
                    "questions": [
                        {
                            "number" : 1,
                            "sentence": "I am _ the guitar.",
                            "options": [
                                {"sentence": "Breaking", "isRight" : false},
                                {"sentence": "Playing", "isRight" : true},
                                {"sentence": "Played", "isRight" : false},
                                {"sentence": "Touching", "isRight" : false}
                            ]
                        },
                        {
                            "number" : 2,
                            "sentence": "I _ to the movies yesterday.",
                            "options": [
                                {"sentence": "Went", "isRight" : true},
                                {"sentence": "Go", "isRight" : false},
                                {"sentence": "Play", "isRight" : false},
                                {"sentence": "Get", "isRight" : false}
                            ]
                        }
                    ]
                }
                """
            case .conjugation: return """
                Como me lo debes de dar es de conjugaciones
                Es un sentence y 4 opciones
                Solo una debe de ser la correcta
                El orden de las 4 debe de ser aleatorio
                Osea que la respuesta correcta puede estar en cualquier posicion
                Ejemplo:
                {
                    "number" : 0,
                    "testType": "conjugation",
                    "questions": [
                        {
                            "number" : 1,
                            "sentence": "Past fot: Open",
                            "options": [
                                {"sentence": "Opening", "isRight" : false},
                                {"sentence": "Opened", "isRight" : true},
                                {"sentence": "Closing", "isRight" : false},
                                {"sentence": "Not closed", "isRight" : false}
                            ]
                        },
                        {
                            "number" : 2,
                            "sentence": "Present continuous for: Dance",
                            "options": [
                                {"sentence": "Dancing", "isRight" : true},
                                {"sentence": "Danced", "isRight" : false},
                                {"sentence": "Dance", "isRight" : false},
                                {"sentence": "Moving", "isRight" : false}
                            ]
                        }
                    ]
                }
                """
            case .phrasalVerbs: return """
                Como me lo debes de dar es de phrasalVerbs
                en "testType" tienen que ser exactamente así: "phrasalVerbs"
                
                Es un sentence y 4 opciones
                Solo una debe de ser la correcta
                El orden de las 4 debe de ser aleatorio
                Osea que la respuesta correcta puede estar en cualquier posición
                Ejemplo:
                {
                    "number" : 0,
                    "testType": "phrasalVerbs",
                    "questions": [
                        {
                            "number" : 1,
                            "sentence": "Give up",
                            "options": [
                                {"sentence": "Dar", "isRight" : false},
                                {"sentence": "Rendirse", "isRight" : true},
                                {"sentence": "Aventar", "isRight" : false},
                                {"sentence": "Saltar", "isRight" : false}
                            ]
                        },
                        {
                            "number" : 2,
                            "sentence": "Turn off",
                            "options": [
                                {"sentence": "Voltear", "isRight" : true},
                                {"sentence": "Apagar", "isRight" : false},
                                {"sentence": "Cambiar", "isRight" : false},
                                {"sentence": "Sostener", "isRight" : false}
                            ]
                        }
                    ]
                }
                """
        }
    }
    
    static var all: [TestType] {
        return [
            .synonym,
            .antonym,
            .translation,
            .complete,
            .conjugation,
            .phrasalVerbs
        ]
    }
    
    static func fromRecordValue(_ value: Int) -> Self {
        switch value {
            case 0: return .error
            case 1: return .synonym
            case 2: return .antonym
            case 3: return .translation
            case 4: return .complete
            case 5: return .conjugation
            case 6: return .phrasalVerbs
            default: return .error
        }
    }
}
