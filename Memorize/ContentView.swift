//
//  ContentView.swift
//  Memorize
//
//  Created by Howard's Mac mini on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack(alignment: .center, spacing: 10 {
//            Image(systemName: "globe")
//                .foregroundColor(Color.red)
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        })
        //trailing closure syntax
        
        HStack(){
//            let emojis: Array<String> = ["👻","🎃","👽","🕷️"]
//            let emojis: [String] = ["👻","🎃","👽","🕷️"]
            let emojis = ["👻","🎃","👽","🕷️"]
            ForEach(emojis.indices, id: \.self){
                index in
                CardView(content: emojis[index] )
            }
            
        }
            
        //Another way to declare a VStack function(ViewBuilder), only 3 things can do in the curly brace:
        //1 list of Views
        //2 have conditionals, if thens
        //3 declare local variables
        
        .foregroundColor(.orange)
        .padding()
        
        //    The above part after 'View' is Computed Property
        //    1 creating instances of structs, 'Image(systemName: "globe")'
        //    2 named parameters, ' systemName: "globe" '
        //    3 parameter defaults
        
    }
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
            if isFaceUp{
                
                base.strokeBorder(lineWidth: 5)
                base.fill(.white)
                
                Text(content)
                    .font(.largeTitle)
                    .textScale(.default)
            }
            
            else{
                base.fill()
            }
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
