import {NewsData} from '../model/NewsData'
import {getNewsDatas} from '../model/NewsDataModel'
import router from '@system.router'
import {getDate} from '../model/NewsDataModel'
import App from '@system.app'
import {NewsSwiper} from './NewsSwiper'
@Entry
@Component

struct NewsMain {
  build() {
    Column() {
      NewsTypeComponent()
    }
  }
}

/**
* 主页顶部类型新闻组件
*/
@Component
struct NewsTypeComponent {
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

/**
 * 主页新闻列表组件
 */
@Component
struct NewsListPage {
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
            uri: 'pages/detail',
            params:{
              newsItem: this.newsItem
            }
          })
      }
    })
  }
}

@Component
struct HotItems {
  build(){
    Column() {
      Row() {
        Text("1").fontSize(14).fontColor(Color.Red).margin({ left: 10, right: 10 })
        Text("回顾本届奥运会")
          .fontSize(12)
          .fontColor(Color.Blue)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(300)
        Text("爆")
          .margin({ left: 6 })
          .textAlign(TextAlign.Center)
          .fontSize(10)
          .fontColor(Color.White)
          .fontWeight(600)
          .backgroundColor(0x770100)
          .borderRadius(5)
          .width(15)
          .height(14)
      }.width('100%').margin(5)
      .onClick(() => {
        {
          router.push({ uri: 'pages/detail',
            params:{
              newsItem:getDate(12)
            }
          })
        }
      })

      Row() {
        Text("2").fontSize(14).fontColor(Color.Red).margin({ left: 10, right: 10 })
        Text("马龙3:2勒布朗")
          .fontSize(12)
          .fontColor(Color.Blue)
          .fontWeight(300)
          .constraintSize({ maxWidth: 200 })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text("热")
          .margin({ left: 6 })
          .textAlign(TextAlign.Center)
          .fontSize(10)
          .fontColor(Color.White)
          .fontWeight(600)
          .backgroundColor(0xCC5500)
          .borderRadius(5)
          .width(15)
          .height(14)
      }.width('100%').margin(5)
      .onClick(() => {
        {
          router.push({ uri: 'pages/detail',
            params:{
              newsItem:getDate(13)
            }
          })
        }
      })




      Row() {
        Text("3").fontSize(14).fontColor(Color.Orange).margin({ left: 10, right: 10 })
        Text("中国国庆假期消费市场火热")
          .fontSize(12)
          .fontColor(Color.Blue)
          .fontWeight(300)
          .maxLines(1)
          .constraintSize({ maxWidth: 200 })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text("热")
          .margin({ left: 6 })
          .textAlign(TextAlign.Center)
          .fontSize(10)
          .fontColor(Color.White)
          .fontWeight(600)
          .backgroundColor(0xCC5500)
          .borderRadius(5)
          .width(15)
          .height(14)
      }.width('100%').margin(5)
      .onClick(() => {
        {
          router.push({ uri: 'pages/detail',
            params:{
              newsItem:getDate(14)
            }
          })
        }
      })

      Row() {
        Text("4").fontSize(14).fontColor(Color.Grey).margin({ left: 10, right: 10 })
        Text("亚运会闭幕式")
          .fontSize(12)
          .fontColor(Color.Blue)
          .fontWeight(300)
          .constraintSize({ maxWidth: 200 })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }.width('100%').margin(5)
    }.width('100%')
    .height("15%")
    .onClick(() => {
      {
        router.push({ uri: 'pages/detail',
          params:{
            newsItem:getDate(15)
          }
        })
      }
    })
  }

}

@Component
struct mySwiper{
  private swiperController: SwiperController = new SwiperController()
  build(){
    Swiper(this.swiperController) {
      //Image(this.newsItem.imgUrl).width("35%").height(80).margin(10)
      Image($rawfile('bqb1.jpg')).width('90%').height("100%")
        .onClick(() => {
          {
            router.push({ uri: 'pages/detail',
              params:{
                newsItem:getDate(16)
              }
            })
          }
        })

      Image($rawfile('bqb2.jpg')).width('90%').height("60%")
        .onClick(() => {
          {
            router.push({ uri: 'pages/detail',
              params:{
                newsItem:getDate(17)
              }
            })
          }
        })

      Image($rawfile('bqb3.jpg')).width('90%').height("60%")
        .onClick(() => {
          {
            router.push({ uri: 'pages/detail',
              params:{
                newsItem:getDate(18)
              }
            })
          }
        })

      // Text("0")
      //   .width('90%')
      //   .height('100%')
      //   .backgroundColor(Color.Gray)
      //   .textAlign(TextAlign.Center)
      //   .fontSize(30)
      //
      // Text("1")
      //   .width('90%')
      //   .height('100%')
      //   .backgroundColor(Color.Green)
      //   .textAlign(TextAlign.Center)
      //   .fontSize(30)
      //
      // Text("2")
      //   .width('90%')
      //   .height('100%')
      //   .backgroundColor(Color.Pink)
      //   .textAlign(TextAlign.Center)
      //   .fontSize(30)
    }
    .loop(true)
    .autoPlay(true)
    .interval(1000)
    .height("20%")
  }
}