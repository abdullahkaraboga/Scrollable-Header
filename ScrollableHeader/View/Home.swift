//
//  Home.swift
//  ScrollableHeader
//
//  Created by Abdullah Karaboğa on 12.01.2023.
//

import SwiftUI

struct Home: View {
    var safeArea: EdgeInsets
    var size: CGSize
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack {
                ArtWork()

                GeometryReader { proxy in
                    Button {

                    } label: {
                        Text("Play Album")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 45)
                            .padding(.vertical, 12)
                            .background {
                            Capsule()
                                .fill(Color("Purple").gradient)
                        }
                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                    .frame(height: 50)
                    .padding(.top, -34)

                VStack {
                    Text("Popular")
                        .fontWeight(.heavy)

                    AlbumView()
                }
                    .padding(.top, 10)
            }
                .overlay(alignment: .top) {
                HeaderView()
            }

        }
            .coordinateSpace(name: "SCROLL")
    }

    @ViewBuilder
    func ArtWork() -> some View {
        let height = size.height * 0.4

        GeometryReader { proxy in
            let size = proxy.size

            Image("ArtWork")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipped()

        }
            .frame(height: height + safeArea.top)
    }

    @ViewBuilder
    func AlbumView() -> some View {
        VStack(spacing: 25) {
            ForEach(albums.indices, id: \.self) { index in

                HStack(spacing: 25) {
                    Text("\(index + 1)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(albums[index].albumName)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("2.324.342")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(systemName: "elipsis")
                        .foregroundColor(.gray)
                }

            }
        }
            .padding(15)
    }

    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            HStack(spacing: 15) {
                Button {

                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                Spacer(minLength: 0)

                Button {

                } label: {
                    Text("Following")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .border(.red, width: 1.5)
                }
                
                Button {

                } label: {
                    Image(systemName: "elipsis")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)

        }
        .frame(height: 35)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
