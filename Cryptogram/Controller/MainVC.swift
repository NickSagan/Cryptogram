//
//  MainVC.swift
//  Cryptogram
//
//  Created by Nick Sagan on 07.02.2022.
//

import UIKit

class MainVC: UIViewController {
    
    var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = MainView(frame: view.frame)
        view.addSubview(mainView)
        
        mainView.generateRandomKey.addTarget(self, action: #selector(keyGen), for: .touchUpInside)
        mainView.sendKey.addTarget(self, action: #selector(sendKey), for: .touchUpInside)
        mainView.sendText.addTarget(self, action: #selector(sendText), for: .touchUpInside)
        mainView.encrypt.addTarget(self, action: #selector(encryptText), for: .touchUpInside)
        mainView.decrypt.addTarget(self, action: #selector(decryptText), for: .touchUpInside)
        
        mainView.keyTextView.text = Encryption.generateRandomHex(bytelength: 32)
        
        // Tap recognizer to dismiss keyboard
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureReconizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureReconizer)
    }
    
    // Dismiss keyboard
    @objc func tap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyGen() {
        mainView.keyTextView.text = Encryption.generateRandomHex(bytelength: 32)
    }
    
    @objc func encryptText() {
        guard let text = mainView.input.text else { return }
        if text == "" { return }
        guard let key = mainView.keyTextView.text else { return }
        if key == "" {
            mainView.output.text = "Error: key not found."
            return
        }
        
        var encryptedText: String?
        do {
            let tryToEncrypt: String? = try Encryption.encryptData(plainText: text, hexKey: key)
            encryptedText = tryToEncrypt
        } catch {
            encryptedText = "Incorrect key"
            print(error)
        }
        
        mainView.output.text = encryptedText
    }
    
    @objc func decryptText() {
        guard let text = mainView.input.text else { return }
        if text == "" { return }
        guard let key = mainView.keyTextView.text else { return }
        if key == "" {
            mainView.output.text = "Error: key not found."
            return
        }
        
        var decryptedText: String?
        do {
            let tryToDecrypt: String? = try Encryption.decryptData(hexStr: text, hexKey: key)
            decryptedText = tryToDecrypt
        } catch {
            decryptedText = "Incorrect key"
            print(error)
        }
        mainView.output.text = decryptedText
    }
    
    @objc func sendKey() {
        print("Yes")
    }
    
    @objc func sendText() {
        print("Yes")
    }
}
