//
//  ViewController+MFMessageComposeViewControllerDelegate.swift
//  SystemViewControllersExample
//
//  Created by Alexander on 30/06/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import MessageUI

extension ViewController : MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
}
