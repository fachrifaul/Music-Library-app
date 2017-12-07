//
//  LibraryAPI.swift
//  MusicLibrary
//
//  Created by Fachri Work on 12/7/17.
//  Copyright © 2017 Decadev. All rights reserved.
//

import Foundation
import UIKit

// Mark : Singleton Pattern
class LibraryAPI {
    static let shared = LibraryAPI()
    private let persistencyManager = PersistencyManager()
    private let httpClient = HTTPClient()
    private let isOnline = false
    
    private init() {
        // Mark : Notifications is Observer pattern
        NotificationCenter.default.addObserver(self, selector: #selector(downloadImage(with:)), name: .BLDownloadImage, object: nil)
    }
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(_ album: Album, at index: Int)  {
        persistencyManager.addAlbum(album, at: index)
        
        if isOnline {
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }
    }
    
    func deleteAlbum(at index: Int) {
        persistencyManager.deleteAlbum(at: index)
        if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
    
    @objc func downloadImage(with notification: Notification)  {
        guard let userInfo = notification.userInfo,
        let imageView = userInfo["imageView"] as? UIImageView,
        let coverUrl = userInfo["coverUrl"] as? String,
        let fileName = URL(string: coverUrl)?.lastPathComponent else {
            return
        }
        
        if let savedImage = persistencyManager.getImage(with: fileName) {
            imageView.image = savedImage
            return
        }
        
        DispatchQueue.global().async {
            let downloadedImage = self.httpClient.downloadImage(coverUrl) ?? UIImage()
            DispatchQueue.main.async {
                imageView.image = downloadedImage
                self.persistencyManager.saveImage(downloadedImage, fileName: fileName)
            }
        }
        
    }
}
