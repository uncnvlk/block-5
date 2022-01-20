//
//  ResultsViewController.swift
//  миллионер
//
//  Created by Elizaveta Sidorenkova on 08.01.2022.
//

import UIKit

class ResultsViewController: UITableViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let results = Game.shared.results[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.textLabel?.text = "\(results.score)"
        cell.detailTextLabel?.text =  dateFormatter.string(from: results.data)
        return cell
    }


    @IBAction func backToMenu(_ sender: Any) {
        let MainVC = R.Storyboard.Main.instantiateInitialViewController()
        MainVC?.modalPresentationStyle = .fullScreen
        self.present(MainVC!, animated: true)
    }
}
