//
//  WebSocketViewController.swift
//  socketTest
//
//  Created by  on 2022/7/13.
///swift原生

import UIKit

class WebSocketViewController: ViewController {

    @IBOutlet var views: WebSocketViews!
    
//    var webSocketTask: URLSessionWebSocketTask?
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
//
//        guard let url = URL(string: ip) else {
//            print("[Debug] Error: can not create URL")
//            return
//        }
//
//        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
//        let request = URLRequest(url: url)
//        webSocketTask = urlSession.webSocketTask(with: request)
//        webSocketTask?.resume()
//        receive()
//
//
//        view.endEditing(true)
//    }
//
//    private func stopConnect() {
//        webSocketTask?.cancel(with: .goingAway, reason: nil)
//    }
//
//    // 接收消息
//    private func receive() {
//        webSocketTask?.receive { [weak self] result in
//            guard let `self` = self else { return }
//            switch result {
//            case .success(let message):
//                switch message {
//                case .string(let text):
//                    self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + text + "\n")
//                case .data(let data):
//                    let text = String(data: data, encoding: .utf16) ?? ""
//                    self.views.resultTextView.showMsg(self.dateStr() + "\nServer: " + text + "\n")
//                @unknown default:
//                    fatalError()
//                }
//            case .failure(let error):
//                print("[Debug] 接收失敗\(error)")
//            }
//        }
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
//
//
//        //也可以傳送data的資料
////        let data = URLSessionWebSocketTask.Message.data(data!)
//        let message = URLSessionWebSocketTask.Message.string(dataStr)
//        webSocketTask?.send(message) { [weak self] (error) in
//            guard let `self` = self else { return }
//            if let error = error {
//                print("[Debug] 傳送失敗\(error)")
//                self.views.resultTextView.showMsg("❌傳送失敗")
//            }
//        }
//
//        views.dataTextfield.text = ""
//        view.endEditing(true)
//    }
//
//    // 可以設定一個 Ping，來驗證及確保連線是正常的，並回傳一個 Pong
//    @objc private func didClickPingBtn() {
//        webSocketTask?.sendPing { [weak self] (error) in
//            guard let `self` = self else { return }
//            self.views.resultTextView.showMsg("❌Ping失敗")
//            print("[Debug] Ping失敗\(String(describing: error))")
//        }
//        self.views.resultTextView.showMsg("🟢Ping成功")
//    }
//
//    @objc private func didClickClearBtn() {
//        views.dataTextfield.text = ""
//    }
//}
//
//extension WebSocketViewController: URLSessionWebSocketDelegate {
//
//    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
//        views.resultTextView.showMsg(dateStr())
//        views.resultTextView.showMsg("🟢連線成功")
//        views.resultTextView.showMsg("===========================")
//    }
//
//    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
//        if let reason = reason, let text = String(data: reason, encoding: .utf16) {
//            views.resultTextView.showMsg(dateStr() + "\nServer: " + text + "\n")
//        }
//        views.resultTextView.showMsg(dateStr() + "\nServer: " + "結束連接" + "\n")
//        views.bindButton.isSelected = false
//    }
}
