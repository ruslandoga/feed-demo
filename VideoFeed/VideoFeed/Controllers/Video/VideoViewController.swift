import UIKit
import AsyncDisplayKit

final class VideoViewController: UIViewController {
    
   private var reviews : [Review] = [
        ("https://of-course-i-still-love-you.s3.amazonaws.com/5e55106e-1848-4c6b-b307-f3f42acc6d93.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/5e55106e-1848-4c6b-b307-f3f42acc6d93.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T175929Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=c804c7f5fee12f29c36f2d3e77063d3cc93b28af87f82bfc3246636f6e934f6b"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/c36e5c29-b28b-48cf-853f-11419bb45760.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/c36e5c29-b28b-48cf-853f-11419bb45760.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T175928Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=4c3b30f214cb478ec76e347a43ec267174afb77881b3275907060351f0bc0b8e"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/318009e0-e9e2-46b3-90be-7112224e3400.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/318009e0-e9e2-46b3-90be-7112224e3400.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T175928Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=5685ff9aaa497b02ae96659b4e433271515d285e910adf0c10215e546bdee179"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/6924ca10-cc57-47c6-91db-fe0cddaf94a3.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/6924ca10-cc57-47c6-91db-fe0cddaf94a3.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T175928Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=4d716b6399815e3308a90db6e977932722e51baf2182d8ef3c26ea5db3715886"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/4f21c981-67b9-4fd9-bad8-9d8e1bc16e1e.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/4f21c981-67b9-4fd9-bad8-9d8e1bc16e1e.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T175929Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=a5ee2d2432d0b9b8b88b37d418f1d15faaa2c5ad57da593246f708796c4ac970"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/31b2fa75-254c-4d25-8962-0503419ea7b1.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/31b2fa75-254c-4d25-8962-0503419ea7b1.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T175929Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=e8b36036e397806cda5922d48447399e1bf56cb6515297ff4d5b4f47e597770d"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/6e108e2e-d1f9-4911-bb38-28b2ab44a58e.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/6e108e2e-d1f9-4911-bb38-28b2ab44a58e.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T175929Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=9b5e8cbd07d2082951ce79ba89cfc9a712f0852c4c5576660702c1e824166306"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/c5dd67bb-46b0-4eee-94b0-2de57ebf06f2.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/c5dd67bb-46b0-4eee-94b0-2de57ebf06f2.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180643Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=b233efc08fd4d66d838039ac5cbc925203bec585babc6b8a3708bd6e6a4dc46a"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/286f9b2a-e166-4d2f-830f-b7898b15a2ca.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/286f9b2a-e166-4d2f-830f-b7898b15a2ca.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180721Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=4dc9fb0fb94105326fcec677751aa47b89910898cfd0b757e412275b43cb7d23"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/62cfe92c-20db-432c-a451-30d30b12e0ad.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/62cfe92c-20db-432c-a451-30d30b12e0ad.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180736Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=ad35702408e754fb98aabd8d11f2333b5f90e09480ce0b9686cf358d55198380"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/1de8eb48-1255-402c-99b8-1dacab764431.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/62cfe92c-20db-432c-a451-30d30b12e0ad.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180736Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=ad35702408e754fb98aabd8d11f2333b5f90e09480ce0b9686cf358d55198380"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/85b81906-8e5d-42c7-9ee5-6c41efb2969c.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/85b81906-8e5d-42c7-9ee5-6c41efb2969c.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180814Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=4176063b7819bdb7f9e19e7b2049a560d634cb6239b6436d9e0884ce319376f8"),
        
    
    ("https://of-course-i-still-love-you.s3.amazonaws.com/5cdb7f87-60e0-46bd-89ca-30789a77b211.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/5cdb7f87-60e0-46bd-89ca-30789a77b211.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180848Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=f90ba54a3e0374b212ccc5fb162bbd15d48c02f6072129dd25798e158c911297"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/39721b7b-af27-4ea7-b979-b72d3e616890.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/39721b7b-af27-4ea7-b979-b72d3e616890.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180900Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=12b27cdca14b536565931a90a15c5ea2d657ecd3496d94bb7e521398c320faae"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/58525870-34b4-408e-9e67-d548959e13d7.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/58525870-34b4-408e-9e67-d548959e13d7.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180914Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=f53d1e375cdc4f563c1fb10d7775f05132173c1fb36fe370b9c2194594c6e0d5"),
        
    
    ("https://of-course-i-still-love-you.s3.amazonaws.com/c908eb68-20bc-497c-b6e5-4e6862c09715.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/c908eb68-20bc-497c-b6e5-4e6862c09715.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T180931Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=0bbeb336cbfec65eba8fea23ca74006c61c07ebbc6dac65f0ae906ba3568a3fb"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/c8668ba9-b0dc-4240-ad3b-d28acf21b572.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/c8668ba9-b0dc-4240-ad3b-d28acf21b572.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T181000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=2ab73187e91474ec39ab7cb734de4b78d8bbb2d185d159b2d3ddfd9faba7b8c4"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/ee66de09-65d8-4b8f-9277-1fde33fc0fe1.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/c8668ba9-b0dc-4240-ad3b-d28acf21b572.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T181000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=2ab73187e91474ec39ab7cb734de4b78d8bbb2d185d159b2d3ddfd9faba7b8c4"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/eea5d6f1-7808-4f74-9346-e6532bd1659a.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/eea5d6f1-7808-4f74-9346-e6532bd1659a.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T181024Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=2be111a8af3d9aeb7737cb964d049750eae53c67467dc35095e264b118516fcc"),
        ("https://of-course-i-still-love-you.s3.amazonaws.com/fd5f9bbb-ecd3-49d1-9840-b037bd51fe0a.mp4", "https://of-course-i-still-love-you.s3.amazonaws.com/eea5d6f1-7808-4f74-9346-e6532bd1659a.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI4XGYJI7KGSR4BBA/20210217/eu-central-1/s3/aws4_request&X-Amz-Date=20210217T181024Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=2be111a8af3d9aeb7737cb964d049750eae53c67467dc35095e264b118516fcc")
    ].map { (url, placeholder) in
        Review(videoUrl: url,
               placeholderUrl: placeholder,
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


