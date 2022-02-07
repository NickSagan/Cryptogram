//
//  MainView.swift
//  Cryptogram
//
//  Created by Nick Sagan on 07.02.2022.
//

import UIKit

class MainView: UIView {
    
    var inputLabel: UILabel = {
        let label = UILabel()
        label.text = "Input:"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    var outputLabel: UILabel = {
        let label = UILabel()
        label.text = "Output:"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    var keyLabel: UILabel = {
        let label = UILabel()
        label.text = "Key:"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    var input: UITextView = {
        let txt = UITextView()
        txt.text = "Paste the text you want to encrypt or decrypt here"
        txt.layer.borderColor = CGColor(gray: 100, alpha: 1)
        txt.layer.borderWidth = 1.0
        txt.layer.cornerRadius = 5.0
        return txt
    }()
    
    var output: UITextView = {
        let txt = UITextView()
        txt.text = "The decrypted or encrypted text will appear here"
        txt.layer.borderColor = CGColor(gray: 100, alpha: 1)
        txt.layer.borderWidth = 1.0
        txt.layer.cornerRadius = 5.0
        return txt
    }()
    
    var keyTextView: UITextView = {
        let txt = UITextView()
        txt.text = "Paste your key here"
        txt.layer.borderColor = CGColor(gray: 100, alpha: 1)
        txt.layer.borderWidth = 1.0
        txt.layer.cornerRadius = 5.0
        return txt
    }()
    
    var encrypt: UIButton = {
        let btn = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        btn.configuration = config
        btn.setTitle("Encrypt", for: .normal)
        return btn
    }()
    
    var decrypt: UIButton = {
        let btn = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        btn.configuration = config
        btn.setTitle("Decrypt", for: .normal)
        return btn
    }()
    
//    var stackView: UIStackView {
//        let sw = UIStackView()
//        sw.axis = NSLayoutConstraint.Axis.horizontal
//        sw.distribution = UIStackView.Distribution.fillEqually
//        sw.alignment = UIStackView.Alignment.center
//        sw.spacing = 15
//        sw.addArrangedSubview(encrypt)
//        sw.addArrangedSubview(decrypt)
//        sw.translatesAutoresizingMaskIntoConstraints = false
//        return sw
//    }
    
    var sendText: UIButton = {
        let btn = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        btn.configuration = config
        btn.setTitle("Send text", for: .normal)
        return btn
    }()
    
    var sendKey: UIButton = {
        let btn = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        btn.configuration = config
        btn.setTitle("Send key", for: .normal)
        return btn
    }()
    
    var generateRandomKey: UIButton = {
        let btn = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        btn.configuration = config
        btn.setTitle("Random key", for: .normal)
        return btn
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func setUp() {
        let margin = self.layoutMarginsGuide
        
        self.addSubview(inputLabel)
        self.addSubview(outputLabel)
        self.addSubview(keyLabel)
        self.addSubview(input)
        self.addSubview(output)
        self.addSubview(keyTextView)
        
        self.addSubview(encrypt)
        self.addSubview(decrypt)
        
        self.addSubview(sendText)
        self.addSubview(sendKey)
        self.addSubview(generateRandomKey)
        
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        keyLabel.translatesAutoresizingMaskIntoConstraints = false
        input.translatesAutoresizingMaskIntoConstraints = false
        output.translatesAutoresizingMaskIntoConstraints = false
        keyTextView.translatesAutoresizingMaskIntoConstraints = false
        encrypt.translatesAutoresizingMaskIntoConstraints = false
        decrypt.translatesAutoresizingMaskIntoConstraints = false
        sendText.translatesAutoresizingMaskIntoConstraints = false
        sendKey.translatesAutoresizingMaskIntoConstraints = false
        generateRandomKey.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints: [NSLayoutConstraint] = [
            inputLabel.topAnchor.constraint(equalTo: margin.topAnchor),
            inputLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            
            input.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 10),
            input.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.3),
            input.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            input.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            
            keyLabel.topAnchor.constraint(equalTo: input.bottomAnchor, constant: 10),
            keyLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            
            keyTextView.topAnchor.constraint(equalTo: keyLabel.bottomAnchor, constant: 10),
            keyTextView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            keyTextView.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.05),
            
            generateRandomKey.topAnchor.constraint(equalTo: keyLabel.bottomAnchor, constant: 10),
            generateRandomKey.leadingAnchor.constraint(equalTo: keyTextView.trailingAnchor, constant: 20),
            generateRandomKey.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            
            encrypt.topAnchor.constraint(equalTo: keyTextView.bottomAnchor, constant: 15),
            encrypt.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 50),
            
            decrypt.topAnchor.constraint(equalTo: keyTextView.bottomAnchor, constant: 15),
            decrypt.leadingAnchor.constraint(equalTo: encrypt.trailingAnchor, constant: 20),
            decrypt.widthAnchor.constraint(equalTo: encrypt.widthAnchor),
            decrypt.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -50),
            
            outputLabel.topAnchor.constraint(equalTo: encrypt.bottomAnchor, constant: 10),
            outputLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            
            output.topAnchor.constraint(equalTo: outputLabel.bottomAnchor, constant: 10),
            output.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 0.3),
            output.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            output.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            
            sendText.topAnchor.constraint(greaterThanOrEqualTo: output.bottomAnchor, constant: 10),
            sendText.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 50),
            sendText.bottomAnchor.constraint(equalTo: margin.bottomAnchor),
            
            sendKey.topAnchor.constraint(greaterThanOrEqualTo: output.bottomAnchor, constant: 10),
            sendKey.leadingAnchor.constraint(equalTo: sendText.trailingAnchor, constant: 20),
            sendKey.widthAnchor.constraint(equalTo: sendText.widthAnchor),
            sendKey.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -50),
            sendKey.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
