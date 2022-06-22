//
//  AppDelegate.swift
//  IMPlane
//
//  Created by 竹村太希 on 2022/06/21.
//

import Cocoa
import InputMethodKit



/// 文字列がPrintableかどうかチェックする
/// - Parameter text: 検証したい文字列
/// - Returns: PrintableならTrue, そうでなければFalse
func isPrintable(_ text: String) -> Bool {
    let printable = [
        CharacterSet.alphanumerics,
        CharacterSet.symbols,
        CharacterSet.punctuationCharacters
    ].reduce(CharacterSet(), { $0.union($1) } )

    return !text.unicodeScalars.contains { !printable.contains($0) }
}



@objc(IMPlaneController)
class IMPlaneController: IMKInputController {
    public override init!(server: IMKServer!, delegate: Any!, client inputClient: Any!) {
        super.init(server: server, delegate: delegate, client: inputClient)
    }
    
    public override func handle(_ event: NSEvent, client: Any) -> Bool {
        guard let client = client as? IMKTextInput else {
            return false
        }

        if let text = event.characters, isPrintable(text) {
            let cursor = NSRange(location: NSNotFound, length: NSNotFound)
            client.insertText(text.uppercased(), replacementRange: cursor)
            return true
        } else {
            return false
        }
    }
}



@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let server = IMKServer(name: "net.kekeho.inputmethod.IMPlane_Connection", bundleIdentifier: Bundle.main.bundleIdentifier)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

