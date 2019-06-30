//
//  ViewController.swift
//  SystemViewControllersExample
//
//  Created by Alexander on 29/06/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController {
    let url = URL(string: "http://apple.com")!
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func actionShareTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func actionSafariTapped(_ sender: UIButton) {
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @IBAction func actionCameraTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose image source!", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default) { _ in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func actionEmailTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["a.sh.10031987@gmail.com"])
        mailComposer.setSubject("Test message")
    
        guard let imageData = imageView.image?.jpegData(compressionQuality: 0.5) else { return }
        mailComposer.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "image.jpeg")

        present(mailComposer, animated: true, completion: nil)
    }
    
    @IBAction func actionMessageTapped(_ sender: UIButton) {
        guard MFMessageComposeViewController.canSendText() else { return }
        guard MFMessageComposeViewController.canSendAttachments() else { return }
        
        let messageComposer = MFMessageComposeViewController()
        messageComposer.messageComposeDelegate = self
        
        messageComposer.recipients = ["89030409578"]
        
        guard let imageData = imageView.image?.jpegData(compressionQuality: 0.5) else { return }
        messageComposer.addAttachmentData(imageData, typeIdentifier: "image/jpeg", filename: "image.jpeg")
        
        present(messageComposer, animated: true, completion: nil)
    }
}

