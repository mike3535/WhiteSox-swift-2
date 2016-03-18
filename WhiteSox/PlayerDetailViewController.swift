//
//  DetailViewController.swift
//  WhiteSox
//
//  Created by Mike Rizza on 11/3/15.
//  Copyright (c) 2015 Mike Rizza. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var numPosLabel: UILabel!
    
    @IBOutlet weak var batsLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var dObLabel: UILabel!
    
    var detailItem: Player? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Player = self.detailItem {
            if let label = self.nameLabel{
                label.text = "\(detail.lastName) , \(detail.firstName)"
            }
            if let label = self.numPosLabel{
                label.text = "\(detail.number) | \(detail.pos)"
            }
            if let label = self.batsLabel {
                label.text = "\(detail.bats) / \(detail.hand)"
            }
            if let label = self.heightLabel{
                label.text = detail.height
            }
            if let label = self.weightLabel{
                label.text = detail.weight
            }
            if let label = self.dObLabel{
                label.text = detail.birthDate
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

