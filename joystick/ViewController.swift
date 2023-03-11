//
//  ViewController.swift
//  joystick
//
//  Created by Илья Черницкий on 9.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    let step:CGFloat = 15
    let counterUIlabel = UILabel()
    let moonUIImageView = UIImageView()
    let buttonUpUIImageView = UIImageView()
    let buttonDownUIImageView = UIImageView()
    let buttonLeftUIImageView = UIImageView()
    let buttonRightUIImageView = UIImageView()
    enum Button {
        case up, down, left, right
    }
    
    override func loadView() {
        super.loadView()
        compliView()
        
    }
    
    private func compliView() {
        buildSpace()
        buildMoon()
        buildCounter()
        buildButton(button: buttonLeftUIImageView, x: Int(moonUIImageView.frame.width / 2) - 65, y: Int(moonUIImageView.frame.height / 2 ) - 10 )
        buildButton(button: buttonRightUIImageView, x: Int(moonUIImageView.frame.width / 2) + 45, y: Int(moonUIImageView.frame.height / 2 ) - 10 )
        buildButton(button: buttonUpUIImageView, x: Int(moonUIImageView.frame.width / 2) - 10, y: Int(moonUIImageView.frame.height / 2 ) - 65 )
        buildButton(button: buttonDownUIImageView, x: Int(moonUIImageView.frame.width / 2) - 10, y: Int(moonUIImageView.frame.height / 2 ) + 45 )
        
    }
    
    private func buildSpace() {
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView1.image = UIImage(named: "Space")
        imageView1.contentMode = .scaleAspectFit
        view.addSubview(imageView1)
        imageView1.center = view.center
        
    }
    
    private func buildButton(button: UIImageView, x: Int, y: Int ) {
        button.frame = CGRect(x: x , y: y, width: 20, height: 20)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        button.image = UIImage(named: "button")
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        button.addGestureRecognizer(tapGesture)
        button.isUserInteractionEnabled = true
        moonUIImageView.addSubview(button)
        
    }
    
    private func buildMoon() {
        moonUIImageView.frame.size = CGSize( width: 130, height: 130)
        moonUIImageView.image = UIImage(named: "Moon")
        moonUIImageView.contentMode = .scaleAspectFit
        moonUIImageView.layer.cornerRadius = CGFloat(65)
        moonUIImageView.layer.masksToBounds = true
        moonUIImageView.isUserInteractionEnabled = true
        view.addSubview(moonUIImageView)
        moonUIImageView.center = view.center
        
    }
    
    private func buildCounter() {
        counterUIlabel.frame.size = CGSize(width: 40, height: 40)
        counterUIlabel.textAlignment = .center
        counterUIlabel.text = "\(counter)"
        counterUIlabel.center = CGPoint(x: Int(moonUIImageView.frame.width / 2) , y: Int(moonUIImageView.frame.height / 2 ))
        moonUIImageView.addSubview(counterUIlabel)
        
    }
    
    @objc
    private func didTap(_ sender: UIGestureRecognizer) {
        guard let view = sender.view else { return }
        
        switch view {
        case buttonUpUIImageView:
            moveView(to: .up)
        case buttonDownUIImageView:
            moveView(to: .down)
        case buttonRightUIImageView:
            moveView(to: .right)
        case buttonLeftUIImageView:
            moveView(to: .left)
        default:
            break
        }
        
    }
    
    private func moveView(to button: Button) {
        let x = 65...view.frame.size.width - 40 - step
        let y = 115...view.frame.size.height - 60 - step
        
        switch button{
        case .up:
            if y ~= moonUIImageView.center.y - step {
                moonUIImageView.center.y -= step
                moonUIImageView.image = UIImage(named: "Sun")
            }
        case .down:
            if y ~= moonUIImageView.center.y + step {
                moonUIImageView.center.y += step
                moonUIImageView.image = UIImage(named: "Moon")
            }
        case .left:
            if x ~= moonUIImageView.center.x - step {
                moonUIImageView.center.x -= step
                moonUIImageView.image = UIImage(named: "Jupiter")
            }
        case .right:
            if x ~= moonUIImageView.center.x + step {
                moonUIImageView.center.x += step
                moonUIImageView.image = UIImage(named: "Mars")
            }
        }
        
        counter += 1
        counterUIlabel.text = "\(counter)"
        
    }
    
}




