//
//  Data_Songs.swift
//  App_NCX
//
//  Created by Davide Formisano on 25/03/24.
//

import Foundation


struct Item: Identifiable, Hashable{
    var id = UUID()
    var nameSongs: String
    var nameArtist: String
    var imageUrl: URL?
}
