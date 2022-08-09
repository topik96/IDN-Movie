//
//  FilterView.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 09/08/22.
//

import UIKit

class FilterView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singleFirstPicker: UIPickerView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var singlePicker: UIPickerView!
    @IBOutlet weak var primaryButton: PrimaryButton!
    
    private var _yearsData = [String]()
    private var _typesData = [MovieType]()
    
    var didFilterButtonTapped: ButtonEventHandler?
    var didSelectType: ButtonEventWithParameterHandler?
    var didSelectYear: ButtonEventWithParameterHandler?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _commonInit()
    }
    
    private func _commonInit() {
        _ = fromNib(nibName: "FilterView")
        backgroundColor = IDNColor().getColor(.basicGray)
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = IDNColor().getColor(.basicWhite)
        titleLabel.text = "Movie Type"
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        subtitleLabel.textColor = IDNColor().getColor(.basicWhite)
        subtitleLabel.text = "Year"
        primaryButton.setTitle("Filter", for: .normal)
        primaryButton.addTarget(self, action: #selector(_didFilterButtonTapped), for: .touchUpInside)
        _setupPickerView()
    }
    
    private func _setupPickerView() {
        _typesData = [.movie, .series, .episode]
        _yearsData = Date().getYears()
        singleFirstPicker.dataSource = self
        singleFirstPicker.delegate = self
        singlePicker.dataSource = self
        singlePicker.delegate = self
    }
    
    @objc private func _didFilterButtonTapped() {
        didFilterButtonTapped?()
    }
}

// MARK: - Extensions -

extension FilterView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case singleFirstPicker:
            return _typesData.count
        case singlePicker:
            return _yearsData.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case singleFirstPicker:
            return _typesData[row].rawValue.capitalized
        case singlePicker:
            return _yearsData[row]
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case singleFirstPicker:
            didSelectType?(_typesData[row])
        case singlePicker:
            didSelectYear?(_yearsData[row])
        default: break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }
        
        label.textColor = IDNColor().getColor(.basicWhite)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        switch pickerView {
        case singleFirstPicker:
            label.text = _typesData[row].rawValue.capitalized
        case singlePicker:
            label.text = _yearsData[row]
        default: break
        }
        
        return label
    }
}
