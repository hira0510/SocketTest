//
//  SocketTCPViewController.swift
//  socketTest
//
//  Created by  on 2022/7/11.
///CocoaAsyncSocket

import UIKit
import CocoaAsyncSocket

class SocketTCPViewController: ViewController {

    @IBOutlet var views: SocketTCPViews!
    
    var socket: GCDAsyncSocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        setupUI()
    }
    
    private func setupUI() {
        views.ipTextfield.text = testIP
        views.portTextfield.text = testPort
        views.bindButton.addTarget(self, action: #selector(didClickBindBtn), for: .touchUpInside)
        views.sendButton.addTarget(self, action: #selector(didClickSendBtn), for: .touchUpInside)
        views.clearButton.addTarget(self, action: #selector(didClickClearBtn), for: .touchUpInside)
        views.toUDPVcBtn.addTarget(self, action: #selector(didClickToUDPVcBtn), for: .touchUpInside)
        views.toSocketIoVcBtn.addTarget(self, action: #selector(didClickToSocketIoVcBtn), for: .touchUpInside)
        views.toWebSocketVcBtn.addTarget(self, action: #selector(didClickToWebSocketVcBtn), for: .touchUpInside)
        views.toSwiftWebSocketVcBtn.addTarget(self, action: #selector(didClickToSwiftWebSocketVcBtn), for: .touchUpInside)
        views.toStarscreamVcBtn.addTarget(self, action: #selector(didClickToStarscreamVcBtn), for: .touchUpInside)
    }
    
    private func connect() {
        let host: String = views.ipTextfield.text ?? ""
        let port: UInt16 = UInt16(views.portTextfield.text ?? "0") ?? 0
        do {
            try socket.connect(toHost: host, onPort: port, withTimeout: -1)
        } catch {
            views.resultTextView.showMsg("❌連線失敗")
        }
        
        view.endEditing(true)
    }
    
    private func stopConnect() {
        socket.disconnect()
    }
    
    @objc private func didClickBindBtn() {
        views.bindButton.isSelected.toggle()
        views.bindButton.isSelected ? connect(): stopConnect()
    }
    
    @objc private func didClickSendBtn() {
        let data = views.dataTextfield.text?.data(using: .utf16)
        views.resultTextView.showMsg(dateStr() + "\nClient: " + (views.dataTextfield.text ?? "") + "\n")
        socket.write(data, withTimeout: -1, tag: 0)
        views.dataTextfield.text = ""
        view.endEditing(true)
    }
    
    @objc private func didClickClearBtn() {
        views.dataTextfield.text = ""
    }
    
    @objc private func didClickToUDPVcBtn() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SocketUDPViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func didClickToSocketIoVcBtn() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SocketIOViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func didClickToWebSocketVcBtn() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebSocketViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func didClickToSwiftWebSocketVcBtn() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SwiftWebSocketViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func didClickToStarscreamVcBtn() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StarscreamWebSocketViewController")
        self.present(vc, animated: true, completion: nil)
    }
}

extension SocketTCPViewController: GCDAsyncSocketDelegate {
    // 連線成功
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        views.resultTextView.showMsg(dateStr())
        views.resultTextView.showMsg("🟢連線成功")
        
        let address = "Server IP:" + host
        views.resultTextView.showMsg(address)
        views.resultTextView.showMsg("===========================")
        socket.readData(withTimeout: -1, tag: 0)
    }
    
    // 接收從Server端回傳的訊息
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        let text = String(data: data, encoding: .utf16) ?? ""
        views.resultTextView.showMsg(dateStr() + "\nServer: " + text + "\n")
        socket.readData(withTimeout: -1, tag: 0)
    }

    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        views.resultTextView.showMsg("斷開連結")
        views.bindButton.isSelected = false
    }
}
