//
//  ListSongs.swift
//  App_NCX
//
//  Created by Davide Formisano on 25/03/24.
//

import SwiftUI
import MusicKit

struct Item: Identifiable, Hashable{
    var id = UUID()
    var name: String
    var artist: String
    var imageUrl: URL?
}



struct ListSongsView: View {
    @State var songs = [Item]()
    var body: some View {
        NavigationStack{
            List(songs) { song in
                HStack{
                    AsyncImage(url: song.imageUrl)
                        .frame(width: 75, height: 75, alignment: .center)
                    VStack(alignment: .leading){
                        Text(song.name)
                            .font(.title3)
                        Text(song.artist)
                            .font(.footnote)
                    }
                    .padding()
                }
            }
            .onAppear{
                fetchMusic()
            }
        }
    }
    
    let request: MusicCatalogSearchRequest = {
        var request = MusicCatalogSearchRequest (term: "Happy",
                                                 types: [Song.self])
        request.limit = 25
        return request
    }()
    
    private func fetchMusic() {
        Task{
            // Request Permission
            let status = await MusicAuthorization.request()
            switch status {
            case .authorized:
                do{
                    let result = try await request.response ()
                    self.songs = result.songs.compactMap({
                        return .init(name: $0.title, artist: $0.artistName, imageUrl: $0.artwork?.url(width: 75, height: 75))
                    })
                    print(String(describing: songs[0]))
                } catch{
                    print(String(describing: error))
                }
            default:
                break
            }
        }
    }
    
}

#Preview {
    ListSongsView()
}

 
 
