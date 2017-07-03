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
        
        
    }
    
    func detectFaces() {
        let faceImage = CIImage(image: imageView.image!)
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let faces = faceDetector?.features(in: faceImage!) as! [CIFaceFeature]
        print("Number of faces: \(faces.count)")
        
        let transformScale = CGAffineTransform(scaleX: 1, y: -1)
        let transform = transformScale.translatedBy(x: 0, y: -faceImage!.extent.height)
        
        for face in faces {
            var faceBounds = face.bounds.applying(transform)
            print(faceBounds)
            let imageViewSize = imageView.bounds.size
            let scale = min(imageViewSize.width / faceImage!.extent.width,
                            imageViewSize.height / faceImage!.extent.height)
            
            let dx = (imageViewSize.width - faceImage!.extent.width * scale) / 2
            let dy = (imageViewSize.height - faceImage!.extent.height * scale) / 2
            
            faceBounds.applying(CGAffineTransform(scaleX: scale, y: scale))
            faceBounds.origin.x += dx
            faceBounds.origin.y += dy
            
            let box = UIView(frame: faceBounds)
            box.layer.borderColor = UIColor.red.cgColor
            box.layer.borderWidth = 2
            box.backgroundColor = UIColor.clear
            imageView.addSubview(box)
            
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

