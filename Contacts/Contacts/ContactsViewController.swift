import UIKit

class ConstactsViewController : UITableViewController {
    var contactStore = ContactStore()
    var sections = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sections = contactStore.getSections
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        let charSection = sections[sectionIndex]
        return contactStore.getContactsCountForSection(charSection)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sections[section])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contactStore.getSectionsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let section = sections[indexPath.section]
        cell.textLabel?.text = contactStore.getCertainContact(section, indexPath.row)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return cell
    }
}
