/*
 Copyright (c) 2021 Josh Walton  <joshwalton5772@gmail.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
import UIKit
/**
    An alert that is designed to provide information to the user without requiring an action. For example, if the device device can't reach a service, you could place an alert saying no connection. Or if you need to let the user know someone, you could place an alert near the bottom. The alert comes with two buttons if you want input from the user.
 - Author:
        Josh Walton
 */
public class VineCrawlAlertView: UIView {
    /// A boolean to show or hide the close button
    var isCloseButtonHidden : Bool{
        get{
            return closeButton.isHidden
        }
        set{
            closeButton.isHidden = newValue
        }
    }
    
    var isRetryButtonHidden : Bool{
        get{
            return retryButton.isHidden
        }
        set{
            retryButton.isHidden = newValue
        }
    }
    
    var image: UIImage?{
        get{
            return imageView.image ?? nil
        }
        set{
            imageView.image = newValue
        }
    }
    var title: String{
        get{
            return titleLabel.text ?? ""
        }
        set{
            titleLabel.text = newValue
            titleLabel.adjustFontSizeToFit()
        }
    }
    var message : String{
        get{
            return messageLabel.text ?? ""
        }
        set{
            messageLabel.text = newValue
            messageLabel.adjustFontSizeToFit()
        }
    }
    
    /// A button that can be for dismissal, located in the upper right corner of the VineCrawlAlertView.
    /// -    Important: The button action is null by default and requires you to provide the action
    /// -     Note: use isCloseButtonHidden to hide if you don’t want it
    var closeButton : UIButton = {
        let button = UIButton(type: .custom)
        button.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        
        button.tintColor = .white
        return button
    }()
    /// A button that can be for anything.  located in the bottom right corner of the VineCrawlAlertView.
    /// -    Important: The button action is null by default and requires you to provide the action
    /// -     Note: use isRetryButtonHidden to hide if you don’t want it
    var retryButton : UIButton = {
        let button = UIButton(type: .custom)
        button.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin]
        button.setTitle("Retry", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let IPHONEInterfaceIdiom = UIDevice.current.userInterfaceIdiom == .phone
    var imageView : UIImageView = {
        let iv = UIImageView()
        
        return iv
    }()
    var titleLabel : UILabel = {
        let label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 30)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.text = "Title"
        label.textColor = .white
       return label
    }()
    var messageLabel : UILabel = {
        let label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.numberOfLines = 9
        label.font = .systemFont(ofSize: 30)
        label.text = "Your message to the user"
        label.textColor = .white
       return label
    }()
    public override var tintColor: UIColor!{
        didSet{
            titleLabel.textColor = tintColor
            messageLabel.textColor = tintColor
            imageView.tintColor = tintColor
            closeButton.tintColor = tintColor
            retryButton.tintColor = tintColor
        }
    }
    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 100))
        setUp()
    }
    
    /// Initialization method that can be a convenience for you to populate your message to the user
    /// - Parameters:
    ///   - frame: The frame that you want the view to be
    ///   - title: The title of your choice
    ///   - message: The message that you can display to the user
    public init(frame : CGRect, title: String, message: String) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 100))
        setUp()
        titleLabel.text = title
        messageLabel.text = message
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        let size = min(min(frame.width, frame.height) - 10, 90)
        imageView.frame = CGRect(x: 5, y: 5, width: size, height: size)
        let titleHeight = min(frame.height * 0.4, 60)
        titleLabel.frame = CGRect(x: imageView.frame.maxX + 10, y: 5, width: frame.width - imageView.frame.maxX - 40, height:titleHeight)
        titleLabel.adjustFontSizeToFit()
        messageLabel.frame = CGRect(x: imageView.frame.maxX + 10, y: titleLabel.frame.maxY, width: frame.width - imageView.frame.maxX - 20, height: frame.height - titleHeight)
        messageLabel.sizeToFit()
    }
    //add the image view and the labels 
    private func setUp(){
        backgroundColor = tintColor
        let bundle = Bundle(for: VineCrawlAlertView.self)
        let bundleURL = bundle.resourceURL?.appendingPathComponent("VineCrawlAlertView.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        imageView.image = UIImage(named: "error.png", in: resourceBundle, compatibleWith: nil)
        addSubview(imageView)
        let fontSize = IPHONEInterfaceIdiom ? 20 : 30
        titleLabel.font = .systemFont(ofSize: CGFloat(fontSize))
        addSubview(titleLabel)
        messageLabel.font = .systemFont(ofSize: CGFloat(fontSize))
        addSubview(messageLabel)
        
        if #available(iOS 13.0, *) {
            closeButton.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        let buttonSize = 40
        
        closeButton.frame = CGRect(x: Int(bounds.width) - buttonSize, y: 0, width: buttonSize, height: buttonSize)
        addSubview(closeButton)
        retryButton.frame = CGRect(x: Int(bounds.width) - buttonSize * 2, y: Int(bounds.height) - buttonSize - 2, width: buttonSize * 2, height: buttonSize)
        addSubview(retryButton)
        self.layer.cornerRadius = 5
        clipsToBounds = true
    }
}
fileprivate extension UILabel{
    
    
    func sizeTextToFit() {
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.1
    }
    /// resize the font size of the label's text to the maximum size that will fit in its own frame
    func adjustFontSizeToFit() {
        if text == "" {
            return
        }
        var high = 50
        var low = 10
        var attributedText: NSAttributedString?
        while low < high {
            let i = (high + low) / 2
            let font = UIFont(name: self.font.fontName, size: CGFloat(i))
            if let font = font {
                attributedText = NSAttributedString(string: self.text!, attributes: [
                    NSAttributedString.Key.font: font
                ])
            }

            let rectSize = attributedText!.boundingRect(with: self.frame.size, options: .usesFontLeading, context: nil)

            if (rectSize.size.height <= self.frame.size.height) && (rectSize.size.width <= self.frame.size.width) {
                low = i + 1
            } else {
                high = i - 1
            }
        }
        self.font = UIFont(name: self.font.fontName, size: CGFloat(high))
    }
}
