//
//  ViewController.swift
//  CameraApp
//
//  Created by Tero Vuotila on 02/03/2018.
//  Copyright © 2018 Fastmonkeys Oy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func foo() {
        let imagePicker = UIImagePickerController();
        if UIImagePickerController.availableCaptureModes(for: .front) == nil {
            let alert = UIAlertController(title: "No camera", message: "BLAABLAA", preferredStyle: .alert);
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil);
            alert.addAction(okAction);
            present(alert, animated: true, completion: nil);
            return
        }
        imagePicker.delegate = self;
        imagePicker.sourceType = .camera;
        imagePicker.cameraCaptureMode = .photo;
        imagePicker.cameraDevice = .front;

        self.present(imagePicker, animated: true, completion: nil);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.layer.cornerRadius = 0.5 * cameraButton.bounds.size.width;
        imageView.layer.cornerRadius = 10;
        imageView.clipsToBounds = true;
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin];
        imageView.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil);
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        imageView.image = image;
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }

}

