//
//  UserInfoDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Oscar Victoria Gonzalez  on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserInfoDetailViewController: UIViewController {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userDOBLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    
    var updatedUserInfo: PeopleData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        view.backgroundColor = .systemOrange
    }
    
    func updateUI() {
        guard let userInfo = updatedUserInfo else {
            fatalError("error")
        }
        userEmailLabel.text = ("Email: \(userInfo.email)")
        userDOBLabel.text = "Date Of Birth: \(userInfo.dob)"
        userPhoneLabel.text = "Phone: \(userInfo.phone)"
        
    ImageClient.fetchImage(for: userInfo.picture.large) { [unowned self] (result) in
           switch result {
                case .failure(let error):
                    print("error: \(error)")
                case .success(let image):
                    DispatchQueue.main.async {
                        self.userImageView.image = image
                    }

                }
//
//
        }
    }
   

}
