//
//  City.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/26.
//

import SwiftUI

let chiCitys=["全台","臺北市","桃園市","臺中市","臺南市","高雄市","新竹縣","苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣","金門縣","連江縣","基隆市"]
let engCitys=["cafes","taipei","taoyuan","taichung","tainan","kaohsiung","hsinchu","miaoli","changhua","nantou","yunlin","chiayi","pingtung","yilan","hualien","taitung","penghu","kinmen","lienchiang","keelung"]
let apiUrlString="https://kuan-wei0316.github.io/api-page"
struct City: View {
    @State var cafes = [Cafe]()
    @Binding var cafeResult: CafeResult
    @Binding var selectedIndex: Int
    func fetchCafe() {
        if let urlStr = "\(apiUrlString)/\(engCitys[selectedIndex]).json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
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
            CafeList(selectedIndex: $selectedIndex, cafeResult: $cafeResult)
            Picker(selection: $selectedIndex, label: Text("選擇角色")) {
                ForEach(chiCitys.indices){ item in
                    Text(chiCitys[item])
                }
            }
            Button(action: {fetchCafe()}, label: {
                Text("搜尋")
            })
            .buttonStyle(GrowingButton())
            
        }
        
    }
    
}
struct CafeList: View {
    @Binding var selectedIndex: Int
    @Binding var cafeResult: CafeResult
    @State var index: Int=0
    var body: some View {
        NavigationView{
            List{
                ForEach(self.cafeResult.data){item in
                    NavigationLink(
                        destination:
                            CafeDetail(name: item.name,city: item.city,cheap: item.cheap,address: item.address,wifi: item.wifi,socket: item.socket,open_time: item.open_time,limited_time: item.limited_time),
                        label: {
                            VStack(alignment: .leading){
                                Text(item.name)
                                Text(item.city)
                            }
                        })
                }
            }
            .navigationTitle("咖啡廳列表")
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
