//
//  ViewController.swift
//  Drum mixer
//
//  Created by Shivam Kumar on 18/09/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    var recordButton : UIButton!
    var recordingSession : AVAudioSession!
    var audioRecorder : AVAudioRecorder!
    
    
    private let verticalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let horizontalStackView1 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 2
        stackView.autoresizesSubviews = true
        return stackView
    }()
    
    private let horizontalStackView2 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 2
        stackView.autoresizesSubviews = true
        return stackView
    }()
    
    private let horizontalStackView3 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 2
        stackView.autoresizesSubviews = true
        return stackView
    }()
    
    private let horizontalStackView4 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 2
        stackView.autoresizesSubviews = true
        return stackView
    }()
    
    private let recordingButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage( UIImage(systemName: "play"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        
//        recordingSession = AVAudioSession.sharedInstance()
//        
//        do {
//            try recordingSession.setCategory(.playAndRecord, mode: .default)
//            try recordingSession.setActive(true)
//            recordingSession.requestRecordPermission(){ [unowned self] allowed in
//                DispatchQueue.main.async{
//                    if allowed {
//                        self.loadRecordingUI()
//                    }
//                    else{
//                        let alert = UIAlertView(title: "Permission Denied", message: "You need to allow access to your microphone to record audio.", delegate: nil, cancelButtonTitle: "OK")
//                        
//                    }
//                }
//            }
//        }catch{
//            print("Failed to record")
//        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createViews(){
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView1)
        verticalStackView.addArrangedSubview(horizontalStackView2)
        verticalStackView.addArrangedSubview(horizontalStackView3)
        verticalStackView.addArrangedSubview(horizontalStackView4)
        
        let image1 = UIImage(named: "image1")
        let image2 = UIImage(named: "image2")
        let image3 = UIImage(named: "image3")
        let image4 = UIImage(named: "image4")
        
        let buttonA1 = createSquareButton(image : image1, title : "A")
        let buttonB1 = createSquareButton(image : image3, title : "B")
        let buttonC1 = createSquareButton(image : image2, title : "C")
        let buttonD1 = createSquareButton(image : image4, title : "D")
        
        horizontalStackView1.addArrangedSubview(buttonA1)
        horizontalStackView1.addArrangedSubview(buttonB1)
        horizontalStackView1.addArrangedSubview(buttonC1)
        horizontalStackView1.addArrangedSubview(buttonD1)
        
        let buttonA2 = createSquareButton(image: image1, title: "E")
        let buttonB2 = createSquareButton(image: image4, title: "F")
        let buttonC2 = createSquareButton(image: image3, title: "G")
        let buttonD2 = createSquareButton(image: image2, title: "H")
        
        horizontalStackView2.addArrangedSubview(buttonA2)
        horizontalStackView2.addArrangedSubview(buttonB2)
        horizontalStackView2.addArrangedSubview(buttonC2)
        horizontalStackView2.addArrangedSubview(buttonD2)
        
        let buttonA3 = createSquareButton(image: image4, title: "J")
        let buttonB3 = createSquareButton(image: image1, title: "K")
        let buttonC3 = createSquareButton(image: image2, title: "L")
        let buttonD3 = createSquareButton(image: image3, title: "M")
        
        horizontalStackView3.addArrangedSubview(buttonA3)
        horizontalStackView3.addArrangedSubview(buttonB3)
        horizontalStackView3.addArrangedSubview(buttonC3)
        horizontalStackView3.addArrangedSubview(buttonD3)
        
        let buttonA4 = createSquareButton(image: image4, title: "N")
        let buttonB4 = createSquareButton(image: image3, title: "O")
        let buttonC4 = createSquareButton(image: image2, title: "P")
        let buttonD4 = createSquareButton(image: image1, title: "Q")
        
        horizontalStackView4.addArrangedSubview(buttonA4)
        horizontalStackView4.addArrangedSubview(buttonB4)
        horizontalStackView4.addArrangedSubview(buttonC4)
        horizontalStackView4.addArrangedSubview(buttonD4)
        
        
        let verticalStackViewConstratints : [NSLayoutConstraint] = [
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -5),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -40),
        ]
        
        NSLayoutConstraint.activate(verticalStackViewConstratints)
        
        func createSquareButton(image: UIImage?, title: String) -> UIButton {
            let button = UIButton(type: .custom)
            button.setBackgroundImage(image, for: .normal)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 25)
            button.setTitleColor(.black, for: .normal)
            button.widthAnchor.constraint(equalToConstant: 100).isActive = true
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.layer.cornerRadius = 20
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
            return button
        }
    }
   
    var players : [UIButton : AVAudioPlayer] = [:]
    
    @objc func playSound(_ sender : UIButton){
        if let player = players[sender] , player.isPlaying {
            sender.alpha = 1
            player.stop()
            players[sender] = nil
        }
        else{
            var type : String
            switch sender.currentTitle {
            case "A": type = "wav"
            case "B": type = "wav"
            case "C": type = "wav"
            case "D": type = "wav"
            case "F": type = "wav"
            case "G": type = "wav"
            case "H": type = "wav"
            case "L": type = "wav"
            default :
                type = "mp3"
            }
            guard let url = Bundle.main.path(forResource: sender.currentTitle, ofType: type) else {return}
            do{
                let newPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
                players[sender] = newPlayer
                sender.alpha = 0.5
                newPlayer.prepareToPlay()
                newPlayer.play()
                newPlayer.numberOfLoops = -1
            }catch {
                print("Error playing sound : \(error)")
            }
        }
      
    }

    
    
}

