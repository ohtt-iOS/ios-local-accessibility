//
//  LocalAccessbility - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var dateTimeLabel: UILabel!
  @IBOutlet weak var currencyLabel: UILabel!
  
  var money: Double = 3000.34
  let exchangeRate: Double = 1192.23
  
  private func addBottomLabel() {
    let bottomLabel = UILabel()
    bottomLabel.frame = CGRect(x: 20, y: view.bounds.size.height - 150, width: view.bounds.size.width - 40, height: 50)
    bottomLabel.text = NSLocalizedString("text1", comment: "")
    bottomLabel.font = UIFont.preferredFont(forTextStyle: .body)
    bottomLabel.adjustsFontForContentSizeCategory = true
    bottomLabel.textColor = .red
    bottomLabel.textAlignment = .center
    
    view.addSubview(bottomLabel)
  }
  
  private func addButton() {
    let button = UIButton(type: .system)
    button.frame = CGRect(x: 20, y: view.bounds.size.height - 80, width: view.bounds.size.width - 40, height: 50)
    button.setTitle(NSLocalizedString("text2", comment: ""), for: .normal)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    button.setTitleColor(.blue, for: .normal)
    
    view.addSubview(button)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addBottomLabel()
    addButton()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy MMM dd a hh:mm "
    dateTimeLabel.text = dateFormatter.string(from: Date())
    
    let currencyFormatter = NumberFormatter()
    currencyFormatter.numberStyle = .currency
    
    
    if Locale.current.regionCode == "KR" {
      money *= exchangeRate
      currencyFormatter.maximumFractionDigits = 0
      currencyFormatter.currencySymbol = "₩"
    } else {
      currencyFormatter.maximumFractionDigits = 2
      currencyFormatter.currencySymbol = "$"
    }
    
    currencyLabel.text = currencyFormatter.string(for: money)
  }
}

