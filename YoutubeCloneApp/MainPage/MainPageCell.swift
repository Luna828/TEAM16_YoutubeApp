//
//  MainPageCell.swift
//  YoutubeCloneApp
//
//  Created by Sung Chul Yea on 2023/09/07.
//

import UIKit

final class MainPageCell: UICollectionViewCell {
    static let identifier = "MainPageCell"
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "photo")
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var channelTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()

    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        [titleLabel, subTitleLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        [channelTitle, titleStackView].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 9
        stackView.alignment = .fill
        stackView.distribution = .fill
        [imageView, subStackView].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private func setLayout() {
        contentView.addSubview(mainStackView)

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    func configure(data: Thumbnails.Item) {
        if let url = URL(string: data.snippet.thumbnails.high.url) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    // Handle error
                    print("Error image: \(error?.localizedDescription ?? "")")
                    return
                }
                
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
            }.resume()
        }
        channelTitle.text = data.snippet.channelTitle
        titleLabel.text = data.snippet.title
        subTitleLabel.text = data.snippet.description
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

