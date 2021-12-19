/*
 * Michael Buffone
 * 169629010
 * COSC4596
 * Lab 2
 */

import Foundation

class ChecklistItem {
    var text = ""
    var checked =  false
    func toggleChecked() {
        checked = !checked
    }
}
