<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
   font-family: 'NanumGothic';
   src: url(NanumFont_TTF_ALL/NanumGothic.ttf) format('truetype');
}

body {
   -apple-system ,BlinkMacSystemFont,"Droid
   Sans",AppleSDGothicNeo-Regular,"Roboto","NanumBarunGothic","Segoe
   UI","Helvetica",Arial,sans-serif;
   color: black;

   
}

.img1 {
   padding-top: 100px;
}

.text1 {
   padding: 5px 10px;
   text-align: center;
   position: absolute;
   top: 25%;
   left: 10%;
}

.text2 {
   padding: 5px 10px;
   text-align: center;
   position: absolute;
   top: 30%;
   left: 10%;
}

.img2 {
   
}

.text3 {
   padding: 5px 10px;
   text-align: center;
   position: absolute;
   top: 145%;
   left: 10%;
}

.text4 {
   padding: 5px 10px;
   text-align: center;
   position: absolute;
   top: 150%;
   left: 10%;
}

.text5 {
   padding-bottom: 50px;
   padding-top: 100px;
   padding-left: 50px;
}

.text6 {
    padding-left: 300px; 
   padding-bottom: 50px;
   height: 900px;
   justify-content: center; /*가로에서 가운데에 요소(자식요소)를 배치하겠다*/
   align-items: center; /* 세로에서 가운데에 요소를 배치하겠다 */
}



.text8 {
   height: 900px;
   padding-left: 200px;
   background: #f8f8f8;
}

.ul6 {
   background:
      url("https://s3.marpple.co/s/5/marpple2/img/etc/process/bg1.jpg")
      no-repeat -63px 0;
   padding: 380px 0 100px;
   font-size: 14px;
}

.ul6 ul {
   list-style: none;
   margin: 0;
   padding: 0;
}

.ul6 li {
   margin: 0 0 0 13px;
   padding-right: 30px; border : 0;
   float: left;
   border: 0
}
.ul8 {
   font-size: 12px;
}
.ul8 ul {
   margin: 0 -120px 0 -45px;
   padding: 0px;
} 

.ul8 li {
   margin: 0 0 0 13px;
   padding-right: 30px; border : 0;
   float: left;
   padding: 0 50px 50px 0;
   height: 240px;
}

.title {
   margin: 0 0 20px;
   line-height: 25px;
}

.desc {
   line-height: 24px;
}
.h38 {
   padding: 100px 0 50px;
}
</style>
</head>
<body>
 <jsp:include page="header.jsp" />
<div class="img1">
<img src="resources/img/title_img1.jpg" style="width:100%; height: 1100PX;">
</div>
<div class="text1">
<font size="5" color="black">
<b>IkeHale</b>
</font>
</div>
<div class="text2" style="text-align: left;">
<font color="black">
고객 서비스 대한 엄격한 기준, 최상의 상품과 최고의 커스텀 프린팅을 경험하세요.<br><br>
오직 당신만을 위한, 세상에 단 하나뿐인 상품을 만듭니다.<br><br>
커스텀 제품은 고객의 창의성에서부터 출발하여 전문성과 프로정신으로 무장한 저희들의 손 끝에서 마무리됩니다.<br><br>
추억과 우정, 가족과 일터, 목표와 팀웍, 개성과 뜻, 이름과 생일까지<br><br>
고객의 소중한 이야기에 열정을 담아 최고의 상품을 만들고 있습니다.<br><br>
</font>
</div>

<div class="img2">
<img src="resources/img/title_img2.jpg" style="width:100%;  height: 1100PX;">
</div>
<div class="text3">
<font size="3" color="white">
<b>IkeHale은 다릅니다.</b>
</font>
</div>
<div class="text4" style="text-align: left;" >
<font color="white">
고객 서비스 대한 엄격한 기준, 최상의 상품과 최고의 커스텀 프린팅을 경험하세요.<br><br>
오직 당신만을 위한, 세상에 단 하나뿐인 상품을 만듭니다.<br><br>
커스텀 제품은 고객의 창의성에서부터 출발하여 전문성과 프로정신으로 무장한 저희들의 손 끝에서 마무리됩니다.<br><br>
추억과 우정, 가족과 일터, 목표와 팀웍, 개성과 뜻, 이름과 생일까지<br><br>
고객의 소중한 이야기에 열정을 담아 최고의 상품을 만들고 있습니다.<br><br>
</font>
</div>
<div class="text5">
<h3>주문부터 배송까지</h3>
</div>
<div class="text6">
   <ul class="ul6">
         <li>
            <div class="title">
               1 <br> Customizing <br> 커스터마이징
            </div>
            <div class="desc">
               IkeHale에는 고객의 아이디어를 조금 더 스페셜하게 만들어 줄 수 있는<br>
               커스텀 컨텐츠 기능이 준비되어 있습니다. 고객의 경험 만족도는<br>
               기술의 완성도와 직결됨을 알기에 IkeHale의 개발자들은 오늘도<br>
               타협없이 기술 개발에 몰두하고 있습니다.<br><br>
               IkeHale은 고객들에게 편의성을 제공하기 위해 1:1 상담 서비스를<br>
               제공하고 있습니다. 이미지 업로드가 되지 않거나 FAQ에서는<br>
               찾을 수 없는 어려움이 있을때 언제든지 이용이 가능합니다.<br>
            </div>
         </li>
         <li>
            <div class="title">
               2 <br> Receiving Order / Checking the Design <br> 주문 접수 및 디자인 검수
            </div>
            <div class="desc">
               결제가 완료되면 커스터마이징 과정을 거친 상품이 IkeHale 본사에<br>
               접수됩니다. 커스터마이징 프린팅의 베이스가 되는 기본 실루엣<br>
               상품의 색상 및 사이즈를 꼼꼼히 확인 후 컨텐츠 프린팅 및 제작<br>
               과정에 들어갑니다.<br><br>
               상품 재고확인 후에 파일에 이상은 없는지, 이미지 해상도는<br>
               괜찮은지 상품의 완성도를 높이기 위해 커스터마이징 디자인에<br>
               대한 검수절차를 진행합니다.<br>
            </div>
         </li>
         <li>
            <div class="title">
               3 <br> Manufactoring / Shipping <br> 상품 제작 및 배송
            </div>
            <div class="desc">
               IkeHale은 고객들에게 퀄리티 높은 상품을 제공하기 위해 다양한<br>
               프린팅이 가능한 자체공장을 겸비하고 있으며, 프린팅 전문 인력과<br>
               IT 전문 인력 운용 등 온라인에서의 경험을 오프라인까지 그대로<br>
               전달하기 위해 꾸준히 노력하고 있습니다.<br><br>
               제작이 완료된 상품은 주말 및 공휴일을 제외하고 2-4일 내에<br>
               배송해 드리며, 단체 상품의 경우 1주일 내에 배송해 드립니다.<br>
               배송이 완료되기 전까지 마플은 긴장을 늦추지 않습니다.<br>
            </div>
         </li>
      </ul>
</div>

<div class="text8">
<h3 class="h38">직접 경험한분들이 이야기합니다.</h3>
   <ul class="ul8">
      <li>
      <img src="resources/img/100_1.jpg" alt="" height="100" width="100"><br><br>
      <span class="id">leedeasan +</span>
      <p>
      도안 그대로 나와서 너무 좋아요. 프린팅 방식도 마음에<br>
      들고 배송도 빨라 만족스럽습니다. 배송전까지 중간중간에<br>
      제작 상황에 대해 문자 보내주시는 것도 친절하고<br>
      감사했어요. 특별한 생일선물이 될 것 같습니다.<br>
      </p>
      </li>

      <li>
      <img src="resources/img/100_2.png" alt="" height="100" width="100"><br><br>
      <span class="id">janson +</span>
      <p>
      원하는 콘텐츠를 원하는 옷에, 원하는 컬러와 디자인으로<br>
      직접 선택하는 맛이 있어요. 감각이 떨어지는 저도 다양한<br>
      콘텐츠를 추가해 근사하고 개성있는 옷을 만들 수 있었던<br>
      IkeHale!<br>
      </p>
      </li>
      
      <li>
      <img src="resources/img/100_3.jpg" alt="" height="100" width="100"><br><br>
      <span class="id">heongwoo +</span>
      <p>
      퀄리티가 장난 아니에요! 선물용으로 친구 이니셜을 넣어<br>
      만들었는데 제가 갖고 싶을 정도로 마음에 들어요. 다음에는<br>
      커플티나 개인 티셔츠를 구입해야겠어요.<br>
      </p>
      </li>
      
      <li>
      <img src="resources/img/100_4.jpg" alt="" height="100" width="100"><br><br>
      <span class="id">ducksoo +</span>
      <p>
      역시 IkeHale은 옳습니다. 내게 아무 의미 없는 기성<br>
      티셔츠들보다 디자인, 스타일, 프린팅 모두 내가 선택하는,<br>
      이런게 진짜 멋이죠. 이번에도 프린팅은 GOOD!<br>
      </p>
      </li>
      
      <li>
      <img src="resources/img/100_5.jpg" alt="" height="100" width="100"><br><br>
      <span class="id">seongyong +</span>
      <p>
      초창기부터 애용했는데 프린팅방식이 업그레이드된 이후<br>
      300퍼센트 만족하고 있습니다. 최고입니다. 저만의 레이블<br>
      MD 제작에 마플이 지대한 공헌을 하고 있습니다.<br>
      감사합니다.<br>
      </p>
      </li>
      
      <li>
      <img src="resources/img/100_6.jpg" alt="" height="100" width="100"><br><br>
      <span class="id">marooooo +</span>
      <p>
      제가 성격이 꼼꼼한 편이라 구매 결정까지 오래 망설였는데<br>
      받고 보니 구매하기를 정말 잘 했다는 생각이 드네요.<br>
      프린팅도 견고하고 옷 재질도 제가 가진 티셔츠 중에서 가장<br>
      질기고 튼튼한 것 같아요. 잘 입을게요, 감사합니다.<br>
      </p>
      </li>
      
      <li>
      <img src="resources/img/100_7.jpg" alt="" height="100" width="100"><br><br>
      <span class="id">jangman0707 +</span>
      <p>
      이름을 넣어볼까 하고 이것저것 찾다보니 옆에 뜨는 창.<br>
      쉽게 티셔츠 중앙에 배치할 수 있고 글씨체, 색상 변경도<br>
      가능하니 패션디자이너가 되면 이런 기분일까 싶었어요.<br>
      </p>
      </li>
      
      <li>
      <img src="resources/img/100_8.jpg" alt="" height="100" width="100"><br><br>
      <span class="id">moon4005 +</span>
      <p>
      옷에도 개성이 있어야 합니다. 기성복을 입으면 언제<br>
      어디에서 나와 똑같은 옷을 입은 사람을 만날지 모르죠.<br>
      누구나 한두번은 비슷한 경험이 있을거에요. 세상에서 오직<br>
      나만 갖고 있는 옷을 만들고 싶습니다.<br>
      </p>
      </li>
   </ul> 
</div>
      <jsp:include page="footer.jsp" />
</body>
</html>