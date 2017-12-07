//
//  Album.swift
//  MusicLibrary
//
//  Created by Fachri Work on 12/7/17.
//  Copyright © 2017 Decadev. All rights reserved.
//

import Foundation

struct Album : Codable {
    var title : String = ""
    var artist : String = ""
    var genre : String = ""
    var coverUrl : String = ""
    var year : String = ""
}

extension Album : CustomStringConvertible {
    var description : String {
        return "title: \(title)" +
            " artist: \(artist)" +
            " genre: \(genre)" +
            " coverUrl: \(coverUrl)" +
        " year: \(year)"
    }
}

typealias AlbumData = (title: String, value: String)

extension Album {
    var tableRepresentation: [AlbumData] {
        return [
            ("Artist", artist),
            ("Album", title),
            ("Genre", genre),
            ("Year", year),
        ]
    }
}

// MARK : Dummy list of albums
class DummyAlbum {
    
    static var albums : [Album] {
        
        let album1 = Album(title: "Best of Bowie",
                           artist: "David Bowie",
                           genre: "Pop",
                           coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_david_bowie_best_of_bowie.png",
                           year: "1992")
        
        let album2 = Album(title: "It's My Life",
                           artist: "No Doubt",
                           genre: "Pop",
                           coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_no_doubt_its_my_life_bathwater.png",
                           year: "2003")
        
        let album3 = Album(title: "Nothing Like The Sun",
                           artist: "Sting",
                           genre: "Pop",
                           coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_sting_nothing_like_the_sun.png",
                           year: "1999")
        
        let album4 = Album(title: "Staring at the Sun",
                           artist: "U2",
                           genre: "Pop",
                           coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_u2_staring_at_the_sun.png",
                           year: "2000")
        
        let album5 = Album(title: "American Pie",
                           artist: "Madonna",
                           genre: "Pop",
                           coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_madonna_american_pie.png",
                           year: "2000")
        
        return [album1, album2, album3, album4, album5]
    }
}
