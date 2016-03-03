//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Justin Lee on 3/2/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

import Foundation

class Videos {
    
    // Data Encapsulation
    private var _vName:String
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDte:String
    
    // This variable gets created from the UI
    var vImageData:NSData?
    
    // Make a getter
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid: String {
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDte: String {
        return _vReleaseDte
    }
    
    
    init(data: JSONDictionary) {
        
        // Video Name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
            self._vName = vName
        } else {
            _vName = ""
        }
        
        // Video Rights
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
                self._vRights = vRights
        } else {
            _vRights = ""
        }
        
        // Video Price
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
                self._vPrice = vPrice
        } else {
            _vPrice = ""
        }
        
        // Video ImageURL
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        } else {
            _vImageUrl = ""
        }
        
        // Video Artist
        if let artist = data["im_artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String {
                self._vArtist = vArtist
        } else {
            _vArtist = ""
        }
        
        // Video URL
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                self._vVideoUrl = vVideoUrl
        } else {
            _vVideoUrl = ""
        }
  
        
        // Video Id
        if let imid = data["id"] as? JSONDictionary,
            vid = imid["attributes"] as? JSONDictionary,
            vImid = vid["im:id"] as? String {
                self._vImid = vImid
        } else {
            _vImid = ""
        }
        
  
        // Video Genre
        if let category = data["category"] as? JSONDictionary,
            vGenreAttribute = category["attributes"] as? JSONDictionary,
            vGenre = vGenreAttribute["term"] as? String {
                self._vGenre = vGenre
        } else {
            _vGenre = ""
        }
        
        // Video Link to iTunes
        if let videoLink = data["id"] as? JSONDictionary,
            vVideoLink = videoLink["label"] as? String {
                self._vLinkToiTunes = vVideoLink
        } else {
            _vLinkToiTunes = ""
        }
        
        // Video Release Date
        if let releasedate = data["im:releaseDate"] as? JSONDictionary,
            vReleaseDteAttributes = releasedate["attributes"] as? JSONDictionary,
            vReleaseDte = vReleaseDteAttributes["label"] as? String {
                self._vReleaseDte = vReleaseDte
        } else {
            _vReleaseDte = ""
        }
        
    }
    
}
