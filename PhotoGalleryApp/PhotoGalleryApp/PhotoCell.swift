//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by HYEONG SIK NAM on 2022/04/04.
//

import UIKit
import PhotosUI

class PhotoCell: UICollectionViewCell {
    
    func loadImage(asset: PHAsset ) {
        let imageManager = PHImageManager()
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale) // scale까지 알아야 진짜 필요한 픽셀을 알 수 있음
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        
        // options = nil이면  image를 저화질로 한번 고화질로 한번 총 2번 보낸다.
        // 따라서 바로 배열에 append하는것 보다는 cell에서 녹여내는게 더 좋다.
        self.photoImageView.image = nil // nil이 아니면 reload마다 산만함
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { image, info in
            self.photoImageView.image = image
//            if (info?[PHImageResultIsDegradedKey] as? Bool) {
//                // 저화질
//            } else {
//                // 고화질
//            }
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    
    
    
}
