//
//  ViewController.swift
//  Cryptogram
//
//  Created by Nick Sagan on 06.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var key: String? { didSet { keyTextView.text = key } }
    
    @IBOutlet weak var input: UITextView!
    @IBOutlet weak var output: UITextView!
    @IBOutlet weak var keyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        key = Encryption.generateRandomHex(bytelength: 32)
    }
    
    @IBAction func encryptPressed(_ sender: UIButton) {
        guard let text = input.text else { return }
        if text == "" { return }
        if key == nil {
            output.text = "Error: key not found."
            return
        }
        
        var encryptedText: String?
        do {
            let tryToEncrypt: String? = try Encryption.encryptData(plainText: text, hexKey: keyTextView.text)
            encryptedText = tryToEncrypt
        } catch {
            encryptedText = "Incorrect key"
            print(error)
        }
        
        output.text = encryptedText
    }
    
    @IBAction func decryptPressed(_ sender: UIButton) {
        guard let text = input.text else { return }
        if text == "" { return }
        if key == nil {
            output.text = "Error: key not found."
            return
        }
        var decryptedText: String?
        do {
            let tryToDecrypt: String? = try Encryption.decryptData(hexStr: text, hexKey: keyTextView.text)
            decryptedText = tryToDecrypt
        } catch {
            decryptedText = "Incorrect key"
            print(error)
        }
        output.text = decryptedText
    }
    
    @IBAction func sendEncryptedText(_ sender: UIButton) {
    }
    
    @IBAction func sendKey(_ sender: UIButton) {
    }
    
    @IBAction func generateKey(_ sender: UIButton) {
        key = Encryption.generateRandomHex(bytelength: 32)
    }
    
}

