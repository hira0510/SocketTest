//
//  SocketIOViewController.swift
//  socketTest
//
//  Created by  on 2022/7/12.
///Socket.IO-Client-Swift

import UIKit
//import SocketIO

class SocketIOViewController: ViewController {
    
    @IBOutlet var views: SocketIOViews!
    
//    private var manager: SocketManager!
//    private var socket: SocketIOClient?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        views.ipTextfield.text = testIP
        views.portTextfield.text = testPort
//        views.bindButton.addTarget(self, action: #selector(didClickBindBtn), for: .touchUpInside)
//        views.sendButton.addTarget(self, action: #selector(didClickSendBtn), for: .touchUpInside)
//        views.clearButton.addTarget(self, action: #selector(didClickClearBtn), for: .touchUpInside)
//        views.backBtn.addTarget(self, action: #selector(didClickBackBtn), for: .touchUpInside)
    }
    
    // 接收到消息
//   private func receiveMessage(_ data: [Any]?) {
////       let receiveStr = data[0] as? String
////       if !(mySendString == receiveStr) {
////           let str = data[0] as? String
////           let array = str?.components(separatedBy: "?%?%")
////           let str1 = array[1]
////           let array1 = str1.components(separatedBy: "*%*%")
////           if (array[0] == loginName) {
////               //消息添加并展示
////           }
////           print("内容内容:\(array1[0])")
////       } else {
////           print("自己发送的消息，不用处理")
////       }
////       print("全部内容:\(data[0]), \(data ?? "")")
//   }
//
//    private func connect() {
//        let ip = views.ipTextfield.text ?? ""
//        let port = views.portTextfield.text ?? ""
//        manager = SocketManager(socketURL: URL(string: "ws://\(ip):\(port)/socket.io/?EIO=4&transport=websocket")!, config: [.log(true), .compress])
//
//        socket = manager.defaultSocket
//
//        //监听连接Socket连接是否成功
//        socket?.on("connect", callback: { [weak self] (data, ack) in
//            guard let `self` = self else { return }
//            self.socket?.emit("response", "I got your response")
//            if self.socket?.status == .connected {
//                self.views.resultTextView.showMsg("連線成功")
//            } else {
//                self.views.resultTextView.showMsg("❌連線失敗")
//            }
//            print("[Debug] data:\(data), ack:\(ack)")
//        })
//
//        //connect_now 为 监听接收消息 的方法名(为举例)  与后台协定方法名
//        self.socket?.on("response", callback: { (data, ack) in
//            print("[Debug] data:\(data), ack:\(ack)")
//        })
//
//        self.socket?.on("disconnect", callback: { (data, ack) in
//            print("[Debug] data:\(data), ack:\(ack)")
//        })
//        socket?.connect()
//
//        view.endEditing(true)
//    }
//
//    private func stopConnect() {
//        socket?.disconnect()
//    }
//
//    @objc private func didClickBindBtn() {
//        views.bindButton.isSelected.toggle()
//        views.bindButton.isSelected ? connect(): stopConnect()
//    }
//
//    @objc private func didClickSendBtn() {
//        let dataStr = views.dataTextfield.text ?? ""
////        let data = dataStr.data(using: .utf16)
//        views.resultTextView.showMsg(dateStr() + "\nClient: " + dataStr + "\n")
//        //发送消息，包括发送方、接收方、发送内容 例如：
////        let cur = "\(receiverName)?%%?%%\(text ?? "")*%%*%%\(myLoginName)"
////        mySendString = cur
//        //发送消息socket
//        //chat message 为发送消息给后台的方法名 (为举例)  与后台协定方法名
////        socket.emit("chat message", with: [cur])
////        self.socket?.emit("v2connect", dataStr)
//        self.socket?.emit(dataStr)
//        views.dataTextfield.text = ""
//        view.endEditing(true)
//    }
//
//    @objc private func didClickClearBtn() {
//        views.dataTextfield.text = ""
//    }
}
