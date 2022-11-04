
// Logo cars tableView , headerview , footerview , Expandable & Collapsable row height , Swipe and Delete

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var logoCarsTableView: UITableView!
    
    var logoCars: [String] = ["BMW","Honda","Mitsubishi","Toyota","Jaguar"]
    
    var indexPathVal = Int()
    var isCollapsed = Bool()
    
    var headervView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headervView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: logoCarsTableView.frame.width, height: 50))
        headervView.backgroundColor = .green
        let labelHeader = UILabel(frame: CGRect(x: 0, y: 0, width: logoCarsTableView.frame.width, height: 50))
        headervView.addSubview(labelHeader)
        labelHeader.textAlignment = .center
        labelHeader.text = "Cars Logo"
        labelHeader.text =  labelHeader.text?.uppercased()
        logoCarsTableView.tableHeaderView = headervView
        
        let footerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: logoCarsTableView.frame.width, height: 50))
        footerView.backgroundColor = .green
        let labelFooter = UILabel(frame: CGRect(x: 0, y: 0, width: logoCarsTableView.frame.width, height: 50))
        footerView.addSubview(labelFooter)
        labelFooter.textAlignment = .center
        labelFooter.text = "Footer"
        logoCarsTableView.tableFooterView = footerView
        
        logoCarsTableView.register(UINib(nibName: "logoNib", bundle: nil), forCellReuseIdentifier: "Cell")
        logoCarsTableView.register(UINib(nibName: "OwnersTableViewCell", bundle: nil), forCellReuseIdentifier: "owner")
        
        logoCarsTableView.estimatedRowHeight = 150
        logoCarsTableView.rowHeight = UITableView.automaticDimension
        
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logoCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: logoCarsCell = logoCarsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! logoCarsCell
        cell.logoLabel.text = logoCars[indexPath.row]
        cell.logoLabel.text = cell.logoLabel.text?.uppercased()
        cell.logoImage.image = UIImage(named: logoCars[indexPath.row])
        
        //            let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxknZDezfVnR0TxItfAx44ZkqJovbq0Hnny0zn2FKl74y1Y-PQzUIxbgVXAEnkGKXrge4&usqp=CAU")
        //
        //            guard let imgData1 = try? Data(contentsOf: url!) else {
        //                return UITableViewCell()
        //            }
        //
        /*                       * NOTE:- 2nd way to catch an error *
         
         if let imgData1 = try? Data(contentsOf: url!) {
         cell.logoImage.image = UIImage(data: imgData1)
         } else {
         print("url not found")
         }                                                                                                                                                                                                        */
        
        //            cell.logoImage.image = UIImage(data: imgData1)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            logoCars.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,title: "More") {  (_, _, _) in
        }
        action.backgroundColor = .blue
        let fav = UIContextualAction(style: .destructive, title: "Favourite") { (_, _, _) in
        }
        fav.backgroundColor = .brown
        let  myCar = UIContextualAction(style: .normal, title: "MyCar") { _,_,_ in
        }
        return UISwipeActionsConfiguration(actions: [action, fav, myCar])
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPathVal == indexPath.row && isCollapsed  {
            return 200.0
        } else {
            return 150.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPathVal == indexPath.row {
            isCollapsed = !isCollapsed
        }
        indexPathVal = indexPath.row
        logoCarsTableView.reloadRows(at: [indexPath], with: .fade)
    }
}
