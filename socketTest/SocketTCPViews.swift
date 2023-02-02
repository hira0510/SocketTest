//
//  SocketTCPViews.swift
//  socketTest
//
//  Created by  on 2022/7/11.
//

import UIKit

class SocketTCPViews: NSObject {

    @IBOutlet weak var bindButton: UIButton!{
        didSet {
            bindButton.setTitleColor(UIColor.blue, for: .normal)
            bindButton.setTitleColor(UIColor.green, for: .selected)
            bindButton.setTitle("綁定", for: .normal)
            bindButton.setTitle("取消", for: .selected)
        }
    }
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var portTextfield: UITextField!
    @IBOutlet weak var ipTextfield: UITextField!
    @IBOutlet weak var dataTextfield: UITextField!
    
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var toUDPVcBtn: UIButton!
    @IBOutlet weak var toSocketIoVcBtn: UIButton!
    @IBOutlet weak var toWebSocketVcBtn: UIButton!
    @IBOutlet weak var toSwiftWebSocketVcBtn: UIButton!
    @IBOutlet weak var toStarscreamVcBtn: UIButton!
}
