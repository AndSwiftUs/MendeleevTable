import UIKit
import SwiftUI

struct MainListView: View {
    
    @State private var periodicTableElements = PeriodicTableOfElements().elements
    @State private var searchText: String = ""
    
    var body: some View {
        
        NavigationStack {
            List(periodicTableElements, id: \.self) { element in
                NavigationLink {
                    ElementDetailView(element: element)
                } label: {
                    HStack {
                        Text("\(element.number!) ")
                            .font(.footnote)
                        Text("\(element.symbol!)")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(hex: "\(element.cpkHex ?? "clear")"))
                        Spacer()
                        if element.number != 15 {
                            Text("\(lround(element.atomicMass!))").font(.footnote)
                        } else {
                            Text("35.5").font(.footnote)
                        }
                        Text("\(element.nameRU ?? element.name!)").font(.footnote)
                    }
                }
//                .listRowBackground(Color(hex: "\(element.cpkHex ?? "clear")"))
            }
            .searchable(text: $searchText, prompt: "№, масса, элемент")
            .onChange(of: searchText) { searchText in
                if !searchText.isEmpty {
                    periodicTableElements = PeriodicTableOfElements().elements.filter { String($0.number!).contains(searchText) || $0.symbol!.contains(searchText) || String($0.atomicMass!).contains(searchText)
                    }
                } else {
                    periodicTableElements = PeriodicTableOfElements().elements
                }
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
