//
//  ViewController.swift
//  ChangeColor
//
//  Created by 張歆 on 2020/3/31.
//  Copyright © 2020 zxi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var downView: UIView!
    
    @IBOutlet weak var chooseSegCtrl: UISegmentedControl!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var randomButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cake Mask
        
        var image = UIImage(named: "cakeUp")
        let upImageView = UIImageView(image: image)
        upImageView.frame = upView.bounds
        upImageView.contentMode = .scaleAspectFit
        upView.mask = upImageView
        upView.backgroundColor = UIColor(red: 254/255, green: 200/255, blue: 170/255, alpha: 0)
        
        image = UIImage(named: "cakeDown")
        let downImageView = UIImageView(image: image)
        downImageView.frame = downView.bounds
        downImageView.contentMode = .scaleAspectFit
        downView.mask = downImageView
        downView.backgroundColor = UIColor(red: 235/255, green: 154/255, blue: 150/255, alpha: 0)
    }
    
    //分層上色
    var choose = "上層"
    @IBAction func chooseOption(_ sender: UISegmentedControl) {
        choose = sender.titleForSegment(at: sender.selectedSegmentIndex)!
    }
    
    
    @IBAction func changeColor(_ sender: UISlider) {
        if sender == redSlider || sender == blueSlider || sender == greenSlider || sender == alphaSlider {
            redLabel.text = String(format:"%.1f",redSlider.value)
            greenLabel.text = String(format:"%.1f",greenSlider.value)
            blueLabel.text = String(format:"%.1f",blueSlider.value)
            alphaLabel.text = String(format:"%.1f",alphaSlider.value)}
        
        if choose == "上層"{
            upView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            //調整RGB色及透明度
        }
        if choose == "下層"{
            
            downView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha:CGFloat(alphaSlider.value))
        }
        
    }
    
    //隨機上色
    @IBAction func randomAct(_ sender: Any) {
        
        let red = Float.random(in: 0.0...1.0)
        let green = Float.random(in: 0.0...1.0)
        let blue = Float.random(in: 0.0...1.0)
        let alpha = Double.random(in: 0.0...1.0)
        
        upView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        downView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        
        redLabel.text = String(format: "%.1f",red)
        greenLabel.text = String(format:"%.1f", green)
        blueLabel.text = String(format:"%.1f", blue)
        alphaLabel.text = String(format: "%.1f", alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        alphaSlider.value = Float(alpha)
        
    }
    
}
