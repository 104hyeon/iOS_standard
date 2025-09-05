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
    let dataButton = UIButton()
    weak var delegate: FirstTVCellDelegate? // 델리게이트는 약한 참조
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [dataLabel, dataButton]
            .forEach { contentView.addSubview($0) }
        
        dataButton.setTitle("데이터 추가", for: .normal)
        dataButton.backgroundColor = .red
        dataButton.addTarget(self, action: #selector(didTapDataButton), for: .touchUpInside)
    }
    
    func setConstraints() {
        dataLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview().inset(16)
        }
        dataButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.top.equalTo(dataLabel.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().inset(16)
            }
        }
    
    func configure(data: String) {
        dataLabel.text = data
    }
    // 버튼 누를 때 실행
    @objc
    func didTapDataButton() {
        let data = dataLabel.text ?? ""   // text는 옵셔널이기 때문에 언래핑필요
        delegate?.didTapButton(data: data)
    }
            
}
    


