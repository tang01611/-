import router from '@ohos.router'
import { getDate } from '../model/NewsDataModel'

@Component
//@Entry
export struct NewsSwiper{
  private swiperController: SwiperController = new SwiperController()
  build(){
    Swiper(this.swiperController) {
      //Image(this.newsItem.imgUrl).width("35%").height(80).margin(10)
      Image($rawfile('bqb1.jpg')).width('90%').height("100%")
        .onClick(() => {
          {
            router.pushUrl({
              url: '/pages/hello',
              // params:{
              //   newsItem:getDate(16)
              // }
            },(err) => {
              if (err) {
                console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                return;
              }
              console.info('Invoke pushUrl succeeded.');
            }
            )
          }
        })

      Image($rawfile('bqb2.jpg')).width('90%').height("60%")
        .onClick(() => {
          {
            router.push({ url: 'pages/detail',
              params:{
                newsItem:getDate(17)
              }
            })
          }
        })

      Image($rawfile('bqb3.jpg')).width('90%').height("60%")
        .onClick(() => {
          {
            router.push({ url: '../pages/detail',
              params:{
                newsItem:getDate(18)
              }
            })
          }
        })
    }
    .loop(true)
    .autoPlay(true)
    .interval(1000)
    .height("20%")
  }
}