//
//  ViewControllerExtension.swift
//  fhlTracker
//
//  Created by Jose Rivera on 15/03/24.
//

import UIKit
extension UIViewController {
    /*
    Show add a AlertController to show a message
    
    @param title - Tittle to show in the alert
    @param message - add a messsage to user
    */
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     */
    func showActivityIndicator() {
        let container: UIView = UIView()
        let loadingView: UIView = UIView()
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        container.tag = 100
        activityIndicator.tag = 101
        activityIndicator.color = UIColor(named: "ble")
        container.frame = self.view.frame
        container.center = self.view.center
        container.backgroundColor = UIColor(named: "containerWhite")
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center = self.view.center
        loadingView.backgroundColor = UIColor(named: "loadingBackground")
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    /*
     Hide activity indicatorUIKIT
     
     Actually remove activity indicator from its super view
     
     */
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            if let activity =   self.view.viewWithTag(101) {
                (activity as? UIActivityIndicatorView)?.stopAnimating()
            }
            self.view.viewWithTag(100)?.removeFromSuperview()
        }
    }
    func parseError(error: Error?) {
        if error?._code == NSURLErrorTimedOut  || error?._code == NSURLErrorNotConnectedToInternet {
            self.showNoInternet()
        }
    }
    
    func showNoInternet() {
        DispatchQueue.main.async {
                self.showAlert(title: "Ups!.", message: "Parece que no tienes conexion a internet")
            }
    }
        
    func showErrorConection() {
        DispatchQueue.main.async {
            self.showAlert(title: "Ups!", message: "Se ha producido un error en la conexión con el servidor, intente más tarde.")
        }
    }
    func showError104() {
        DispatchQueue.main.async {
            self.showAlert(title: "Ups!", message: "La sesión ha expirado")
            UserDefaults.standard.set("loginYes", forKey: "Login?")
            KeychainService.removePassword(service: "OnRoad", account: "token")
           // UserDefaults.standard.removeObject(forKey: "token")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func showError900() {
        DispatchQueue.main.async {
            self.showAlert(title: "Ups!", message: "Ocurrio un error de sistema")
        }
    }
    func responseCode(code: Int) {
        if code == 104 || code == 107 {
            DispatchQueue.main.async {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "loginVC")
                appDelegate.window?.makeKeyAndVisible()
            }
        }else if code == 106 {
            
        }/*else if code == 107{
            self.showAlert(title: "Ups!", message: "Los datos son incorrectos, rectificalos por favor")
        }*/else if code == 108 {
            
        }else if code == 900 {
            self.showError900()
        }
    }
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
