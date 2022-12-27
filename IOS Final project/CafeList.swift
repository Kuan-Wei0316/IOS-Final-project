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
    @State var index: Int=0
    var body: some View {
        NavigationView{
            List{
                ForEach(self.cafeResult.data){item in
                    NavigationLink(
                        destination:
                            CafeDetail(name: item.name),
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

//struct CafeList_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeList()
//    }
//}
