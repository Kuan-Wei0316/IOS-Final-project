//
//  CafeList.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/26.
//

import SwiftUI



struct CafeList: View {
    @Binding var selectedIndex: Int
    @Binding var cafeResult: CafeResult
//    func fetchCafe(){
//        if let urlStr = (apiUrlString + "/" + engCitys[selectedIndex]).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
//            let url = URL(string: urlStr){
//            URLSession.shared.dataTask(with: url){(data, response, error) in
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
//
//                if let data = data,
//                   let cafeResult = try? decoder.decode([Cafe].self, from: data){
//                    cafes = cafeResult
//                    print(cafes[0].name)
//                }
//            }.resume()
//        }
//    }
    
//    func fetchCafe() {
//        if let urlStr = (apiUrlString + "/" + engCitys[selectedIndex]).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
//           let url = URL(string: urlStr){
//            URLSession.shared.dataTask(with: url) { (data, response , error) in
//                let decoder = JSONDecoder()
//                if let data = data,let cafeStore = try? decoder.decode([Cafe].self, from: data){
//                    self.cafes=cafeStore
//                    print(cafes[0].name)
//
//                    decoder.dateDecodingStrategy = .iso8601
////                    print(String(data:data,encoding: .utf8))
//                }
//            }.resume()
//        }
//    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(cafeResult.data.indices){item in
                        NavigationLink(
                            destination: CafeDetail(),
                            label: {
                                VStack(alignment: .leading){
                                    Text(cafeResult.data[item].name)
                                    Text(cafeResult.data[item].city)
                                }
                            })
                    }
                }
            }
            .padding(.bottom)
        }
        
    }
}

//struct CafeList_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeList()
//    }
//}
