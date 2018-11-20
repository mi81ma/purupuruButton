//
//  ViewController.swift
//  purupuruButton
//
//  Created by masato on 20/11/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ボタン.
    var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // ボタンを作成する.
        myButton = UIButton()
        myButton.frame = CGRect(x:0,y:0,width:200,height:200)
        myButton.backgroundColor = UIColor.green
        myButton.layer.masksToBounds = true

        myButton.setTitle("ボタン", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        myButton.layer.cornerRadius = 90.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height/2)

        // TouchDownの時のイベントを追加する.
        myButton.addTarget(self, action: #selector(ViewController.onDownButton(sender:)), for: .touchDown)

        // TouchUpの時のイベントを追加する.
        myButton.addTarget(self, action: #selector(ViewController.onUpButton(sender:)), for: [.touchUpInside,.touchUpOutside])

        // 背景色を黒に設定する.
        self.view.backgroundColor = UIColor.black

        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
    }

    /*
     ボタンイベント(Down)
     */
    @objc func onDownButton(sender: UIButton){
        //UIView.animateWithDuration
        UIView.animate(withDuration: 0.06,

                       // アニメーション中の処理.
            animations: { () -> Void in

                // 縮小用アフィン行列を作成する.
                self.myButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

        })
        { (Bool) -> Void in

        }
    }

    /*
     ボタンイベント(Up)
     */
    @objc func onUpButton(sender: UIButton){
        UIView.animate(withDuration: 0.1,

                       // アニメーション中の処理.
            animations: { () -> Void in

                // 拡大用アフィン行列を作成する.
                self.myButton.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)

                // 縮小用アフィン行列を作成する.
                self.myButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

        })
        { (Bool) -> Void in

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
