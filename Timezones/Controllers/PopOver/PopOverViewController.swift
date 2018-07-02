//
//  PopOverViewController.swift
//  Timezones
//
//  Created by Francisco Amado on 15/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

class PopOverViewController: NSViewController, NibLoadable {

    @IBOutlet weak var stackView: NSStackView!

    weak var coordinator: PopOverCoordinatorDelegate?

    var state: TimezoneState? {
        didSet {
            configure(list: state?.timezones)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func selectSettings(_ sender: Any) {
        coordinator?.selectSettings()
    }
}

protocol PopOverItem {

    var title: String { get }
}

// MARK: - Configuration
extension PopOverViewController {

    fileprivate func configure(list: [TimeZone]?) {

        guard let list = list, list.count > 0 else { return }

        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        let date = Date()

        for timezone in list {

            if let infoView = TimezoneInfoView.instantiate() {

                let abbreviation = timezone.abbreviation(for: date)
                let identifier = timezone.identifier
                    .components(separatedBy: "/").last?
                    .replacingOccurrences(of: "_", with: " ")

                var caption: String?
                if let localizedName = timezone.localizedName(for: .shortGeneric, locale: Locale.current) {

                    caption = localizedName
                }

                // Subtitle (00:00 (GMT+1))
                var calendar = Calendar.current
                calendar.timeZone = timezone

                let hour = calendar.component(.hour, from: date)
                let minutes = calendar.component(.minute, from: date)

                var subtitle: String = "\(hour):\(minutes)"

                if let abbreviation = abbreviation {
                    subtitle.append(" (\(abbreviation))")
                }

                infoView.render(with:
                    .init(
                        title: identifier,
                        subtitle: subtitle,
                        caption: caption
                    )
                )
                
                stackView.addArrangedSubview(infoView)
                infoView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
                infoView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
            }
        }
    }
}
