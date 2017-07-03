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

class secondViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    
    
    

    @IBAction func detect(_ sender: Any) {
        detectFaces()
        let faceImage = CIImage(image: image1.image!)
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let faces = faceDetector?.features(in: faceImage!) as! [CIFaceFeature]
        
        
        
        
    }
    
    
    func detectFaces() {
        let faceImage = CIImage(image: image1.image!)
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let faces = faceDetector?.features(in: faceImage!) as! [CIFaceFeature]
    
    
    }
    
//    func checkFaces() {
//        if detectFaces().faces = ViewController.faces {
    
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        image1.image = #imageLiteral(resourceName: "photo1")
        image2.image = #imageLiteral(resourceName: "photo2")
        image3.image = #imageLiteral(resourceName: "photo3")
        image4.image = #imageLiteral(resourceName: "photo4")
        image5.image = #imageLiteral(resourceName: "photo5")
        image6.image = #imageLiteral(resourceName: "photo6")
        

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
