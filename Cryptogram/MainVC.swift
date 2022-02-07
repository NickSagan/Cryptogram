//
//  MainVC.swift
//  Cryptogram
//
//  Created by Nick Sagan on 07.02.2022.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = MainView(frame: view.frame)
        view.addSubview(mainView)
        
        // Tap recognizer to dismiss keyboard
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureReconizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureReconizer)
    }
    
    // Dismiss keyboard
    @objc func tap(sender: UITapGestureRecognizer) {
     view.endEditing(true)
    }
   


    //MARK: - FUNCS
//
//    var key: String? { didSet { keyTextView.text = key } }
//
//    func encryptPressed(_ sender: UIButton) {
//        guard let text = input.text else { return }
//        if text == "" { return }
//        if key == nil {
//            output.text = "Error: key not found."
//            return
//        }
//
//        var encryptedText: String?
//        do {
//            let tryToEncrypt: String? = try Encryption.encryptData(plainText: text, hexKey: keyTextView.text)
//            encryptedText = tryToEncrypt
//        } catch {
//            encryptedText = "Incorrect key"
//            print(error)
//        }
//
//        output.text = encryptedText
//    }
//
//    func decryptPressed(_ sender: UIButton) {
//        guard let text = input.text else { return }
//        if text == "" { return }
//        if key == nil {
//            output.text = "Error: key not found."
//            return
//        }
//        var decryptedText: String?
//        do {
//            let tryToDecrypt: String? = try Encryption.decryptData(hexStr: text, hexKey: keyTextView.text)
//            decryptedText = tryToDecrypt
//        } catch {
//            decryptedText = "Incorrect key"
//            print(error)
//        }
//        output.text = decryptedText
//    }
//
//    func sendEncryptedText(_ sender: UIButton) {
//    }
//
//    func sendKey(_ sender: UIButton) {
//    }
//
//    func generateKey(_ sender: UIButton) {
//        //key = Encryption.generateRandomHex(bytelength: 32)
//    }
    
}
