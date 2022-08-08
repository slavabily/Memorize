//
//  ContentView.swift
//  Memorize
//
//  Created by slava bily on 16.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🚗", "🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🦯","🦽","🦼","🛴","🚲","🛵","🏍","🛺","🚨","🚔","🚍","🚘","🚖","🚡","🚠","🚟","🚃","🚋"]
    
    @State var emojiCount = 8
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .padding(.bottom)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack(alignment: .bottom) {
                cars
                Spacer()
                flags
                Spacer()
                faces
            }
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var cars: some View {
        Button {
            emojis = ["🚗", "🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🦯","🦽","🦼","🛴","🚲","🛵","🏍","🛺","🚨","🚔","🚍","🚘","🚖","🚡","🚠","🚟","🚃","🚋"]
            emojis.shuffle()
        } label: {
            VStack{
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.body)
            }
        }
    }
    
    var flags: some View {
        Button {
            emojis = ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳","🇦🇫", "🇦🇽"]
            emojis.shuffle()
        } label: {
            VStack{
                Image(systemName: "flag")
                Text("Flags")
                    .font(.body)
            }
        }
    }
    
    var faces: some View {
        Button {
            emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️"]
            emojis.shuffle()
        } label: {
            VStack{
                Image(systemName: "face.smiling")
                Text("faces")
                    .font(.body)
            }
            
        }
    }
}

struct CardView: View {
    var content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
