//
//  ViewController.swift
//  phototest
//
//  Created by Thomas Getman on 7/2/17.
//  Copyright © 2017 Thomas Getman. All rights reserved.
//

import UIKit
import Vision
import CoreImage

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func btnClicked(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        } else{
            print("Something went wrong")
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }


    @IBOutlet weak var numberlabel: UILabel!
    
    @IBAction func detect(_ sender: Any) {
        detectFaces()
        
        let faceImage = CIImage(image: imageView.image!)
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let faces = faceDetector?.features(in: faceImage!) as! [CIFaceFeature]
        
        
        
    }
    
    func detectFaces() {
        let faceImage = CIImage(image: imageView.image!)
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let faces = faceDetector?.features(in: faceImage!) as! [CIFaceFeature]
        print("Number of faces: \(faces.count)")
        if faces.count == 1 {
        
            numberlabel.text = "Number of faces: \(faces.count)"
        }
        
        else {
            numberlabel.text = "Number of faces: \(faces.count). Please find an image of a single face"
        }

        }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

