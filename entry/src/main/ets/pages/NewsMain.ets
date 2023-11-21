import {NewsData} from '../model/NewsData'
import {getNewsDatas} from '../model/NewsDataModel'
import router from '@system.router'
import {getDate} from '../model/NewsDataModel'
import App from '@system.app'
import {NewsSwiper} from '../view/NewsSwiper'
import { HotItems } from '../view/HotItems'
import { NewsListPage } from '../view/NewsListPage'
import { NewsTypeComponent } from '../view/NewsTypeComponent'
@Entry
@Component

struct NewsMain {
  build() {
    Tabs({ barPosition: BarPosition.End}){
      TabContent() {
        Column() {
          NewsTypeComponent()
        }
      }
      .tabBar('首页')

      TabContent() {
        Text('推荐的内容').fontSize(30)
      }
      .tabBar('推荐')

      TabContent() {
        Text('发现的内容').fontSize(30)
      }
      .tabBar('发现')

      TabContent() {
        Text('我的内容').fontSize(30)
      }
      .tabBar("我的")
    }


  }
}


