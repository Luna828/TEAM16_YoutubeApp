//
//  MainPageViewController.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

final class MainPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let headerView: MainPageHeaderView = .init(frame: .zero)
    private var thumbnailList: Thumbnails?
    private let manager = YoutubeApiManager.shared

    private let imageView: UIImageView = {
        let image = UIImage(named: "ON")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var leftBarButton: UIBarButtonItem = .init(customView: imageView)

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainPageCell.self, forCellWithReuseIdentifier: MainPageCell.identifier)
        collectionView.backgroundColor = .systemBackground

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = leftBarButton
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        manager.fetchVideo2 { [weak self] thumbnails in
            DispatchQueue.main.async {
                if let thumbnails = thumbnails {
                    self?.thumbnailList = thumbnails
                    self?.collectionView.reloadData()
                }
            }
        }
        // HeaderView 테스트코드
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(headerView)
//        NSLayoutConstraint.activate([
//          headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//          headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//          headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//          headerView.heightAnchor.constraint(equalToConstant: 10)
//        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbnailList?.items.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCell.identifier, for: indexPath) as? MainPageCell else {
            return UICollectionViewCell()
        }

        if let items = thumbnailList?.items, indexPath.item < items.count {
            let item = items[indexPath.item]
            cell.configure(data: item)
        }

        return cell
    }

    //cell 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 8
        return CGSize(width: collectionView.bounds.width - inset * 2, height: 240)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


