//
//  ViewController+MFMailComposeViewControllerDelegate.swift
//  SystemViewControllersExample
//
//  Created by Alexander on 30/06/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit
import MessageUI

extension ViewController : MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
}
