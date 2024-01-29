//
//  ViewController2.swift
//  Mind Game

//  Created by Neel  on 27/06/23.
//

import UIKit

class ViewController2: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var time = Timer()
    var fgColor = ["white","brown","orange","green","pink","yellow","blue","cyan","purple"]
    var bgColor = ["white","brown","orange","green","pink","yellow","blue","cyan","purple"]
    
    let arrayBoxColor = ["white":UIColor.white,"brown":UIColor.brown,"orange":UIColor.orange,"green":UIColor.green,"pink":UIColor.systemPink,"yellow":UIColor.yellow,"blue":UIColor.blue,"cyan":UIColor.cyan, "purple":UIColor.purple]

    

    var scoreText = 0
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var pgbar: UIProgressView!
    
    @IBOutlet weak var cview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logic()
        score.text = "\(scoreText)"
        cview.reloadData()
        progressbar()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bgColor.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        as! CollectionViewCell1
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 4
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.backgroundColor = arrayBoxColor[bgColor[indexPath.row]]?.cgColor
        cell.label.text = fgColor[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func progressbar() {
        var a = pgbar.progress
        time = Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { [self] _ in
            a -= 0.01
            self.pgbar.progress = a
            if self.pgbar.progress == 0.0 {
                self.pgbar.progress = 1.0
                self.time.invalidate()
                self.alert(message: "")
            }
        }
    }
    func alert(message : String) {
        let c = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        
        c.addAction(UIAlertAction(title: "Okay", style:.destructive , handler: nil))
        
        present(c, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fcolor = fgColor[indexPath.item]
        let bcolor = bgColor[indexPath.item]
        if fcolor == bcolor {
            logic()
            scoreText = scoreText + 1
        }
        else{
            let c = UIAlertController(title: "Game Over", message: "match not found", preferredStyle: .alert)
            
            c.addAction(UIAlertAction(title: "Okay", style:.destructive , handler: nil))
            
            present(c, animated: true)
        }
        cview.reloadData()
    }
    func logic() {
        
        fgColor.shuffle()
        bgColor.shuffle()
        
        print("$$$",fgColor)
        print("%%%",bgColor)
        print("\n\n")
        
        var  a = false
        
        repeat{
            a = false
            for i in bgColor.indices{
                if fgColor[i] == bgColor[i] {
                    fgColor.shuffle()
                    a = true
                    break
                }
            }
        }while a ;
        
        let ans = (0..<9).randomElement()!

        let putColor = bgColor[ans]

        let newLocation = fgColor.firstIndex(of: putColor) ?? 0

        (fgColor[ans],fgColor[newLocation]) = (fgColor[newLocation],fgColor[ans])

        let specil = Set(0..<9).subtracting([newLocation,ans]).randomElement()!
        (bgColor[specil],bgColor[newLocation]) = (bgColor[newLocation],bgColor[specil])
        
        print(putColor)
        cview.reloadData()
    }
}
