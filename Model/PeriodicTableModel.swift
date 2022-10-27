import Foundation

struct ElementImage: Codable, Hashable {
    let title : String?
    let url : String?
    let attribution : String?
}

struct Element : Codable, Hashable {
    let name : String?
    let nameRU: String?
    let appearance : String?
    let atomicMass : Double?
    let boil : Double?
    let category : String?
    let density : Double?
    let discoveredBy : String?
    let melt : Double?
    let molarHeat : Double?
    let namedBy : String?
    let number : Int?
    let period : Int?
    let phase : String?
    let source : String?
    let bohrModelImage : String?
    let bohrModel3d : String?
    let spectralImg : String?
    let summary : String?
    let symbol : String?
    let xpos : Int?
    let ypos : Int?
    let shells : [Int]?
    let electronConfiguration : String?
    let electronConfigurationSemantic : String?
    let electronAffinity : Double?
    let electronegativityPauling : Double?
    let ionizationEnergies : [Double]?
    let cpkHex : String?
    let image : ElementImage?
}
    
public class PeriodicTableOfElements {
    
    var elements = [Element]()
    
    init() {
        let jsonDecoder = JSONDecoder()
        if let jsonData = json.data(using: .utf8) {
            do {
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try jsonDecoder.decode([Element].self, from: jsonData)
                self.elements = result
            } catch {
                print("Error JSON: \(error.localizedDescription)")
            }
        }
    }
}
