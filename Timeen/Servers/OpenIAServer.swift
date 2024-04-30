//
//  OpenIAServer.swift
//  Timeen
//
//  Created by Leonardo on 07/03/24.
//

import Foundation
import Alamofire

struct OpenIAServer {
    private let baseUrl = "https://api.openai.com/v1/chat/completions"
    private let openAIAPIKey = ""
    
    func sendMessage(body: OpenAICompletionsBody) async -> Result<ChatCompletion, AFError> {
        let headers: HTTPHeaders = ["Authorization": "Bearer \(openAIAPIKey)"]
        let request = AF.request(baseUrl, method: .post, parameters: body, encoder: .json, headers: headers)
        
        return await request.serializingDecodable(ChatCompletion.self).result
    }
}

struct OpenAICompletionsBody: Codable {
    var model: String = "gpt-3.5-turbo"
    var messages: [Message]
    var temperature: Float? = 0.7
}

struct Message: Codable, Hashable {
    var role: String
    var content: String
}

struct Choice: Codable {
    var index: Int
    var message: Message
    var logprobs: String?
    var finish_reason: String
}

struct Usage: Codable {
    var prompt_tokens: Int
    var completion_tokens: Int
    var total_tokens: Int
}

struct ChatCompletion: Codable {
    var id: String
    var object: String
    var created: Int
    var model: String
    var choices: [Choice]
    var usage: Usage
    var system_fingerprint: String?
}
