//
//  MessageComposer.swift
//  hangouts
//
//  Created by Julien Richard on 03/08/2023.
//

import SwiftUI
import MessageUI

struct MessageComposer: UIViewControllerRepresentable {
    var recipient: String
    var bodyText: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<MessageComposer>) -> MFMessageComposeViewController {
        let controller = MFMessageComposeViewController()
        controller.body = bodyText
        controller.recipients = [recipient]
        controller.messageComposeDelegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: UIViewControllerRepresentableContext<MessageComposer>) {
        // Pas besoin de mettre à jour le UIViewController ici
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        var parent: MessageComposer

        init(_ composer: MessageComposer) {
            self.parent = composer
        }

        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // Gérer le résultat ici
            controller.dismiss(animated: true)
        }
    }
}
