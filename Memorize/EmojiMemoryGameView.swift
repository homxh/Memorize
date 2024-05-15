//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Howard's Mac mini on 5/6/24.
//
//  This is View of Memorize. (Reflects the Model; Stateless; Declared; Reactive)

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame 
    
//    @State var cardCount = 4
//    
//    
//    var body: some View {
//        //        VStack(alignment: .center, spacing: 10 {
//        //            Image(systemName: "globe")
//        //                .foregroundColor(Color.red)
//        //                .imageScale(.large)
//        //                .foregroundStyle(.tint)
//        //            Text("Hello, world!")
//        //        })
//        //trailing closure syntax
//        
//        VStack{
//            cards
//            Spacer()
//            cardCountAdjusters
//        }
//        .padding()
//    }
    
    var body: some View {
        
        VStack{
            
            ScrollView{
                cards
//                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
            
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards){
                card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture{
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
    }
    
//    var cardCountAdjusters: some View{
//        HStack{
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//    }
        
//    func cardCountAdjuster(by offset: Int, symbol: String)-> some View{
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//           })
//        .imageScale(.large)
//        .font(.largeTitle)
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    
//    var cardRemover: some View{
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//    
//    var cardAdder: some View{
//        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//    }

        
        //    The above part after 'View' is Computed Property
        //    1 creating instances of structs, 'Image(systemName: "globe")'
        //    2 named parameters, ' systemName: "globe" '
        //    3 parameter defaults
}


struct CardView: View{
//    let content: String
//    
//    @State var isFaceUp: Bool = false
 
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card){
        self.card = card
    }
    
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
                Text(card.content)
                    .font(.system(size: 70))
                    .minimumScaleFactor(0.02)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0.3)
        
//        .onTapGesture{
//            isFaceUp.toggle()
//            
//          }
        
    }
}
    
    #Preview {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }


//    struct ContentView_Previews: PreviewProvider{
//        static var previews: some View{
//            ContentView()
//        }
//    }


//struct EmojiMemoryGameView_Previews: PreviewProvider{
//    static var previews: some View{
//        EmojiMemoryGameView(viewModel: <#T##EmojiMemoryGame#>())
//    }
//}
