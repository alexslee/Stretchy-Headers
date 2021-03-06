//
//  ViewController.swift
//  Stretchy Headers
//
//  Created by Alex Lee on 2017-07-03.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: properties
    var headerView: UIView!
    @IBOutlet weak var currentDateLabel: UILabel!
    private let kTableHeaderHeight:CGFloat = 300.0
    private let kTableHeaderCutAway: CGFloat = 80.0
    var headerMaskLayer: CAShapeLayer!
    let items = [
        NewsItem(category: .World, story: "Climate change protests, divestments meet fossil fuels realities"),
        NewsItem(category: .Europe, story: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
        NewsItem(category: .MiddleEast, story: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
        NewsItem(category: .Africa, story: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
        NewsItem(category: .AsiaPacific, story: "Despite UN ruling, Japan seeks backing for whale hunting"),
        NewsItem(category: .Americas, story: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
        NewsItem(category: .World, story: "South Africa in $40 billion deal for Russian nuclear reactors"),
        NewsItem(category: .Europe, story: "'One million babies' created by EU student exchanges"),
        ]
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup header view
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y: kTableHeaderHeight)
        
        //setup the 'cutaway' mask
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        updateHeaderView()
        
        //fill in the current date label
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        let formattedToday = formatter.string(from: today)
        currentDateLabel.text = formattedToday
        
        //set the cell height to fit its contents
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 175
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // MARK: UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    // MARK: UITableView
    
    func updateHeaderView() {
        //format the header dimensions
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
        }
        headerView.frame = headerRect
        
        //construct the path for the 'cutaway' mask
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y:headerRect.height - kTableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsItemTableViewCell
        //fill in the cell with the corresponding article
        cell.newsItem = items[indexPath.row]
        
        return cell
    }
}

