//
//  City.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/26.
//

import SwiftUI

let chiCitys=["全台","臺北市","桃園市","臺中市","臺南市","高雄市","新竹縣","苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣","金門縣","連江縣","基隆市"]
let engCitys=["","taipei","taoyuan","taichung","tainan","kaohsiung","hsinchu","miaoli","changhua","nantou","yunlin","chiayi","pingtung","yilan","hualien","taitung","penghu","kinmen","lienchiang","keelung"]
let apiUrlString="https://kuan-wei0316.github.io/api-page/cafes.json"
struct City: View {
    @State var cafes = [Cafe]()
    @Binding var cafeResult: CafeResult
    func fetchCafe() {
        if let urlStr = (apiUrlString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            if let url=URL(string: urlStr){
                URLSession.shared.dataTask(with: url){ (data, response, error) in
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    if let data=data,let res=try? decoder.decode(CafeResult.self, from: data){
                        self.cafeResult=res
                    }else{
                        print("error")
                    }
                }.resume()
            }
            
        }
    }
    @Binding var selectedIndex: Int
    var body: some View {
        VStack{
            Picker(selection: $selectedIndex, label: Text("選擇角色")) {
                ForEach(chiCitys.indices){ item in
                    Text(chiCitys[item])
                }
            }
            Text("\(selectedIndex)")
            Button(action: {fetchCafe()}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            //testView(cafeResult: $cafeResult)

        }
        
    }
    
}
struct testView: View {
    @Binding var cafeResult:CafeResult
    
    var body: some View{
        if cafeResult.data.isEmpty{
            Text("empty")
        }else{
            Text("\(cafeResult.data[666].name)")
        }
    }
}
//struct City_Previews: PreviewProvider {
//    @State var selectedIndex=0
//    static var previews: some View {
//        City(selectedIndex: self.$selectedIndex)
//    }
//}
