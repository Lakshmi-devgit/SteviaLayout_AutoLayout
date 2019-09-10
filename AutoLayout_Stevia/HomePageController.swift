//
//  HomePageController.swift
//  AutoLayout_Stevia
//
//  Created by Lakshmi on 10/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import Stevia

class HomePageController: UIViewController {
    
    var displayDataTable = UITableView()
    var displayHeading = UILabel()
    
    var tableHeight = UIScreen.main.bounds.height - 150

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Welcome to Home Page , Autolayout tableview")
        
        view.backgroundColor = UIColor.white
        
        view.sv(
            displayHeading.style({ (v) in
                v.text = "Welcome to Home Page"
                v.font = UIFont.systemFont(ofSize: 16, weight: .medium)
                v.width(150)
            }),
            displayDataTable.style({ (v) in
                v.delegate = self
                v.dataSource = self
                v.register(customCell.self, forCellReuseIdentifier: "customCell")
                v.separatorStyle = .none
                v.rowHeight = 90
            })
        )
        
        view.layout(
        80,
        |-displayHeading.centerHorizontally()-| ~ 50,
        20,
        |-25-displayDataTable-25-| ~ tableHeight
        )
        
        
    }
    
}

extension HomePageController :  UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customcellObj = displayDataTable.dequeueReusableCell(withIdentifier: "customCell") as! customCell
        customcellObj.headingLabel.text = "Heading"
        customcellObj.descriptionLabel.text = "Descritpion"
        return customcellObj
    }
    
    
}

class customCell : UITableViewCell {
    
    let headingLabel = UILabel()
    let descriptionLabel = UILabel()
    let baseView = UIView()
    
    let customCellWidth = UIScreen.main.bounds.width - 60
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        sv(
            baseView.sv(
                headingLabel.style({ (v) in
                    v.textColor = UIColor.green
                    v.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                }),
                descriptionLabel.style({ (v) in
                    v.textColor = UIColor.white
                    v.font = UIFont.systemFont(ofSize: 13, weight: .regular)
                })).style({ (v) in
                    v.backgroundColor = UIColor.gray
                    v.height(83)
                    v.width(customCellWidth)
                    v.layer.cornerRadius = 5
                })
            
        )
        baseView.layout(
            
            |-10-headingLabel ~ 30,
            |-14-descriptionLabel ~ 50
        )
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}



