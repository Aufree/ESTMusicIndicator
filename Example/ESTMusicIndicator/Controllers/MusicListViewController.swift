//
//  MusicListViewController.swift
//  ESTMusicIndicator
//
//  Created by Aufree on 12/28/15.
//  Copyright © 2015 The EST Group. All rights reserved.
//

import UIKit

class MusicListViewController: UITableViewController, UIGestureRecognizerDelegate {

    var indicatorView: ESTMusicIndicatorView!
    var titles: [String]?
    var startAnimating: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Music indicator demo"
        titles = ["千尋のワルツ", "You Are My Sunshine", "Valder Fields", "Five Hundred Miles", "Old Memory", "A Little Story", "夢のしずく", "空の欠片", "旅立ちの日に…", "letter song"]
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        createIndicatorView()
    }
    
    func createIndicatorView() {
        let screenSize: CGRect = UIScreen.main.bounds
        indicatorView = ESTMusicIndicatorView.init(frame: CGRect(origin: CGPoint(x: (screenSize.width - 50), y: 0), size: CGSize(width: 50, height: 44)))
        indicatorView.hidesWhenStopped = false
        indicatorView.tintColor = UIColor.red
        navigationController?.navigationBar.addSubview(indicatorView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MusicListViewController.didTapIndicator(_:)))
        tap.delegate = self
        indicatorView.addGestureRecognizer(tap)
    }
    
    func didTapIndicator(_ sender: UITapGestureRecognizer? = nil) {
        startAnimating = !startAnimating
        
        if startAnimating {
            indicatorView.state = .playing
        } else {
            indicatorView.state = .stopped
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles!.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "musicListCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MusicListCell
        cell.musicNumber = indexPath.row + 1
        cell.musicTitleLabel.text = titles![indexPath.row]
        return cell
    }
    
    // MARK: - Table view data delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateMusicIndicatorWithIndexPath(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Update music indicator
    
    func updateMusicIndicatorWithIndexPath(_ indexPath: IndexPath) {
        for cell in tableView.visibleCells as! [MusicListCell] {
            cell.state = .stopped
        }
        let musicsCell = tableView.cellForRow(at: indexPath) as! MusicListCell
        musicsCell.state = .playing
    }

}
