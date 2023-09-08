import UIKit

final class YoutubePage: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private var thumbnailList: [Thumbnails.Item] = []
    private let manager = YoutubeApiManager.shared

    var currentPage = 0
    var maxResults = 20 // 한 페이지에 표시할 항목 수

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

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        loadNextPage()
    }

    func loadNextPage() {
        currentPage += 1
        manager.fetchVideo(page: currentPage, maxResults: maxResults) { [weak self] thumbnails in
            DispatchQueue.main.async {
                if let thumbnails = thumbnails {
                    self?.thumbnailList += thumbnails.items
                    self?.collectionView.reloadData()
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let currentRow = indexPath.row
        if (currentRow % maxResults) == maxResults - 5
        && (currentRow / maxResults) == (currentPage - 1) {
        loadNextPage()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbnailList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeCell.identifier, for: indexPath) as? YoutubeCell else {
            return UICollectionViewCell()
        }
            let item = thumbnailList[indexPath.item]
            cell.configure(data: item)
        return cell
    }

    // cell 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 8
        return CGSize(width: collectionView.bounds.width - inset * 2, height: 240)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension YoutubePage: UICollectionViewDataSource {
    // cell을 클릭했을 때 작동함수
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // url
        let selectedVideo = thumbnailList[indexPath.row].snippet.thumbnails.high.url // "https://i.ytimg.com/vi/cRe9KMvYfWU/mqdefault.jpg"

        if let videoId = selectedVideo.getVideoID() {
            let detailPage = DetailPageViewController(videoId: videoId)
            // 화면전환 코드 (YOUTUBEPage -> DetailPage)
            // stack view (push, pop)
            navigationController?.pushViewController(detailPage, animated: true)
        } else {
            print("Video가 없습니다")
        }
    }
}
