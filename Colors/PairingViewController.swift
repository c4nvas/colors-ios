//
//  PairingViewController.swift
//  Colors
//
//  Created by JuunKi Jin on 08/09/2018.
//  Copyright © 2018 C4nvas. All rights reserved.
//

import UIKit
import CoreBluetooth

class BleDeviceTableCell: UITableViewCell {
    @IBOutlet weak var bleDeviceTitle: UILabel!
    @IBOutlet weak var circleLEDView: CircleLEDView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if(selected) {
            circleLEDView.isHidden = false
        } else {
            circleLEDView.isHidden = true
        }
    }
}

class PairingViewController: UIViewController, UITableViewDataSource, CBCentralManagerDelegate {
    
    @IBOutlet weak var bledevicesTableView: UITableView!
    @IBOutlet weak var bluetoothStatusLabel: UILabel!
    
    var titles: Array<String> = []
    var centralManager: CBCentralManager!;
    
    override func viewDidLoad() {
        bledevicesTableView.dataSource = self
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BleDeviceCell", for: indexPath)
            as! BleDeviceTableCell
        
        cell.bleDeviceTitle.text = titles[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            bluetoothStatusLabel.text = "Bluetooth가 비활성화 되어있습니다."
        case .poweredOn:
            bluetoothStatusLabel.text = "Bluetooth가 활성화 되어있습니다."
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        default:
            bluetoothStatusLabel.text = "Bluetooth가 알수없는 상태에 있습니다."
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if(!titles.contains(peripheral.name ?? "Unknown Device")) {
            titles.append(peripheral.name ?? "Unknown Device")
            
            let selectedIndex = bledevicesTableView.indexPathForSelectedRow
            bledevicesTableView.reloadData()
            bledevicesTableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
        }
    }
}
