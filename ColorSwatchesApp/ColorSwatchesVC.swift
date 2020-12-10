//  ViewController.swift
//  ColorSwatchesApp
//  Created by Eric Widjaja on 12/7/20.
//  Copyright © 2020 ericSwidjaja. All rights reserved.

import UIKit

@available(iOS 14.0, *)
class ColorSwatchesVC: UIViewController {
    
//MARK: - Properties
    private var selectedColor = UIColor.systemOrange        //Step 4.a
    private var colorPicker = UIColorPickerViewController() //Step 4.a
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorPicker.delegate = self                    //Step 4.b
        self.colorPicker.supportsAlpha = true               //Step 4.d
        self.colorPicker.selectedColor = self.selectedColor //Step 4.d
        self.view.backgroundColor = self.selectedColor      //Step 4.d

    }
    
//MARK: - Methods
    @IBAction func addColorButtonPressed(_ sender: UIBarButtonItem) { //Step 4.e
        present(self.colorPicker, animated: true, completion: nil)
    }
}

//MARK: - Extensions
@available(iOS 14.0, *)
extension ColorSwatchesVC: UIColorPickerViewControllerDelegate {    //Step 4.c
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.selectedColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.view.backgroundColor = self.selectedColor
    }
}

/*
 1. on Main.storyboard set up:
    a. UICollectionView, pin an ImageView to all its cell's edges
    b. named the cell, in reuseIdentifier: 'ColorCell"
 
 2. Create a 'ColorCell.swift' as a Cocoa Touch Class file, subclasses of UICollectionViewCell
 3. Connect MainStoryBoard:
    a. change UICollectionViewCell's name in attribute inspector to 'ColorCell',
    b. make sure the ReuseIdentifier is saying the same -> 'ColorCell'
    c. connect the ImageView to ColorCell Class file
 */
