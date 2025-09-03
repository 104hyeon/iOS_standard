/*
 FirstTableViewCell
 프로퍼티
 dataLabel (UILabel)
 메서드
 이름은 configure, 파라미터로 data라는 이름의 String 타입을 받고
 dataLabel의 text를 data로 변경하는 기능
 코드베이스, SnapKit 사용
 */

// 5. 셀 만들기
import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
    
    let dataLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() {
        contentView.addSubview(dataLabel)
    }
    
    func setConstraints() {
        dataLabel.snp.makeConstraints{
            make in make.edges.equalToSuperview().inset(20)
        }
    }
    
    func configure(data: String) {
        dataLabel.text = data
    }
}
    


