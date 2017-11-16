//
//  ViewController.swift
//  nossoApp
//
//  Created by Maíra  on 09/11/17.
//  Copyright © 2017 Maíra . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var recipeList: UITableView!
    
    let titleRecipes = ["Hamburger", "Chicken", "Pasta", "Pancake", "Fish", "Pizza", "Salad"]
    
    let shortDescription = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            "Interdum et malesuada fames ac ante ipsum primis in faucibus.",
                            "Vivamus eu nulla vitae sapien tempor molestie.",
                            "Interdum et malesuada fames ac ante ipsum primis in faucibus.",
                            "Maecenas sed sapien nec urna tempus volutpat. Nulla ornare eleifend sem vitae tincidunt.",
                            "Etiam a magna at felis finibus porta. Nullam posuere arcu in metus lobortis, id posuere dui ornare.",
                            "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae."]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeList.delegate = self
        recipeList.dataSource = self
        
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = recipeList.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.titleRecipeCell.text = titleRecipes[indexPath.row]
        cell.imageRecipeCell.image = UIImage(named: titleRecipes[indexPath.row]
)
        
        return cell
        
    }

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    
    var glutenELactose: Bool = false
    var vazio: Bool = false
    var gluten: Bool = false
    var lactose: Bool = false

    @IBAction func backToViewController(_sender: UIStoryboardSegue) {
        if let indexArray = (_sender.source as? FilterViewController)?.indexes {
            
            if indexArray.count == 2 {
                glutenELactose = true
            } else {
                if indexArray.isEmpty {
                    vazio = true // reloadData
                } else {
                    if indexArray[0].row == 0 {
                        gluten = true // criar var gluten
                    } else {
                        lactose = true // criar var lactose
                    }
                }
            }
        }
    }
}

