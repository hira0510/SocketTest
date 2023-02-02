//
//  StarscreamWebSocketViewController.swift
//  socketTest
//
//  Created by  on 2022/7/13.
///Starscream

import UIKit
import Starscream

class StarscreamWebSocketViewController: ViewController {
    
    @IBOutlet var views: WebSocketViews!
    
    var webSocket: WebSocket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        views.ipTextfield.text = testWebSocketIP
        views.bindButton.addTarget(self, action: #selector(didClickBindBtn), for: .touchUpInside)
        views.sendButton.addTarget(self, action: #selector(didClickSendBtn), for: .touchUpInside)
        views.clearButton.addTarget(self, action: #selector(didClickClearBtn), for: .touchUpInside)
        views.pingButton.addTarget(self, action: #selector(didClickPingBtn), for: .touchUpInside)
        views.backBtn.addTarget(self, action: #selector(didClickBackBtn), for: .touchUpInside)
    }
    
    private func connect() {
        let ip = views.ipTextfield.text ?? ""
        if let url = URL(string: ip) {
            var request = URLRequest(url: url)
            request.timeoutInterval = 5
            webSocket = WebSocket(request: request)
            webSocket?.delegate = self
            webSocket?.connect()
        } else {
            webSocket = nil
        }
        
        
        view.endEditing(true)
    }
    
    private func stopConnect() {
        webSocket?.disconnect()
    }
    
    @objc private func didClickBindBtn() {
        views.bindButton.isSelected.toggle()
        views.bindButton.isSelected ? connect(): stopConnect()
    }
    
    @objc private func didClickSendBtn() {
        let dataStr = views.dataTextfield.text ?? ""
        views.resultTextView.showMsg(dateStr() + "\nClient: " + dataStr + "\n")
        webSocket?.write(string: dataStr)
        views.dataTextfield.text = ""
        view.endEditing(true)
    }
    
    // 可以設定一個 Ping，來驗證及確保連線是正常的，並回傳一個 Pong
    @objc private func didClickPingBtn() {
        guard let data = views.dataTextfield.text?.data(using: .utf16) else { return }
        webSocket?.write(ping: data)
        self.views.resultTextView.showMsg("Ping")
    }
    
    @objc private func didClickClearBtn() {
        views.dataTextfield.text = ""
    }
}

extension StarscreamWebSocketViewController: WebSocketDelegate {
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(_):
            self.views.resultTextView.showMsg(self.dateStr())
            self.views.resultTextView.showMsg("🟢連線成功")
            self.views.resultTextView.showMsg("===========================")
        case .disconnected(let reason, _):
            print("[Debug] 結束\(reason)")
            self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + "結束連接" + "\n")
            views.bindButton.isSelected = false
        case .text(let string):
            self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + string + "\n")
        case .binary(let data):
            let text = String(data: data, encoding: .utf16) ?? ""
            self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + text + "\n")
        case .ping(let data):
            guard let data = data else { return }
            let text = String(data: data, encoding: .utf16) ?? ""
            self.views.resultTextView.showMsg("ping \(text)")
        case .pong(let data):
            guard let data = data else { return }
            let text = String(data: data, encoding: .utf16) ?? ""
            self.views.resultTextView.showMsg("Pong \(text)")
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + "結束連接" + "\n")
            views.bindButton.isSelected = false
        case .error(let error):
            print("[Debug] 失敗\(String(describing: error))")
        }
    }
}
