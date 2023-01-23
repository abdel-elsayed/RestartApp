//
//  CenterDraggableImage.swift
//  RestartApp
//
//  Created by Abdelrahman Elsayed on 1/22/23.
//

import SwiftUI

struct CenterDraggableImage: View {
    @State var imageOffset: CGSize = .zero
    @State var image: Image

    var body: some View {
        ZStack {
            CircleRingView(shapeColor: .white,
                           shapeOpacity: 0.2)
            .offset(x: imageOffset.width * -1)
            .blur(radius: abs(imageOffset.width) / 5)
            .animation(.easeOut(duration: 1), value: imageOffset)
            
            image
                .resizable()
                .scaledToFit()
                .offset(imageOffset)
                .rotationEffect(.degrees(imageOffset.width / 20))
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            if abs(imageOffset.width) <= 150 {
                                imageOffset.width = gesture.translation.width
                            }
                        })
                        .onEnded({ _ in
                            imageOffset = .zero
                        })
                )
                .animation(.easeOut(duration: 1), value: imageOffset)
               
        }
        .overlay(alignment: .bottom, content: {
            Image(systemName: "arrow.left.and.right.circle")
                .font(.system(size: 44, weight: .ultraLight))
                .foregroundColor(.white)
                .offset(y: 30)
                .opacity( imageOffset == .zero ? 1 : 0 )
                .animation(.easeOut, value: imageOffset)
        })
    }
}

struct CenterDraggableImage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
            CenterDraggableImage(image: Image(systemName: "character-1"))

        }
    }
}
