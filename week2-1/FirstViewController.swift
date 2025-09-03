/*
 FirstViewController
 프로퍼티
 tableView (UITableView)
 datas ([Strings])
 코드베이스, SnapKit 사용
 */

import UIKit
import SnapKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // 1. 테이블뷰 객체를 만든다
    let tableView = UITableView()
    // 3.  데이터 만들기
    let datas = ["옐로 페이스", "혼모노", "농담", "생각에 관한 생각", "더 시스템"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        view.backgroundColor = .white
        //2. 테이블뷰를 뷰에 추가한다.
        view.addSubview(tableView)
        // 4. Delegate, DataSource 설정
        tableView.delegate = self
        tableView.dataSource = self
        // 5. register 만들기
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
        
    }
    // 2. 레이아웃
    func setConstraints() {
        tableView.snp.makeConstraints { make in make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    // 6.  cellForRowAt 데이터 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as? FirstTableViewCell
        else { return .init() }
        
        let data = datas[indexPath.row]
        cell.configure(data: data)
        
        return cell
    }
    


}

