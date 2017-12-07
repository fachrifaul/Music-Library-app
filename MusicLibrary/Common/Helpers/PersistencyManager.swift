//
//  PersistencyManager.swift
//  MusicLibrary
//
//  Created by Fachri Work on 12/7/17.
//  Copyright © 2017 Decadev. All rights reserved.
//

import Foundation
import UIKit

class PersistencyManager {
    
    fileprivate var albums = [Album]()
    
    init() {
        // Dummy list of albums
        //albums = DummyAlbum.albums

        // Dummy list of albums from json
        let savedUrl = documents?.appendingPathComponent(FileNames.albums)
        var data = try? Data(contentsOf: savedUrl!)
        
        if data == nil, let bundleUrl = Bundle.main.url(forResource: FileNames.albums, withExtension: nil) {
            data = try? Data(contentsOf: bundleUrl)
        }
        
        if let albumData = data,
            let decodedAlbums = try? JSONDecoder().decode([Album].self, from: albumData) {
            albums = decodedAlbums
            saveAlbums()
        } else {
            print("#Failed json parsing")
        }
        
    }
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func addAlbum(_ album: Album, at index: Int) {
        if albums.count >= index {
            albums.insert(album, at: index)
        } else {
            albums.append(album)
        }
    }
    
    func deleteAlbum(at index: Int) {
        albums.remove(at: index)
    }
    
    // MARK : Cache image
    
    private var cache: URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
    func saveImage(_ image: UIImage, fileName: String) {
        let url = cache.appendingPathComponent(fileName)
        guard let data = UIImagePNGRepresentation(image) else {
            return
        }
        
        try? data.write(to: url, options: [])
    }
    
    func getImage(with fileName: String) -> UIImage? {
        let url = cache.appendingPathComponent(fileName)
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    // Mark: Memento pattern can be achieved through archiving and serialization
    
    private var documents: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    private enum FileNames {
        static let albums = "albums.json"
    }
    
    func saveAlbums() {
        let url = documents?.appendingPathComponent(FileNames.albums)
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(albums) else {
            return
        }
        
        try? encodedData.write(to: url!)
    }
    
}
