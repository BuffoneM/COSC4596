/*
 * Michael Buffone
 * 169629010
 * COSC4596
 * Lab 2
 * Made with Cocoa class type
 */

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancel() {
        navigationController?.popViewController(animated:true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
  
}
