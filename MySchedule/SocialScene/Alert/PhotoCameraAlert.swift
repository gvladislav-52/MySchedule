//
//  PhotoCameraAlert.swift
//  MySchedule
//
//  Created by macbookbro on 09.07.2024.
//

import UIKit

extension UIViewController {
    func alertPhotoCamera(completionHandle: @escaping (UIImagePickerController.SourceType) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandle(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "PhotoLibrary", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandle(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        alertController.negativeWidthContraint()
        
        present(alertController, animated: true)
    }
}
