//
//  MailCore2Server.swift
//  Timeen
//
//  Created by Leonardo on 25/02/24.
//

import Foundation
import MailCore
import Network
import UIKit
import MessageUI

struct MailCore2Server {
    private let fromName = "Timeen"
    private let fromEmail = "alineapplication@icloud.com"
    private let hostname = "smtp.mail.me.com"
    private let port: UInt32 = 587
    private let password = "ruiy-bnjj-czox-fkcc"
    private let connectionType: MCOConnectionType = .startTLS
    
    
    func send(emailType: EmailType) async -> Result<Void, Error> {
//        let builder = MCOMessageBuilder()
//        builder.header.to = [MCOAddress(displayName: emailType.accountName, mailbox: emailType.accountEmail)!]
//        builder.header.from = MCOAddress(displayName: fromName, mailbox: fromEmail)
//        builder.header.subject = emailType.subject
//        
//        let smtpSession = MCOSMTPSession()
//        smtpSession.hostname = hostname
//        smtpSession.port = port
//        smtpSession.username = fromEmail
//        smtpSession.password = password
//        smtpSession.connectionType = connectionType
//        
//        do {
//            builder.htmlBody = try emailType.body()
//            let data = builder.data()!
//            let operation = smtpSession.sendOperation(with: data)!
//            try await operation.start()
//            return .success(Void())
//        } catch {
//            return .failure(error)
//        }
        return .success(Void())
    }
}
