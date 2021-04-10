import UIKit

class ContactStore {
    private var contacts = [
        "Alex", "Alpin Expert", "Ana Maria", "Anastasija",
        "Angel Comp", "Anton Kola", "Anton",
        "Bernar", "Berta"
    ]
    private var sections = Dictionary<Character, [String]>()
    
    init() {
        contacts.forEach {
            sections[$0.first!, default: [String]()].append($0)
        }
    }
    
    var getSectionsCount: Int {
        return sections.keys.count
    }
    
    var getSections: [Character] {
        return sections.keys.sorted()
    }
    
    func getContactsCountForSection(_ ch: Character) -> Int {
        let contactsForSection = sections[ch]!
        return contactsForSection.count
    }
    
    func getCertainContact(_ section: Character, _ row: Int) -> String {
        return sections[section]![row]
    }
}
