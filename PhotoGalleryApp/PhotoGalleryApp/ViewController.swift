//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by HYEONG SIK NAM on 2022/04/04.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    var fetchResults: PHFetchResult<PHAsset>?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Gallery"
        
        self.makeNavigationBarItem()
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 1) / 2, height: 200)
        layout.minimumInteritemSpacing = 1 // item간의 좌우 간격
        layout.minimumLineSpacing = 1 // item간의 상하 간격
        
        photoCollectionView.collectionViewLayout = layout
        photoCollectionView.dataSource = self
    }
    
    func makeNavigationBarItem() {
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo"), style: .done, target: self, action: #selector(checkPermission))
        photoItem.tintColor = .purple.withAlphaComponent(0.5)
        self.navigationItem.rightBarButtonItem = photoItem
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        refreshItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    @objc func checkPermission() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized, .limited:
            DispatchQueue.main.async {
                self.showGallery()
            }
        case .denied:
            DispatchQueue.main.async {
                self.showAuthorizationAlert()
            }
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                self.checkPermission()
            }
        default:
            break
        }
    }
    
    func showGallery() {
        let library = PHPhotoLibrary.shared()
        var config = PHPickerConfiguration(photoLibrary: library)
        config.selectionLimit = 30 // 0이면 무한대로 선택이 가능함. 그러나 너무 많은건 별로 좋지 않음
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func showAuthorizationAlert() {
        let alert = UIAlertController(title: "갤러리 접근 권한을 활성화하세요.", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil)) // 닫기는 보통 기본으로 다 되어있음
        alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { action in
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        })) // 이것 역시 약간 정형화된 틀이기 때문에 이대로 하면 됨
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func refresh() {
        self.photoCollectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fetchResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if let asset = self.fetchResults?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        let identifiers = results.map{ $0.assetIdentifier ?? "" }
        self.fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
//        fetchAssets.enumerateObjects { asset, index, stop in
//              if index == 2 {
//                  stop.pointee = true => 이런식으로 주로 사용
//              }
//        }
        self.photoCollectionView.reloadData()
        
        self.dismiss(animated: true)
    }
}

