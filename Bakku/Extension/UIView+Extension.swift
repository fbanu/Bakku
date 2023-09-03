//
//  UIView+Extension.swift
//  Bakku
//
//  Created by Farheen Banu on 9/3/23.
//

import Foundation
import UIKit

public enum ViewAt: String {
    case top = "Top"
    case bottom = "Bottom"
}

extension CALayer {
    
    public func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor
        
        addSublayer(border)
    }
}
extension UITableView {
    
    public func setBottomInset(to value: CGFloat) {
        let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
        
        self.contentInset = edgeInset
        self.scrollIndicatorInsets = edgeInset
    }
}
extension UIView {
    
    class public var identifier: String {
        return String.init(describing: self)
    }
    
    public var frameWidth: CGFloat {
        return self.frame.width
    }
    
    public var frameHeight: CGFloat {
        return self.frame.height
    }
    
    public var boundsWidth: CGFloat {
        return self.bounds.width
    }
    
    public var boundsHeight: CGFloat {
        return self.bounds.height
    }
    
    public func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    public func roundCorners(at: ViewAt, radius: CGFloat) {
        switch at {
        case .top:
            roundCorners(corners: [.topLeft, .topRight], radius: radius)
        case .bottom:
            roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius)
        }
    }
    
    public func setupForAutolayout(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
    }
    
    public func pinTrailingToTrailing(of view: UIView, constant: CGFloat) {
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
    }
    
    public func pinTrailingToLeading(of view: UIView, constant: CGFloat) {
        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    public func pinTopToTopSafeArea(of view: UIView, constant: CGFloat) {
        
        if #available(iOS 11.0, *) {
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: constant).isActive = true
        }
    }
    
    public func pinTopToTop(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    public func pinTopToBottom(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    public func pinLeadingToLeading(of view: UIView, constant: CGFloat) {
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    public func pinLeadingToTrailing(of view: UIView, constant: CGFloat) {
        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
    }
    
    public func pinBottomToBottom(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
    }
    
    public func pinBottomToBottomSafeArea(of view: UIView, constant: CGFloat) {
        
        if #available(iOS 11.0, *) {
            self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -constant).isActive = true
        }
    }
    
    public func pinBottomToTop(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    public func pinEqualHeight(to view: UIView, constant: CGFloat = 0) {
        self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant).isActive = true
    }
    
    public func pinEqualWidth(to view: UIView, constant: CGFloat = 0) {
        self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant).isActive = true
    }
    
    public func pinHeight(constant: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    public func pinHeightProportional(to view: UIView, multiplier: CGFloat) {
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: 0).isActive = true
    }
    
    public func pinWidthProportional(to view: UIView, multiplier: CGFloat) {
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
    }
    
    public func pinWidth(constant: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    public func pinToCenterHorizontally(in view: UIView, constant: CGFloat = 0) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    public func pinToCenterVertically(in view: UIView, constant: CGFloat = 0) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    public func pin(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat, toView view: UIView) {
        
        self.pinLeadingToLeading(of: view, constant: left)
        self.pinTrailingToTrailing(of: view, constant: right)
        self.pinTopToTop(of: view, constant: top)
        self.pinBottomToBottom(of: view, constant: bottom)
    }
    
    public func addDropShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
    }
    
    public func rotate180Degree() {
        
        let rotationTransform = CGAffineTransform(rotationAngle: .pi)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = rotationTransform
        }) { (isComplete) in
            if isComplete { self.transform = CGAffineTransform.identity }
        }
    }
    
    public func setRandomColorBackground() {
        
        let randomColors = ["#27B1BE", "#1E56A0", "#E16428"]
        let randomIndex = arc4random_uniform(UInt32(randomColors.count))
        
        let color = UIColor.from(hex: randomColors[Int(randomIndex)])
        self.backgroundColor = color
    }
    
    public func displayEmbeddedMessage(label: UILabel, message: String) {
        
        label.text = message
//        label.textColor = Theme.Color.secondaryText
//        label.font = ThemeManager.Font.regular16
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        
        label.pinLeadingToLeading(of: self, constant: 20)
        label.pinTrailingToTrailing(of: self, constant: 20)
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.bringSubviewToFront(label)
    }
    
    public func hideEmbeddedMessage(label: UILabel?) {
        label?.removeFromSuperview()
    }
    
    public func showActivityIndicator(indicator: UIActivityIndicatorView?) {
        
        hideActivityIndicator(indicator: indicator)
        
        guard let activityIndicator = indicator else { return }
        activityIndicator.setupForAutolayout(in: self)
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.bringSubviewToFront(activityIndicator)
    }
    
    public func hideActivityIndicator(indicator: UIActivityIndicatorView?) {
        
        indicator?.stopAnimating()
        indicator?.removeFromSuperview()
    }
    
    public func addGradient(colors: [UIColor] = [.black, .clear], locations: [NSNumber] = [0, 1.0], startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0), type: CAGradientLayerType = .axial) {
        
        let gradient = CAGradientLayer()
        
        gradient.frame.size = self.frame.size
        gradient.frame.origin = CGPoint(x: 0.0, y: 0.0)
        
        // Iterates through the colors array and casts the individual elements to cgColor
        // Alternatively, one could use a CGColor Array in the first place or do this cast in a for-loop
        gradient.colors = colors.map { $0.cgColor }
        
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        // Insert the new layer at the bottom-most position
        // This way we won't cover any other elements
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension UIImageView {
    
    public func displayBackgroundWithAlphabet(text: String) {
        
        var firstAlphabet = "E"
        if let firstChar = text.first {
            firstAlphabet = "\(firstChar)"
        }
        
        self.subviews.forEach { $0.removeFromSuperview() }
        
//        self.backgroundColor = ThemeManager.Color.white
        
        let letterLabel = UILabel()
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.textAlignment = .center
//        letterLabel.font = ThemeManager.Font.medium30
        letterLabel.minimumScaleFactor = 0.6
//        letterLabel.textColor = ThemeManager.Color.esewaMainColor
        letterLabel.text = firstAlphabet.capitalized
        
        self.addSubview(letterLabel)
        
        letterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        letterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        letterLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        letterLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    public func removeCharacterBackground() {
        
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
//    public func setImage(url: String?, placeholder: UIImage? = UIImage(named: "ic_placeholder"), onSuccess: (()->())? = nil)
//
//    public func setImageForTintColorChange(url: String?, placeholder: UIImage? = UIImage(named: "ic_placeholder"), onSuccess: (()->())? = nil)

    public func storeImage(urlString: String, image: UIImage) {
        let path = NSTemporaryDirectory().appending(UUID().uuidString)
        let url = URL(fileURLWithPath: path)
        
        let data = image.jpegData(compressionQuality: 0.5)
        try? data?.write(to: url)
        
        var dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String: String]
        if dict == nil {
            dict = [String: String]()
        }
        dict![urlString] = path
        UserDefaults.standard.set(dict, forKey: "ImageCache")
    }
    
    public func dowloadFromServer(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, onSuccess: ((UIImage?)->())? = nil, placeholder: UIImage? = UIImage(named: "ic_placeholder")) {
        
        contentMode = mode
        //         let imageCache = NSCache<NSString, UIImage>()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    DispatchQueue.main.async {
                        self.image = placeholder
                    }
                    return
            }
            
            DispatchQueue.main.async {
                self.storeImage(urlString: "\(url)", image: image)
                self.image = image
                onSuccess?(image)
            }
        }.resume()
    }
    
    public func dowloadImageFromServer(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, onSuccess: ((UIImage?)->())? = nil, placeholder: UIImage? = UIImage(named: "ic_placeholder")) {
        //        let imageCache = NSCache<NSString, UIImage>()
        
        if let dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String: String] {
            if let path = dict[link] {
                if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                    let img = UIImage(data: data)
                    self.image = img
                    onSuccess?(img)
                    return
                }
            }
        }
        
        guard let url = URL(string: link) else { return }
        self.dowloadFromServer(url: url, contentMode: mode, onSuccess: { (img) in
            onSuccess?(img)
        }, placeholder: placeholder)
    }
}

extension UIImage {
    
    public var asOriginal: UIImage? {
        return self.withRenderingMode(.alwaysOriginal)
    }
    
    public var asTemplate: UIImage? {
        return self.withRenderingMode(.alwaysTemplate)
    }
    public func parseQR() -> [String] {
        guard let image = CIImage(image: self) else {
            return []
        }
        
        let detector = CIDetector(ofType: CIDetectorTypeQRCode,
                                  context: nil,
                                  options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        let features = detector?.features(in: image) ?? []
        
        return features.compactMap { feature in
            return (feature as? CIQRCodeFeature)?.messageString
        }
    }

     public func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    public func withInset(_ insets: UIEdgeInsets) -> UIImage? {
        let cgSize = CGSize(width: self.size.width + insets.left * self.scale + insets.right * self.scale,
                            height: self.size.height + insets.top * self.scale + insets.bottom * self.scale)
        
        UIGraphicsBeginImageContextWithOptions(cgSize, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        
        let origin = CGPoint(x: insets.left * self.scale, y: insets.top * self.scale)
        self.draw(at: origin)
        
        return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(self.renderingMode)
    }
    public func getCropRatio() -> CGFloat {
        let ratio = CGFloat(self.size.width/self.size.height)
        return ratio
    }

}


extension UITextField {
    
    public func addDropdownIndicator() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.image = UIImage(named: "ic_down_arrow")
//        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
//        imageView.tintColor = ThemeManager.Color.primaryText
        imageView.contentMode = .scaleAspectFit
        // random tag to be able to remove later
        imageView.tag = 201
        imageView.setupForAutolayout(in: self)
        imageView.pinToCenterVertically(in: self, constant: -5)
        imageView.pinTrailingToTrailing(of: self, constant: 2)
        
        self.placeholder = "Select"
    }
    
    public func removeDropdown() {
        if let viewWithTag = self.viewWithTag(201) {
            viewWithTag.removeFromSuperview()
        } else {
        }
    }
    
    public func removeDropDownIndicator() {
        
        self.rightView = nil
    }
    
    public func addCalendarIndicatorToRight() {
        
        self.rightView = nil
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.image = #imageLiteral(resourceName: "icon_calendar")
        imageView.contentMode = .scaleAspectFit
        
        imageView.setupForAutolayout(in: self)
        imageView.pinToCenterVertically(in: self, constant: -5)
        imageView.pinTrailingToTrailing(of: self, constant: 8)
        
        self.placeholder = "Select Date"
    }
    
    public func addCalendarIndicatorToLeft() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = #imageLiteral(resourceName: "icon_calendar")
        imageView.contentMode = .scaleAspectFit
        
        imageView.setupForAutolayout(in: self)
        imageView.pinToCenterVertically(in: self, constant: -5)
        imageView.pinLeadingToLeading(of: self, constant: 4)
        
        self.placeholder = "Select Date"
    }
    
    public func addFlightIndicatorToRight() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.image = UIImage(named: "airlines_selection")
        imageView.contentMode = .scaleAspectFit
        
        self.rightView = imageView
        self.rightViewMode = .always
        
        self.placeholder = "Select"
    }
    
    public func addDepartureFlightIndicatorToLeft() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.image = UIImage(named: "airlines_selection")
        imageView.contentMode = .scaleAspectFit
        
        imageView.setupForAutolayout(in: self)
        imageView.pinToCenterVertically(in: self, constant: -5)
        imageView.pinLeadingToLeading(of: self, constant: 8)
        
        self.placeholder = "Select"
    }
    public func addReturnFlightIndicatorToLeft() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.image = UIImage(named: "airline_return")
        imageView.contentMode = .scaleAspectFit
        
        imageView.setupForAutolayout(in: self)
        imageView.pinToCenterVertically(in: self, constant: -5)
        imageView.pinLeadingToLeading(of: self, constant: 8)
        
        self.placeholder = "Select"
    }
}

extension UITableView {
    
    public func addPaginationIndicator(indicator: UIActivityIndicatorView) {
        
        indicator.hidesWhenStopped = true
        indicator.frame = CGRect(x: 0, y: 0, width: self.frameWidth, height: 40)
        self.tableFooterView = indicator
    }
    
    public func showPaginationIndicator(indicator: UIActivityIndicatorView) {
        indicator.startAnimating()
    }
    
    public func hidePaginationIndicator(indicator: UIActivityIndicatorView) {
        indicator.stopAnimating()
    }
    
    public func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("UITableViewCell with identifier \(T.identifier) is not found. Make sure its registered first")
        }
        
        return cell
    }
}

extension UIScrollView {
    
    public func shouldFetchNextPage(offset: CGFloat = 300) -> Bool {
        
        let currentOffset = self.contentOffset.y
        
        let maximumOffset = self.contentSize.height - self.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        return deltaOffset <= offset
    }
}

extension UIViewController {
    public func topmostViewController() -> UIViewController? {
        if let navigationVC = self as? UINavigationController,
            let topVC = navigationVC.topViewController {
            return topVC.topmostViewController()
        }
        if let tabBarVC = self as? UITabBarController,
            let selectedVC = tabBarVC.selectedViewController {
            return selectedVC.topmostViewController()
        }
        if let presentedVC = presentedViewController {
            return presentedVC.topmostViewController()
        }
        if let childVC = children.last {
            return childVC.topmostViewController()
        }
        return self
    }
}

extension UINavigationController {
    
    public func hideNavigationBar() {
        self.navigationBar.isTranslucent = true
        self.navigationBar.backgroundColor = .clear
    }
    
    public func showNavigationBar() {
        self.navigationBar.isTranslucent = false
//        self.navigationBar.backgroundColor = ThemeManager.Color.esewaMainColor
    }
}
