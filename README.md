# QSRatingView
最简单5星评价
Nib、StoreBoard和代码调用斗很简单很好用
一行代码实现了

```
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var QSV: QSRatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        QSV.totalScore = 10 //默认等于10
        QSV.score = 4.5 //设置当前评分
        QSV.isVariable = false //默认问true
    }
}
```
