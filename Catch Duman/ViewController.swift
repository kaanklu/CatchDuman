

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var counter = 10
    var dumanArray = [UIImageView]()
    var dumantimer = Timer()
    var highestScore: Int = 0
    
    
    
    
    
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    @IBOutlet weak var photo7: UIImageView!
    @IBOutlet weak var photo8: UIImageView!
    @IBOutlet weak var photo9: UIImageView!
    
    @IBOutlet weak var scoreboardLabel: UILabel!
    @IBOutlet weak var highestscoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedHighScore = UserDefaults.standard.object(forKey: "hs")
        highestscoreLabel.text = "Highest Score : \(storedHighScore!)"
        
        
        
        photo1.isUserInteractionEnabled=true
        photo2.isUserInteractionEnabled=true
        photo3.isUserInteractionEnabled=true
        photo4.isUserInteractionEnabled=true
        photo5.isUserInteractionEnabled=true
        photo6.isUserInteractionEnabled=true
        photo7.isUserInteractionEnabled=true
        photo8.isUserInteractionEnabled=true
        photo9.isUserInteractionEnabled=true
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture6 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture7 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture8 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        let gesture9 = UITapGestureRecognizer(target: self, action: #selector(skoruarttir))
        
        
        photo1.addGestureRecognizer(gesture1)
        photo2.addGestureRecognizer(gesture2)
        photo3.addGestureRecognizer(gesture3)
        photo4.addGestureRecognizer(gesture4)
        photo5.addGestureRecognizer(gesture5)
        photo6.addGestureRecognizer(gesture6)
        photo7.addGestureRecognizer(gesture7)
        photo8.addGestureRecognizer(gesture8)
        photo9.addGestureRecognizer(gesture9)
        dumanArray = [photo1,photo2,photo3,photo4,photo5,photo6,photo7,photo8,photo9]
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFuction), userInfo: nil, repeats: true)
        
        dumantimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(hideDuman), userInfo: nil, repeats: true)
        
        hideDuman()
        
        
        
        
        
        
        
        
        
        
    }
    
    @objc func hideDuman(){
        for duman in dumanArray{
            duman.isHidden = true
        }
        let randomDuman = Int(arc4random_uniform(UInt32(dumanArray.count - 1)))
        
        dumanArray[randomDuman].isHidden = false
        
    }
    
    @objc func skoruarttir() {
        score += 1
        scoreboardLabel.text="Score : \(score)"
        
    }
    @objc func timeFuction(){
        counter-=1
        timeLabel.text="Time : \(counter)"
        if counter == 0 {
            
        //highscore
            
            if (highestScore < score) {
                highestScore = score
                highestscoreLabel.text = "Highest Score : \(highestScore)"
                UserDefaults.standard.set(highestScore, forKey: "hs")
            }
            
            for duman in dumanArray{
                duman.isHidden = true
            }
            timer.invalidate()
            dumantimer.invalidate()
            //alerts
            let alert = UIAlertController(title: "Time is over", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok ", style: UIAlertAction.Style.default)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default){_ in
                // replaybutton organs
                self.score = 0
                self.counter = 10
                self.scoreboardLabel.text = "Score : \(self.score)"
                self.timeLabel.text = "(Time : \(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeFuction), userInfo: nil, repeats: true)
                
                self.dumantimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideDuman), userInfo: nil, repeats: true)
                
                self.hideDuman()
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            present(alert, animated: true)
        }
        
        
    }
    
}




