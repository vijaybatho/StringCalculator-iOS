//
//  SplashViewController.swift
//  StringCalculator
//
//  Created by Vijay Batho on 06/06/25.
//

import UIKit

class SplashViewController: UIViewController {

    let appIcon = UIImageView()
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateSplashAndNavigate()
    }

    private func animateSplashAndNavigate() {
        // Start with elements fully transparent
        self.appIcon.alpha = 0
        self.titleLabel.alpha = 0

        // Fade-in animation
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
            self.appIcon.alpha = 1
            self.titleLabel.alpha = 1
        }) { _ in
            // After fade-in, wait for 1 second then go to next screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.navigateToHome()
            }
        }
    }

    private func setupGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 115/255, green: 115/255, blue: 205/255, alpha: 1).cgColor, // #7373CD
            UIColor(red: 216/255, green: 131/255, blue: 142/255, alpha: 1).cgColor, // #D8838E
            UIColor(red: 250/255, green: 172/255, blue: 69/255, alpha: 1).cgColor,  // #FAAC45
        ]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func navigateToHome() {
        let homeVC = ViewController() 
        homeVC.modalTransitionStyle = .crossDissolve
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
    }

    private func setupUI() {
        // App Icon
        appIcon.image = UIImage(named: "calculator_icon")
        appIcon.contentMode = .scaleAspectFit
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appIcon)

        // Title Label
        titleLabel.text = "String Calculator"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        // Constraints
        NSLayoutConstraint.activate([
            appIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            appIcon.widthAnchor.constraint(equalToConstant: 100),
            appIcon.heightAnchor.constraint(equalToConstant: 100),

            titleLabel.topAnchor.constraint(equalTo: appIcon.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
