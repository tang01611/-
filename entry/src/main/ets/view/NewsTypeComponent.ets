/**
* 主页顶部类型新闻组件
*/
import { NewsData } from '../model/NewsData'
import { getNewsDatas } from '../model/NewsDataModel'
import { HotItems } from './HotItems'
import { NewsListPage } from './NewsListPage'
import { NewsSwiper } from './NewsSwiper'

@Component
 export  struct NewsTypeComponent {
  private newsItems: NewsData[] = getNewsDatas()
  @Provide newsData: NewsData= this.newsItems[0]
  build() {

    Navigation() {
      /*
      轮播图
       */
      //mySwiper()
    NewsSwiper()

      /*
      下面是热搜词条
       */
    HotItems()


    NewsListPage({ newsItems: this.newsItems })

    }
    .title("新闻")
  }
}