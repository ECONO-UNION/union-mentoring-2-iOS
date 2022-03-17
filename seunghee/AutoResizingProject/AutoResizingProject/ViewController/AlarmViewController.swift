//
//  AlarmViewController.swift
//  AutoResizingProject
//
//  Created by seungbong on 2022/03/17.
//

import UIKit

class AlarmViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var alarmList: [Alarm] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureData()
    configureView()
  }
  
  private func configureData() {
    alarmList.append(Alarm(time: Date(), description: "알람1"))
    alarmList.append(Alarm(time: Date(), description: "알람2"))
    alarmList.append(Alarm(time: Date(), description: "알람3"))
    alarmList.append(Alarm(time: Date(), description: "알\n\n람\n4 testtest\nhelloworld hhelo\n\ng\ng\nggg"))
    alarmList.append(Alarm(time: Date(), description: "알람5알람5알람5알람5알람5알람5알람5알람5알람5알람5\n알람5알람5알람5"))
  }
  
  private func configureView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.showsVerticalScrollIndicator = false
    
    let nib = UINib(nibName: AlarmCell.id, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: AlarmCell.id)
  }
}

extension AlarmViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return alarmList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AlarmCell.id, for: indexPath) as? AlarmCell else {
      return UITableViewCell()
    }
    
    cell.updateUI(alarm: alarmList[indexPath.row])
    return cell
  }
  
//  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    return "기타"
//  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView()
    let titleLabel = UILabel()
    titleLabel.text = "기타"
    titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
    view.addSubview(titleLabel)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -10).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    
    return view
  }
}
