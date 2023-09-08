import UIKit

final class YoutubePage: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        collectionView.register(YoutubeCell.self, forCellWithReuseIdentifier: YoutubeCell.identifier)
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

        manager.fetchVideo { [weak self] thumbnails in
            DispatchQueue.main.async {
                if let thumbnails = thumbnails {
                    self?.thumbnailList = thumbnails
                    self?.collectionView.reloadData()
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbnailList?.items.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeCell.identifier, for: indexPath) as? YoutubeCell else {
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

extension YoutubePage: UICollectionViewDataSource {
    //cell을 클릭했을 때 작동함수
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //url
        let selectedVideo = thumbnailList?.items[indexPath.row].snippet.thumbnails.high.url //"https://i.ytimg.com/vi/cRe9KMvYfWU/mqdefault.jpg"
        
        
        if let videoId = selectedVideo?.getVideoID() {
            let detailPage = DetailPageViewController(videoId: videoId)
            //화면전환 코드 (YOUTUBEPage -> DetailPage)
            //stack view (push, pop)
            navigationController?.pushViewController(detailPage, animated: true)
        } else {
            print("Video가 없습니다")
        }
        
    }
}
