//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI
//
//struct AwardsView: View {
//    let awards = Aword.getAwards()
//
//    var activeAwards: [Aword] {
//        awards.filter { $0.awarded }
//    }
//    var body: some View {
//        NavigationView {
//            CustomGridView(columns: 2, items: activeAwards) { award in
//                VStack {
//                    award.awardView
//                    Text(award.title)
//                }
//                .padding()
//            }
//            .navigationBarTitle("Awards")
//        }
//    }
//}

struct AwardsView: View {
    let awards = Award.getAwards()
    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                CustomGridView(columns: 3, items: activeAwards) { (itemSize, award) in
                    VStack {
                        award.awardView
                        Text(award.title)
                    }
                    .padding()
                    .frame(width: itemSize, height: itemSize)
                } 
//                LazyVGrid(columns: columns) {
//                    ForEach(activeAwards, id: \.title) { award in
//                        VStack {
//                            award.awardView
//                            Text(award.title)
//                        }
//                    }
//                }
            }.navigationTitle("Your awards: \(activeAwards.count)")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
