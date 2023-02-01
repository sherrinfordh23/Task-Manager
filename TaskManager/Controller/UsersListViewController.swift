//
//  UsersListViewController.swift
//  TaskManager
//
//  Created by Daniel Carvalho on 23/10/22.
//

import UIKit

protocol UsersListViewControllerDelegate {
    
    func userListViewController( selectedUser user : UserModel )
    
}


class UsersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate : UsersListViewControllerDelegate?
    var users : [UserModel]? = []

    @IBOutlet var tableView : UITableView!
    @IBOutlet var actBusy : UIActivityIndicatorView!
    @IBOutlet var txtSearch : UITextField!
    

    
    private var busy : Bool = false {
        didSet{
            DispatchQueue.main.async {
                if self.busy {
                    self.actBusy.isHidden = false
                    self.actBusy.startAnimating()
                } else {
                    self.actBusy.isHidden = true
                    self.actBusy.stopAnimating()
                }
            }
        }
    }
    
    
    @IBAction func searchBarEditingChanged(){
        
        users = []
        
        guard let text = txtSearch.text else{
            
            
            
            return
        }
        
        for item in DataSource.allUsers{
            
            if item.name.hasPrefix(text) || item.email.hasPrefix(text) {
                
                users?.append(item)
                
            }
        }
        tableView.reloadData()
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customizeView()
        
        initialize()
        
    }
    
    func initialize() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
        
    }

    func customizeView() {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        if users?.count == 0{
            cell.setContent(user: DataSource.allUsers[indexPath.row])
        }
        
        else{
            cell.setContent(user: users![indexPath.row])
        }
            
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if users?.count == 0{
            return DataSource.allUsers.count
        }
        
        return users!.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedUser : UserModel
        
        if users?.count == 0{
            selectedUser = DataSource.allUsers[indexPath.row]
        }
        
        else{
            selectedUser = users![indexPath.row]
        }
        
        
        
        if delegate != nil {
            delegate!.userListViewController(selectedUser: selectedUser)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}
