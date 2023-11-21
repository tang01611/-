import router from '@ohos.router'
import { NewsData } from '../model/NewsData'
@Component
  /**
   * 主页新闻列表组件
   */
export struct NewsListPage {
  private newsItems: NewsData[]

  build() {
    Column() {
      List() {
        ForEach(this.newsItems, item => {
          ListItem() {
            NewsListItem({ newsItem: item })
          }
        }, item => item.newsId.toString())
      }
      .width("90%")
      .margin({ top: 12 })
      .scrollBar(BarState.Auto)
      .divider({
        strokeWidth: 1,
        startMargin: 60,
        endMargin: 10,
        color: '#ffe9f0f0'
      })
    }
  }
}

/**
 * 新闻列表条目组件
 */
@Component
struct NewsListItem {
  private newsItem: NewsData
  @Consume newsData: NewsData;
  @Provide newsID: String = this.newsData.newsId
  build() {
    Column() {
      Row() {
        Text(this.newsItem.title)
          .fontSize(17)
          .width("55%")
          .height(80)
          .maxLines(4)
          .margin(10)
          .borderRadius(24)

        Image(this.newsItem.imgUrl).width("35%").height(80).margin(10)
      }

      Divider()
        .vertical(false)
        .color("#dbd8db")
        .strokeWidth(1)
    }
    .height(101)
    .width("100%")
    .onClick(() => {
      {
        router.push(
          {
            // 跳转到指定页面
            url: 'pages/detail',
            params:{
              newsItem: this.newsItem
            }
          })
      }
    })
  }
}