
import UIKit
@objc
public class JWAlertView: UIView {
    private let IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    var imageView : UIImageView = {
        let iv = UIImageView()
        //iv.image = .init(imageLiteralResourceName: "VineCrawl")
        return iv
    }()
    var titleLabel : UILabel = {
        let label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.text = "Title"
        label.textColor = .white
        label.textColor = .darkText
       return label
    }()
    var messageLabel : UILabel = {
        let label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.text = "Your message to the user"
        label.textColor = .white
       return label
    }()
    
    
    convenience init() {
        self.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 100))
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUp(){
        backgroundColor = .systemBlue
        let size = min(frame.width, frame.height) - 10
        let fontSize = IPHONE ? 20 : 30
        imageView.frame = CGRect(x: 5, y: 5, width: size, height: size)
        addSubview(imageView)
        titleLabel.frame = CGRect(x: imageView.frame.maxX + 10, y: 5, width: frame.width - imageView.frame.maxX - 20, height: frame.height * 0.4)
        titleLabel.font = .systemFont(ofSize: CGFloat(fontSize))
        addSubview(titleLabel)
        messageLabel.frame = CGRect(x: imageView.frame.maxX + 10, y: titleLabel.frame.maxY, width: frame.width - imageView.frame.maxX - 20, height: frame.height * 0.4)
        messageLabel.font = .systemFont(ofSize: CGFloat(fontSize))
        addSubview(messageLabel)
        self.layer.cornerRadius = 5
        clipsToBounds = true
    }
}
