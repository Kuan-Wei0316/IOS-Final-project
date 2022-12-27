//
//  DrawPoem.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/27.
//

import SwiftUI

let poemUrlString="https://kuan-wei0316.github.io/api-page/poem.json"
struct DrawPoem: View {
    @Binding var poemResult: PoemResult
    @State var random: Int=0
    func fetchPoem() {
        if let urlStr = (poemUrlString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            if let url=URL(string: urlStr){
                URLSession.shared.dataTask(with: url){ (data, response, error) in
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    print("try")
                    if let data=data,let res=try? decoder.decode(PoemResult.self, from: data){
                        print("test")
                        self.poemResult=res
                        print(poemResult.data[0].type)
                    }else{
                        print("error")
                    }
                }.resume()
            }
        }
        random=Int.random(in: 0...99)
    }
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    var body: some View {
        VStack{
            Button(action: {fetchPoem()}, label: {
                Text("試手氣")
            })
            .buttonStyle(GrowingButton())
            
            if poemResult.data.isEmpty{
                List{
                    
                }
            }else{
                List{
                    Section{
                        Text("運勢")
                        Text(poemResult.data[random].type)
                    }
                    Section{
                        Text("詩籤")
                        Text(poemResult.data[random].poem)
                    }
                    Section{
                        Text("解籤")
                        Text(poemResult.data[random].explain)
                    }
                    Section{
                        Text("備註")
                        if poemResult.data[random].note==nil{
                            Text("無")
                        }else{
                            Text(poemResult.data[0].note!)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            
            }
        }
    }
}
//struct DrawPoem_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawPoem()
//    }
//}
