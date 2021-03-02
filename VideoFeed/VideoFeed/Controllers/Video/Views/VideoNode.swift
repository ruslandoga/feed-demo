import AsyncDisplayKit

// TODO turn into a story
// TODO move into Since

final class VideoNode: ASDisplayNode {
    private var review: Review?
    
    private let loadingNode: ASDisplayNode = {
        ASDisplayNode(viewBlock: { () -> UIView in
            let view = UIActivityIndicatorView()
            view.hidesWhenStopped = true
            view.color = .white
            return view
        })
    }()
    
    private var loadingView: UIActivityIndicatorView? {
        loadingNode.view as? UIActivityIndicatorView
    }
    
    let videoNode: ASVideoNode = {
        let node = ASVideoNode()
        node.shouldAutoplay = false
        node.gravity = AVLayerVideoGravity.resizeAspectFill.rawValue
        node.shouldAutorepeat = true
        node.muted = true
        return node
    }()
    
    init(review: Review) {
        super.init()
        
        self.review = review
        self.configureVideoNode()
        
        automaticallyManagesSubnodes = true
    }
}

extension VideoNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        loadingNode.style.preferredSize = CGSize(width: 64, height: 64)
        videoNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width,
                                               height: UIScreen.main.bounds.height - 49.0 - 16)
        
        let loadingSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: loadingNode)
        return ASOverlayLayoutSpec(child: videoNode, overlay: loadingSpec)
    }
}

extension VideoNode {
    private func configureVideoNode() {
        videoNode.delegate = self
        
        if let placeholderUrlString = review?.placeholderUrl {
            videoNode.url = URL(string: placeholderUrlString)
        }
        
        guard let urlString = review?.videoUrl,
              let url = URL(string: urlString) else { return }
        
        let asset = AVAsset(url: url)
        DispatchQueue.main.async { self.videoNode.asset = asset }
    }
}

extension VideoNode: ASVideoNodeDelegate {
    func didTap(_ videoNode: ASVideoNode) {
        videoNode.isPlaying() ? videoNode.pause() : videoNode.play()
    }
    
    func videoNodeDidStartInitialLoading(_ videoNode: ASVideoNode) {
        DispatchQueue.main.async { self.loadingView?.startAnimating() }
    }
    
    func videoNodeDidFinishInitialLoading(_ videoNode: ASVideoNode) {
        DispatchQueue.main.async { self.loadingView?.stopAnimating() }
    }
    
    func videoNode(_ videoNode: ASVideoNode, didStallAtTimeInterval timeInterval: TimeInterval) {
        DispatchQueue.main.async { self.loadingView?.startAnimating() }
    }
    
    func videoNodeDidRecover(fromStall videoNode: ASVideoNode) {
        DispatchQueue.main.async { self.loadingView?.stopAnimating() }
    }
}
