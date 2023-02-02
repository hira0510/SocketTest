//
//  SwiftWebSocketViewController.swift
//  socketTest
//
//  Created by  on 2022/7/13.
///SwiftWebSocket

import UIKit

class SwiftWebSocketViewController: ViewController {

    @IBOutlet var views: WebSocketViews!
    
//    var webSocket: WebSocket?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//
//    private func setupUI() {
//        views.ipTextfield.text = testWebSocketIP
//        views.bindButton.addTarget(self, action: #selector(didClickBindBtn), for: .touchUpInside)
//        views.sendButton.addTarget(self, action: #selector(didClickSendBtn), for: .touchUpInside)
//        views.clearButton.addTarget(self, action: #selector(didClickClearBtn), for: .touchUpInside)
//        views.pingButton.addTarget(self, action: #selector(didClickPingBtn), for: .touchUpInside)
//        views.backBtn.addTarget(self, action: #selector(didClickBackBtn), for: .touchUpInside)
//    }
//
//    private func connect() {
//        let ip = views.ipTextfield.text ?? ""
//        if let url = URL(string: ip) {
//            let request = URLRequest(url: url)
//            webSocket = WebSocket(request: request)
//
//            // 監聽連線成功
//            webSocket?.event.open = { [weak self] in
//                guard let `self` = self else { return }
//                self.views.resultTextView.showMsg(self.dateStr())
//                self.views.resultTextView.showMsg("🟢連線成功")
//                self.views.resultTextView.showMsg("===========================")
//            }
//
//            // 監聽失敗
//            webSocket?.event.error = { error in
//                print("[Debug] 失敗\(error)")
//            }
//
//            // 監聽結束
//            webSocket?.event.close = {  [weak self] (code, reason, clean) in
//                guard let `self` = self else { return }
//                print("[Debug] 結束\(reason)")
//                self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + "結束連接" + "\n")
//                self.views.bindButton.isSelected = false
//            }
//
//            // 監聽接收消息
//            webSocket?.event.message = { [weak self] data in
//                guard let `self` = self else { return }
//                if let text = data as? String {
//                    self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + text + "\n")
//                }
//            }
//
//            // 監聽pong消息
//            webSocket?.event.pong = { [weak self] data in
//                guard let `self` = self else { return }
//                if let text = data as? String {
//                    self.views.resultTextView.showMsg(self.dateStr() + "\nServer Pong: " + text + "\n")
//                }
//            }
//        } else {
//            webSocket = nil
//        }
//
//
//        view.endEditing(true)
//    }
//
//    private func stopConnect() {
//        webSocket?.close()
//    }
//
//    @objc private func didClickBindBtn() {
//        views.bindButton.isSelected.toggle()
//        views.bindButton.isSelected ? connect(): stopConnect()
//    }
//
//    @objc private func didClickSendBtn() {
//        let dataStr = views.dataTextfield.text ?? ""
//        views.resultTextView.showMsg(dateStr() + "\nClient: " + dataStr + "\n")
//        webSocket?.send(text: dataStr)
//        views.dataTextfield.text = ""
//        view.endEditing(true)
//    }
//
//    // 可以設定一個 Ping，來驗證及確保連線是正常的，並回傳一個 Pong
//    @objc private func didClickPingBtn() {
//        webSocket?.ping("test")
//        self.views.resultTextView.showMsg("Ping")
//    }
//
//    @objc private func didClickClearBtn() {
//        views.dataTextfield.text = ""
//    }
}
