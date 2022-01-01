//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by Korlin Favara on 12/31/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var alphaButton: UIButton!
    @IBOutlet weak var pulseButton: UIButton!
    @IBOutlet weak var colorChangeButton: UIButton!
    
    var colorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func moveButtonPressed(_ sender: UIButton) {
        let deviceWidth = view.frame.width
        imageView.frame.origin.x = deviceWidth
        alphaButton.frame.origin.x = deviceWidth
        pulseButton.frame.origin.x = deviceWidth
        colorChangeButton.frame.origin.x = deviceWidth
        
        let centerX = view.center.x
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       options: [],
                       animations: {self.imageView.center.x = centerX},
                       completion: nil)
        UIView.animate(withDuration: 1.5,
                       delay: 0.5,
                       options: [],
                       animations: {self.alphaButton.center.x = centerX},
                       completion: nil)
        UIView.animate(withDuration: 1.0,
                       delay: 1.0,
                       options: [],
                       animations: {self.pulseButton.center.x = centerX},
                       completion: nil)
        UIView.animate(withDuration: 0.5,
                       delay: 1.5,
                       options: [],
                       animations: {self.colorChangeButton.center.x = centerX},
                       completion: nil)
        
        
    }
    
    @IBAction func alphaButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.imageView.alpha = (self.imageView.alpha == 1.0 ? 0.0 : 1.0)
        })
    }
    
    @IBAction func pulseButtonPressed(_ sender: UIButton) {
        let originalFrame = sender.frame
        var widthShrink: CGFloat = 30
        var heightShrink: CGFloat = 10
        var smallerFrame = CGRect(
            x: sender.frame.origin.x + widthShrink,
            y: sender.frame.origin.y + heightShrink,
            width: sender.frame.width - (2 * widthShrink),
            height: sender.frame.height - (2 * heightShrink))
        
        sender.frame = smallerFrame
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {sender.frame = originalFrame})
        
        let originalImageFrame = imageView.frame
        widthShrink = 20
        heightShrink  = 20
        smallerFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - (2 * widthShrink),
            height: imageView.frame.height - (2 * heightShrink))
        
        imageView.frame = smallerFrame
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalImageFrame})
    }
    
    @IBAction func colorChangeButtonPressed(_ sender: UIButton) {
        let colors: [UIColor] = [.red, .orange,. yellow, .green, .blue, .systemIndigo, .purple]
        
        UIView.animate(withDuration: 0.5, animations: {
            self.colorChangeButton.backgroundColor = colors[self.colorIndex]
        })
        
        colorIndex = (colorIndex+1 == colors.count ? 0 : colorIndex + 1)
    }
    
    

}

