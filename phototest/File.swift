//
//  File.swift
//  phototest
//
//  Created by Thomas Getman on 7/2/17.
//  Copyright © 2017 Thomas Getman. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

@available(iOS 11.0, *)
class secondViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    fileprivate var image11: UIImage! {
        didSet {
            image1?.image = image11
            let faceDetector = FaceDetector()
            DispatchQueue.global().async {
                faceDetector.highlightFaces(for: self.image11) { (resultImage1) in
                    DispatchQueue.main.async {
                        self.image1?.image = resultImage1
                    }
                }
            }
        }
    }
    
    fileprivate var image12: UIImage! {
        didSet {
            image2?.image = image12
            let faceDetector = FaceDetector()
            DispatchQueue.global().async {
                faceDetector.highlightFaces(for: self.image12) { (resultImage2) in
                    DispatchQueue.main.async {
                        self.image2?.image = resultImage2
                    }
                }
            }
        }
    }
    
    fileprivate var image13: UIImage! {
        didSet {
            image3?.image = image13
            let faceDetector = FaceDetector()
            DispatchQueue.global().async {
                faceDetector.highlightFaces(for: self.image13) { (resultImage3) in
                    DispatchQueue.main.async {
                        self.image3?.image = resultImage3
                    }
                }
            }
        }
    }
    
    fileprivate var image14: UIImage! {
        didSet {
            image4?.image = image14
            let faceDetector = FaceDetector()
            DispatchQueue.global().async {
                faceDetector.highlightFaces(for: self.image14) { (resultImage4) in
                    DispatchQueue.main.async {
                        self.image4?.image = resultImage4
                    }
                }
            }
        }
    }
    
    fileprivate var image15: UIImage! {
        didSet {
            image5?.image = image15
            let faceDetector = FaceDetector()
            DispatchQueue.global().async {
                faceDetector.highlightFaces(for: self.image15) { (resultImage5) in
                    DispatchQueue.main.async {
                        self.image5?.image = resultImage5
                    }
                }
            }
        }
    }
    
    fileprivate var image16: UIImage! {
        didSet {
            image6?.image = image16
            let faceDetector = FaceDetector()
            DispatchQueue.global().async {
                faceDetector.highlightFaces(for: self.image16) { (resultImage6) in
                    DispatchQueue.main.async {
                        self.image6?.image = resultImage6
                        
                    }
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        image1.image = #imageLiteral(resourceName: "photo1")
        image2.image = #imageLiteral(resourceName: "photo2")
        image3.image = #imageLiteral(resourceName: "photo3")
        image4.image = #imageLiteral(resourceName: "photo4")
        image5.image = #imageLiteral(resourceName: "photo5")
        image6.image = #imageLiteral(resourceName: "photo6")
        
        image11 = UIImage(named: "image1")
        image12 = UIImage(named: "image2")
        image13 = UIImage(named: "image3")
        image14 = UIImage(named: "image4")
        image15 = UIImage(named: "image5")
        image16 = UIImage(named: "image6")
        

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
