import SwiftUI

struct ElementDetailView: View {
    @State var element: Element
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Text("№").font(.footnote)
                    Text("\(element.number!)")
                }
                Text(" \(element.symbol!) ")
                    .font(.title)
                    .foregroundColor(Color(hex: "\(element.cpkHex ?? "clear")"))
                VStack {
                    Text("\(element.name!)").font(.footnote)
                    Text("\(element.atomicMass!)").font(.footnote)
                }
            }
            
            Divider()

            ScrollView {
                
                Group {
                    HStack {
                        Text("Группа: \(element.period!)")
                        Divider()
                        Text("Состояние: \(element.phase ?? "неизвестно")")
                    }.font(.footnote)
                    
                    Divider()
                    Text("\(element.category!)").font(.footnote)
                    Divider()
                }
                
                NavigationLink {
                    AsyncImage(url: URL(string: element.bohrModelImage!)!) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                } label: {
                    VStack {
                        Text("\(element.electronConfiguration!)")
                            .font(.footnote).foregroundColor(.gray)
                        Text("\(element.electronConfigurationSemantic!)")
                    }
                }
                
                Divider()
                
                HStack {
                    NavigationLink {
                        AsyncImage(url: URL(string: (element.image?.url!)!)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                    } label: {
                        AsyncImage(url: URL(string: (element.image?.url!)!)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                    }.buttonStyle(.plain)
                    
                    if element.appearance != nil { Text(element.appearance!).font(.footnote)
                    }
                }
                
                Divider()
                
                if element.melt != nil {
                    VStack {
                        Text("Melt:").font(.footnote)
                        Text("\(element.melt!)")
                    }
                    Divider()
                }
                
                if element.molarHeat != nil {
                    VStack {
                        Text("Molar heat:").font(.footnote)
                        Text("\(element.molarHeat!)")
                    }
                    Divider()
                }
                
                if element.density != nil {
                    VStack {
                        Text("Density:").font(.footnote)
                        Text("\(element.density!)")
                    }
                    Divider()
                }
                
                if element.summary != nil {
                    Text(element.summary!).font(.footnote).padding()
                    Divider()
                }
            }
        }
    }
}
