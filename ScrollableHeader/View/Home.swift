//
//  Home.swift
//  ScrollableHeader
//
//  Created by Abdullah Karaboğa on 12.01.2023.
//

import SwiftUI

struct Home: View {
    var safeArea : EdgeInsets
    var size : CGSize
    var body: some View {
        ScrollView (.vertical, showsIndicators: false){
            VStack{
                ArtWork()
                
                GeometryReader{ proxy in
                    Button{
                        
                    } label : {
                        Text("Play")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 45)
                            .padding(.vertical, 12)
                            .background{
                                Capsule()
                                    .fill(Color("Purple").gradient)
                            }
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                }
                .frame(height: 50)
            }
            
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func ArtWork()-> some View{
        let height = size.height * 0.4
        
        GeometryReader{ proxy in
            let size = proxy.size
            
            Image("ArtWork")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width,height: size.height)
                .clipped()
        
        }
        .frame(height: height + safeArea.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
