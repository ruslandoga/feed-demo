import UIKit
import AsyncDisplayKit

final class VideoViewController: UIViewController {
    
    private var reviews : [Review] = [
        "https://of-course-i-still-love-you.s3.amazonaws.com/5e55106e-1848-4c6b-b307-f3f42acc6d93",
        "https://of-course-i-still-love-you.s3.amazonaws.com/c36e5c29-b28b-48cf-853f-11419bb45760",
        "https://of-course-i-still-love-you.s3.amazonaws.com/318009e0-e9e2-46b3-90be-7112224e3400",
        "https://of-course-i-still-love-you.s3.amazonaws.com/6924ca10-cc57-47c6-91db-fe0cddaf94a3",
        "https://of-course-i-still-love-you.s3.amazonaws.com/4f21c981-67b9-4fd9-bad8-9d8e1bc16e1e",
        "https://of-course-i-still-love-you.s3.amazonaws.com/31b2fa75-254c-4d25-8962-0503419ea7b1",
        "https://of-course-i-still-love-you.s3.amazonaws.com/6e108e2e-d1f9-4911-bb38-28b2ab44a58e",
        "https://of-course-i-still-love-you.s3.amazonaws.com/c5dd67bb-46b0-4eee-94b0-2de57ebf06f2",
        "https://of-course-i-still-love-you.s3.amazonaws.com/286f9b2a-e166-4d2f-830f-b7898b15a2ca",
        "https://of-course-i-still-love-you.s3.amazonaws.com/62cfe92c-20db-432c-a451-30d30b12e0ad",
        "https://of-course-i-still-love-you.s3.amazonaws.com/1de8eb48-1255-402c-99b8-1dacab764431",
        "https://of-course-i-still-love-you.s3.amazonaws.com/85b81906-8e5d-42c7-9ee5-6c41efb2969c",
        "https://of-course-i-still-love-you.s3.amazonaws.com/5cdb7f87-60e0-46bd-89ca-30789a77b211",
        "https://of-course-i-still-love-you.s3.amazonaws.com/39721b7b-af27-4ea7-b979-b72d3e616890",
        "https://of-course-i-still-love-you.s3.amazonaws.com/58525870-34b4-408e-9e67-d548959e13d7",
        "https://of-course-i-still-love-you.s3.amazonaws.com/c908eb68-20bc-497c-b6e5-4e6862c09715",
        "https://of-course-i-still-love-you.s3.amazonaws.com/c8668ba9-b0dc-4240-ad3b-d28acf21b572",
        "https://of-course-i-still-love-you.s3.amazonaws.com/ee66de09-65d8-4b8f-9277-1fde33fc0fe1",
        "https://of-course-i-still-love-you.s3.amazonaws.com/eea5d6f1-7808-4f74-9346-e6532bd1659a",
        "https://of-course-i-still-love-you.s3.amazonaws.com/fd5f9bbb-ecd3-49d1-9840-b037bd51fe0a"
    ].map { url in
        Review(videoUrl: url + ".mp4",
               placeholderUrl: url + ".jpeg",
               title: "apple poterayl svoego",
               body: "vozaka b s teh por",
               user: User(avatarUrl: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=80",
                          name: "denadzat let nazad",
                          level: "Lv5"),
               tags: [Tag(name: "Hiepdeptrai"), Tag(name: "Hiepdethuong"), Tag(name: "Hieptaiba")],
               likeCount: "123",
               commentCount: "123",
               starCount: "123"
        )
    }
    
    private let collectionNode : ASCollectionNode = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection  = .vertical
        let node = ASCollectionNode(collectionViewLayout: layout)
        node.backgroundColor = .black
        
        return node
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionNode()
        
        if #available(iOS 11.0, *) {
            self.collectionNode.view.contentInsetAdjustmentBehavior = .never
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.collectionNode.frame = view.bounds
    }
    
    private func configureCollectionNode() {
        self.view.addSubnode(collectionNode)
        
        collectionNode.delegate = self
        collectionNode.dataSource = self
        
        self.collectionNode.view.isPagingEnabled = true
        
        (self.collectionNode.nodeForItem(at: IndexPath(item: 0, section: 0)) as? VideoCell)?.videoNode.videoNode.play()
    }
    
    private func checkVisibleNodes() {
        for node in collectionNode.visibleNodes {
            guard
                let videoCell = node as? VideoCell,
                let indexPath = collectionNode.indexPath(for: videoCell),
                let cellRect = collectionNode.view.layoutAttributesForItem(at: indexPath)
            else {
                (node as? VideoCell)?.videoNode.videoNode.pause()
                return
            }
            
            let superView = collectionNode.supernode
            
            let convertedRect = collectionNode.convert(cellRect.frame, to: superView)
            let intersect = collectionNode.frame.intersection(convertedRect)
            let visibleHeight = intersect.height
            
            if visibleHeight == UIScreen.main.bounds.size.height {
                videoCell.videoNode.videoNode.play()
            } else {
                videoCell.videoNode.videoNode.pause()
            }
        }
    }
    
    private func presentCommentsVC() {
        let controller = UINavigationController(rootViewController: CommentsViewController())
        controller.setNavigationBarHidden(true, animated: true)
        let transitionDelegate = SPStorkTransitioningDelegate()
        transitionDelegate.showCloseButton = false
        transitionDelegate.translateForDismiss = 100
        transitionDelegate.customHeight = UIScreen.main.bounds.size.height / 2
        transitionDelegate.showIndicator = false
        transitionDelegate.hapticMoments = [.willPresent, .willDismiss]
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .custom
        controller.modalPresentationCapturesStatusBarAppearance = true
        self.present(controller, animated: true, completion: nil)
    }
}

extension VideoViewController : ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        guard reviews.count > indexPath.row else { return { ASCellNode() } }
        
        let review = reviews[indexPath.item]
        
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = VideoCell(review: review)
            
            cellNode.onTapTextField = { [weak self] in
                self?.presentCommentsVC()
            }
            
            cellNode.onTapCommentButton = { [weak self] in
                self?.presentCommentsVC()
            }
            
            return cellNode
        }
        
        return cellNodeBlock
    }
}

extension VideoViewController : ASCollectionDelegateFlowLayout, UICollectionViewDelegateFlowLayout {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        let size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        return ASSizeRange(min: size, max: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        checkVisibleNodes()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            checkVisibleNodes()
        }
    }
}


