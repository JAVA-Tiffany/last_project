<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="resources/swiper/css/swiper.min.css">

  <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 600px;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width:100%;
      height: 500px;

    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
 
  </style>
</head>
<body>
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="//s3.marpple.co/files/u_1150555/2020/3/original/18891957599aa056df865f7338d1d7b0331eb18cdd7d6b1.png" style="width:100%;height:500px;"></div>
      <div class="swiper-slide"><img src="//s3.marpple.co/files/u_1150555/2020/7/original/309632908952a9938c6dd6538e5b2a5cf45f8922981dcb6.jpg" style="width:100%;height:500px;"></div>
      <div class="swiper-slide"><img src="//s3.marpple.co/files/u_1247619/2020/5/original/2388067b96a99f3ace44240ba17d76c98112e36b1347654.jpg" style="width:100%;height:500px;"></div>
      <div class="swiper-slide"><img src="//s3.marpple.co/files/u_29089/2019/3/original/f_62691_1553509822613_UTwF9cJVFQtgB0Iqi.jpg" style="width:100%;height:500px;"></div>
      <div class="swiper-slide"><img src="//s3.marpple.co/files/u_29089/2019/3/original/f_62690_1553509822613_r6OTu1y5wk2eGD7tPvSJ.jpg" style="width:100%;height:500px;"></div>
      <div class="swiper-slide"><img src="//s3.marpple.co/files/u_1298443/2020/7/original/3106381935e8f32b6bbcb0e16121fbfcdc16522e3ed6c82.jpg" style="width:100%;height:500px;"></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>

  <!-- Swiper JS -->
  <script src="resources/swiper/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</body>

</html>