import AsyncDisplayKit
import AVFoundation
import UIKit

class VideoCell: ASCellNode {
    
    var onTapTextField: (() -> Void)? {
        didSet { actionNode.onTapTextField = onTapTextField }
    }
    
    var onTapLikeButton: (() -> Void)? {
        didSet { actionNode.onTapLikeButton = onTapLikeButton }
    }
    
    var onTapCommentButton: (() -> Void)? {
        didSet { actionNode.onTapCommentButton = onTapCommentButton }
    }
    
    var onTapStarButton: (() -> Void)? {
        didSet { actionNode.onTapStarButton = onTapStarButton }
    }
    
    private var review: Review?
    
    var videoNode : VideoNode!
    private var actionNode : ActionNode!
    private var infoNode : InfoNode!
    
    init(review: Review) {
        super.init()
        self.review = review
        
        configureVideoNode(review: review)
        configureActionNode(review: review)
        configureInfoNode(review: review)
        
        automaticallyManagesSubnodes = true
    }
}

extension VideoCell {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let insets = UIEdgeInsets(top: CGFloat.infinity, left: 0, bottom: 32, right: 0)
        let insetsSpec = ASInsetLayoutSpec(insets: insets, child: infoNode)
        return ASOverlayLayoutSpec(child: videoNode, overlay: insetsSpec)
    }
}

extension VideoCell {
    private func configureVideoNode(review: Review) {
        videoNode = VideoNode(review: review)
    }
    
    private func configureActionNode(review: Review) {
        actionNode = ActionNode(review: review)
    }
    
    private func configureInfoNode(review: Review) {
        infoNode = InfoNode(review: review)
    }
}
