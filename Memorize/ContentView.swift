//
//  ContentView.swift
//  Memorize
//
//  Created by Howard's Mac mini on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻","🎃","👽","🕷️","👺","🥷","🧛🏻‍♂️","🦇","👻","🎃","👽","🕷️","👺","🥷","🧛🏻‍♂️","🦇","👺","🥷","🧛🏻‍♂️","🦇"]
    
    @State var cardCount = 4
    
    var body: some View {
        //        VStack(alignment: .center, spacing: 10 {
        //            Image(systemName: "globe")
        //                .foregroundColor(Color.red)
        //                .imageScale(.large)
        //                .foregroundStyle(.tint)
        //            Text("Hello, world!")
        //        })
        //trailing closure syntax
        
        VStack{
            cards
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){
                index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
        
    func cardCountAdjuster(by offset: Int, symbol: String)-> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
           })
        .imageScale(.large)
        .font(.largeTitle)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }

        
        //    The above part after 'View' is Computed Property
        //    1 creating instances of structs, 'Image(systemName: "globe")'
        //    2 named parameters, ' systemName: "globe" '
        //    3 parameter defaults
}


struct CardView: View{
    let content: String
    
    @State var isFaceUp: Bool = false
    var body: some View{
        ZStack(alignment: .center) {
            //            Image(systemName: "globe")
            //                .foregroundColor(Color.blue)
            //                .imageScale(.large)
            //                .foregroundStyle(.tint)
            //                View modifier
            
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
//            if isFaceUp{
//                
//                base.strokeBorder(lineWidth: 8)
//                base.fill(.white)
//                
//                Text(content)
//                    .font(.largeTitle)
//                    .textScale(.default)
//            }
//            
//            else{
//                
//            }
//            base.fill().opacity(isFaceUp ? 0 : 1)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
            
        }.onTapGesture{
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
            
          }
        
    }
}
    
    
//    struct ContentView_Previews: PreviewProvider{
//        static var previews: some View{
//            ContentView()
//        }
//    }
    
    #Preview {
        ContentView()
    }
