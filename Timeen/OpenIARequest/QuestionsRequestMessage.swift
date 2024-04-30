//
//  QuestionsRequestMessages.swift
//  Timeen
//
//  Created by Leonardo on 09/03/24.
//

import Foundation

struct QuestionsRequestMessage {
    static func request(testType: TestType, account: Account) -> Message {
        return Message(role: "user", content:
            """
            Esto es una aplicación para la práctica de ingles,
            tu me vas a proporcionar un Test,
            éste va a tener el formato en json, me tienes que dar de 8 casos o sentences a 12,
            
            Las temáticas de lo que me los tienes que dar es de:
            \(account.themes.map({ theme in
            return theme.title + ", "
            }))
            No necesariamente tienen que ser las palabras de las temáticas,
            sino que me des palabras relacionadas a esas temáticas.
            
            El nivel de ingles es:  \(account.englishLevel.name)
            Asegúrate de que si sea una nivel adecuado para el del usuario.
            Si es avanzado no pongas cosas tan básicas.
            
            \(testType.descriptionForRequest)
            """
        )
    }
}
