<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   function post() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  var fullAddr = '';
                  var extraAddr = '';

                  if (data.userSelectedType === 'R') {
                     fullAddr = data.roadAddress;
                  } else {
                     fullAddr = data.jibunAddress;
                  }

                  if (data.userSelectedType === 'R') {
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
                  }

                  document.getElementById('post_postcode').value = data.zonecode;
                  alert(fullAddr)
                  document.getElementById('post_address').value = fullAddr;

                  document.getElementById('sample6_address2').focus();
               }
            }).open();
   }

   //체크박스 전체선택 및 전체 해제
   function cAll() {

      if ($("#chk_all").prop("checked") == true) {
         alert("체크 온")
         $("#chk2").attr("checked", true);
         $("#chk3").attr("checked", true);
         $("#chk4").attr("checked", true);
      } else {
         alert("체크 dhvm")
         $("#chk2").attr("checked", false);
         $("#chk3").attr("checked", false);
         $("#chk4").attr("checked", false);
      }

   }
   
   //바로 결제로 가는 form
    function buy() {
       var buy = document.bbuy;
        var popupX = (window.screen.width / 2) - (1300 / 2);
        var popupY= (window.screen.height /2) - (850 / 2);
        openWin = window.open("",
                "bbbuy", 'status=no, height=750, width=1100, left='+ popupX + ', top='+ popupY +
          ' , screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
        buy.action="buy";
        buy.method="post";
        buy.target="bbbuy";
        buy.submit();
        
    }
</script>


<style type="text/css">
#input_text1 {
   display: none;
   background-color: red;
   cursor: default;
   box-sizing: border-box;
   margin: 3px 3px 3px 4px;
   padding: initial;
   border: initial;
   "
}
</style>
</head>
<body>
   <%@include file="../default/header.jsp"%>
   <div
      style="margin-top: 250px; max-width: 1000px; margin: auto; padding: 56px 0 120px;">
      <div style="display: flex; flex: row;">
         <div
            style="text-align: left; width: 50%; font-family: 'CircularStd'; display: block; color: #000; font-weight: bold; font-size: 24;">
            <h2>주문서 작성</h2>
         </div>
         <div style="text-align: right; width: 50%;">
            <h4 style="color: gray; font-size: 14px; display: inline-block;">장바구니&nbsp;&nbsp;</h4>
            <h4 style="color: black; font-size: 17px; display: inline-block;">>&nbsp;주문서
               작성&nbsp;&nbsp;</h4>
            <h4 style="color: gray; font-size: 14px; display: inline-block;">>&nbsp;주문
               완료&nbsp;</h4>
         </div>
      </div>

<form name="bbuy" method="post">
   
      <p>
      <div>
         <div
            style="float: left; background-color: #fff; margin-bottom: 8px; width: 600px; padding: 24px 0; font-size: 14px;">
            <div>
               <h4 style="margin-left: 15px;">제작 요청 사항</h4>
            </div>
            <div style="display: flex; flex: row;">
               <div style="margin: 0 24px; display: block;">
                  <textarea
                     style="width: 520px; height: 72px; border: solid 1px #d5dbe0; overflow: auto; box-sizing: border-box; padding: 16px; font-size: 14px; outline: none; color: -internal-light-dark-color(black, white); word-spacing: normal; text-indent: 9px; display: inline-block; background-color: light-dark-color(rgb(255, 255, 255), rgb(59, 59, 59)); flex-direction: column; cursor: text; white-space: pre-wrap; overflow-wrap: break-word; outline-color: black;"
                     placeholder="상품 제작 요청사항이 있으면 작성해주세요." name="ProRequest"></textarea>
                  <p
                     style="color: #868e96; font-size: 12px; line-height: 1.83; margin-bottom: 0; display: block;">자수
                     작업은 디자인에 따라 가능 여부가 달라지며 추가 비용이 발생합니다.</p>
               </div>
            </div>
         </div>
         <div
            style="float: right; width: 350px; background-color: #fff; margin-bottom: 10px; padding: 24px 0; height: 160px;">
            <div style="margin-bottom: 35px; margin: 0 24px;">
               <h4>총 결제금액</h4>
            </div>
            <div
               style="display: flex; margin-bottom: 10px; align-items: center; justify-content: space-between; color: #495057; font-size: 14px;">
               <span style="line-height: 1.17; color: #495057; font-size: 14px;">총
                  수량</span> <span style="margin-left: 140px;">${sum }개</span>
                  <input type="hidden" name="sum" value="${sum }"> 
            </div>
            <div
               style="display: flex; margin-bottom: 10px; align-items: center; justify-content: space-between; color: #495057; font-size: 14px;">
               <span style="line-height: 1.17; color: #495057; font-size: 14px;">총
                  상품 금액</span> <span
                  style="font-weight: bold; line-height: 1.14; font-size: 14px;">
                  <fmt:formatNumber value="${total-2500 }" pattern="#,###"/>
                  원</span>
            </div>
            <div
               style="display: flex; margin-bottom: 10px; align-items: center; justify-content: space-between; color: #495057; font-size: 14px;">
               <span style="line-height: 1.17; font-size: 14px;">배송비</span> <span
                  style="font-weight: bold; line-height: 1.14; font-size: 14px;">2,500원</span>
            </div>
            <p></p>
            <div
               style="display: flex; align-items: center; justify-content: space-between; font-weight: bold; font-size: 14px;">
               <span style="font-size: 14px; font-weight: bold;">최종 결제금액</span> <span
                  style="font-size: 14px; line-height: 1; font-weight: bold;">
                  <fmt:formatNumber value="${total }" pattern="#,###"/>
                  원</span>
                  <input type="hidden" value="${total }" name="total">
            </div>
            <div
               style="width: 350px; background-color: #fff; margin-bottom: 8px; padding: 24px 0; box-sizing: border-box; display: block;">
               <div style="display: block; font-size: 14px; font-weight: bold;">
                  주문 상품정보</div>
               <c:forEach var="dto" items="${list}">
               <input type="hidden" value="${dto.type}" name="type">
                  <hr style="width: 90%;">
                  <div
                     style="display: flex; letter-spacing: -1.px; font-size: 14px;">
                     <div
                        style="width: 96px; height: 96px; margin-right: 24px; cursor: pointer;">
                        <img style="height: 100px; width: 100px;" src="${dto.img}">
                     </div>
                     <div style="width: 100%; display: block;">
                        <div
                           style="display: block; margin-bottom: 16px; font-size: 12px; text-decoration: none;">
                           <label>${dto.product}</label>
                           <input type="hidden" name="lPro" value="${dto.product }">
                        </div>
                        <div style="font-size: 14px; display: flex; margin-top: 8px;">
                           <div>사이즈 free</div>
                        </div>
                        <div>
                           <div>
                              수량 : <label>${dto.num }</label>
                           </div>
                        </div>
                        <div>
                           가격 : <label>${dto.money}</label>
                        </div>
                     </div>

                  </div>
               </c:forEach>
            </div>
         </div>
      </div>


      <div
         style="background-color: #fff; margin-bottom: 8px; width: 600px; pause: 24px 0; box-sizing: border-box; letter-spacing: -1.px; font-size: 14px; color: #000;">
         <div>
            <div style="font-size: 14px; font-weight: bold; line-height: 1.14;">
               <h4 style="margin-left: 16px;">주문자 정보</h4>
            </div>
         </div>
         <div
            style="margin: 0 24px; display: block; letter-spacing: -1.px; font-size: 14px; color: #000;">
            <label
               style="display: inline-block; width: 106px; cursor: default; font-weight: normal;">이름</label>
            <input type="text"
               style="display: inline-block; margin-bottom: 16px;"
               value="${userInfo.name }">
         </div>
         <div
            style="position: relative; display: block; letter-spacing: -1.px; font-size: 14px; color: #000; margin: 0 24px;">
            <label
               style="display: inline-block; width: 106px; cursor: default; font-weight: normal;">연락처</label>
            <input type="text"
               style="display: inline-block; margin-bottom: 16px;"
               value="${userInfo.phon }" name="phon">
         </div>
         <div
            style="position: relative; display: block; letter-spacing: -1.px; font-size: 14px; color: #000; margin: 0 24px;">
            <label
               style="display: inline-block; width: 106px; cursor: default; font-weight: normal; margin-top: 10px; vertical-align: top;">이메일</label>
            <div
               style="margin: 0; display: inline-block; padding-top: 6px; padding-bottom: 16px; width: 400px;">
               <span ><label id="email">${userInfo.email }</label> </span>
               <input type="hidden" value="${userInfo.email }" name="email">
               <div>위 이메일로 주문 내역 메일이 전송됩니다. 사용 가능한 메일인지 확인해주세요.</div>
            </div>
         </div>

         <div
            style="background-color: #fff; margin-bottom: 8px; width: 600px; padding: 24px 0; box-sizing: border-box; letter-spacing: -.1px;">
            <div
               style="background: #fafafa; padding: 12px 16px 16px 16px; display: block; letter-spacing: -.1px; margin-bottom: 24px;">
               <h4>택배 배송 안내</h4>
               <table>
                  <tbody>
                     <tr>
                        <th style="width: 60px;">배송지역</th>
                        <td>CJ대한통운 / 전국지역</td>
                     </tr>
                     <tr>
                        <th style="width: 70px;">택배 상담</th>
                        <td>1588-1255 (평일 9AM - 6PM / 토요일 9AM ~ 1PM)</td>
                     </tr>
                     <tr>
                        <th style="width: 60px;">배송비</th>
                        <td>주문건당 2,500원</td>
                     </tr>
                     <tr>
                        <th style="width: 60px;">배송기간</th>
                        <td>택배사로 상품 출고 후 영업일 기준 1~2일 이내 수령(단, 지역 및 배송사 상황에 따라 달라질 수
                           있음)</td>
                     </tr>
                  </tbody>
               </table>
               <ul>
                  <li>주문 제작 상품의 특성상 기본 무지 상품의 재고 현황보다 주문 수량이 초과될 시 제작 일정 및 출고가
                     늦어질 수 있습니다.</li>
                  <li>제품은 100% 주문 제작으로 만들어지며, 출고 이후에도 택배사의 사정에 따라 변수가 생길 수
                     있습니다.</li>
                  <li>주문 전 1:1 상담 / 전화 상담 등을 통해 제작 일정을 확인하신 후 주문하시면 친절하게
                     안내해드립니다.</li>
                  <li>대량 단체주문건의 경우에는 주문 및 결제 완료 후 영업일 기준으로 약 7 ~ 10일 가량 소요될 수
                     있습니다.</li>
               </ul>
            </div>
         </div>


         <div
            style="background-color: #fff; margin-bottom: 8px; width: 600px; padding: 24px; box-sizing: border-box; display: black;">
            <div
               style="margin-bottom: 24px; line-height: 1.14; box-sizing: border-box; display: flex; align-items: center; justify-content: space-between; margin: 0 24px;">
               <div
                  style="font-size: 14px; font-weight: bold; display: block; line-height: 1.14;">배송지
                  정보</div>
            </div>
            <p></p>
            <div style="margin: 0 24px; display: block;">
               <div
                  style="padding-bottom: 17px; position: relative; margin-bottom: 17px; border-bottom: 1px solid #d5dbe0;">
                  <label style="margin-right: 16px; cursor: default;"> <span
                     style="cursor: default;"> <input type="checkbox"><span></span></span><span>주문자
                        정보와 동일</span></label>
               </div>
               <div style="position: relative; display: block;">
                  <label
                     style="display: inline-block; width: 80px; cursor: default;">
                     수령인</label> <input
                     style="display: inline-block; margin-bottom: 16px; font-size: 14px; height: 10px; padding: 8px 16px; width: 350px;"
                     type="text" name="name" value="${userInfo.name }">
               </div>
               <div style="position: relative; display: block;">
                  <label
                     style="display: inline-block; width: 80px; cursor: default;">연락처</label>
                  <input
                     style="display: inline-block; margin-bottom: 16px; font-size: 14px; height: 10px; padding: 8px 16px; width: 350px;"
                     type="text" name="hpon" placeholder="- 없이 01000000000"
                     value="${userInfo.phon }">
               </div>
               <div style="position: relative; display: block;">
                  <label
                     style="display: inline-block; width: 80px; cursor: default;">배송지</label>
                  <input
                     style="display: inline-block; margin-bottom: 16px; font-size: 14px; height: 10px; padding: 8px 16px; width: 180px;"
                     type="text" id="post_postcode" placeholder="우편번호" name="addr1" value="${userInfo.addr1 }"> <input
                     onclick="post()"
                     style="width: 30%; border: 1px solid red; background-color: rgba(0, 0, 0, 0); padding: 5px; margin-left: 13px;"
                     type="button" value="우편번호 찾기"> <input
                     style="margin-left: 85px; display: inline-block; margin-bottom: 16px; font-size: 14px; height: 25px; width: 377px;"
                     type="text" id="post_address" placeholder="주소"
                     value="${userInfo.addr2 }" name="addr2"> <input
                     style="margin-left: 85px; display: inline-block; margin-bottom: 16px; font-size: 14px; height: 25px; width: 377px;"
                     type="text" id="sample6_address2" placeholder="상세 주소를 입력해주세요." name="addr3" value="${userInfo.addr3 }">
               </div>
               <div style="position: relative; display: block;">
                  <label
                     style="display: inline-block; width: 80px; cursor: default;">배송메모</label>
                  <select
                     style="display: inline-block; margin-bottom: 16px; border: solid 1px #d5dbe0; height: 30px; padding: 8 16px; box-sizing: border-box;"
                     name="delRequest">
                     <option value="">배송 메모를 선택해주세요.</option>
                     <option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
                     <option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
                     <option value="부재시 전화주시거나 문자 남겨주세요.">부재시 전화주시거나 문자
                        남겨주세요.</option>
                  </select> <input
                     style="margin-bottom: 0; margin-left: 85px; display: inline-block; font-size: 14px;"
                     type="text" name="">
               </div>
            </div>
         </div>


         <div
            style="background-color: #fff; margin-bottom: 8px; width: 600px; padding: 24px 0; box-sizing: border-box; display: block;">
            <div
               style="margin-bottom: 24px; line-height: 1.14; box-sizing: border-box; display: flex; align-items: center; justify-content: space-between; margin: 0 24px;">
               <div style="font-size: 14px; font-weight: bold;">총 결제금액</div>
            </div>
            <p></p>
            <div style="margin: 0 24px; display: block; font-size: 14px;">
               <div style="padding-bottom: 16px; display: block;">
                  <div
                     style="margin-bottom: 10px; display: flex; align-items: center; justify-content: space-between; font-size: 14px; color: #495057;">
                     <span style="font-size: 14px;">총 수량</span> <span
                        style="font-weight: bold; line-height: 1.14; font-size: 14px;">${sum }개</span>
                  </div>
                  <div
                     style="margin-bottom: 10px; display: flex; align-items: center; justify-content: space-between; font-size: 14px; color: #495057;">
                     <span style="font-size: 14px;">총 상품 금액</span> <span
                        style="font-weight: bold; line-height: 1.14; font-size: 14px;">
                        <fmt:formatNumber value="${total-2500 }" pattern="#,###"/>
                        원</span>
                  </div>
                  <div
                     style="margin-bottom: 10px; display: flex; align-items: center; justify-content: space-between; font-size: 14px; color: #495057;">
                     <span style="font-size: 14px;">배송비</span> <span
                        style="font-weight: bold; line-height: 1.14; font-size: 14px;">2,500원</span>
                  </div>
               </div>
               <div
                  style="display: flex; align-items: center; justify-content: space-between; font-weight: bold; font-size: 14px;">
                  <span style="font-size: 14px;">최종 결제금액</span> <span
                     style="font-weight: bold; font-size: 16px;">
                     <fmt:formatNumber value="${total }" pattern="#,###"/>
                     원</span>
               </div>
            </div>
         </div>


         <div
            style="font-size: 12px; margin-bottom: 8px; width: 600px; padding: 24px 0; box-sizing: border-box; display: block;">
            <label
               style="font-size: 14px; font-weight: bold; margin: 0 24px; cursor: default;">
               <span style="font-size: 14px; font-weight: bold; cursor: default;">
                  <input type="checkbox" onclick="cAll();" id="chk_all"
                  class="input_text1"> <span></span>
            </span> <span style="font-size: 14px; font-weight: bold; cursor: default;">아래
                  내용 확인 및 모두 동의</span>
            </label>
            <div
               style="margin: 24px 24px 0 24px; display: block; font-size: 12px;">
               <div
                  style="padding-bottom: 16px; position: relative; margin-bottom: 16px; border-bottom: 1px solid #d5dbe0; display: block; font-size: 12px;">
                  <label style="cursor: default; font-size: 12px;"> <span
                     style="cursor: default; font-size: 12px; font-weight: bold;">
                        <input type="checkbox" name="chk" id="chk2" class="input_text1">
                        <span></span>
                  </span> <span>구매 동의</span>
                  </label>
                  <div
                     style="color: #868e96; margin-top: 8px; line-height: 1.83; display: block; font-size: 12px;">
                     상품 주문시의 미리보기 이미지는 최종 완성된 상품과 일부 다를 수 있습니다. 주문제작 상품인 관계로 취소 및 환불은
                     제작준비중일 때만 가능하며, 배송 완료 후 단순 변심에 의한 교환/반품은 불가합니다. 결제 전 주문내용을 반드시
                     확인해 주시기 바랍니다. 주문할 상품, 배송 정보를 확인하였으며, 구매에 동의하시겠습니까? (전자상거래법 제 8조
                     2항)</div>
               </div>
               <div
                  style="padding-bottom: 16px; position: relative; margin-bottom: 16px; border-bottom: 1px solid #d5dbe0; font-size: 12px;">
                  <label style="cursor: default; font-size: 12px;"> <span
                     style="cursor: default; font-size: 12px;"> <input
                        type="checkbox" name="chk" id="chk3"><span></span></span> <span
                     style="cursor: default; font-size: 12px;">이용약관 동의</span>
                  </label>
               </div>
               <div
                  style="padding-bottom: 16px; position: relative; margin-bottom: 16px; border-bottom: 1px solid #d5dbe0; font-size: 12px;">
                  <label style="cursor: default; font-size: 12px;"> <span
                     style="cursor: default; font-size: 12px;"> <input
                        type="checkbox" name="chk" id="chk4"><span></span></span> <span
                     style="cursor: default; font-size: 12px;">개인 정보 수집 및 이용 동의</span>
                  </label> <a class="more go_privacy" href="/kr/privacy" target="_blank">보기</a>
               </div>
            </div>
         </div>
         

            
            
         <button 
            style="margin-top: 16px; width: 100%; height: 48px; border: none; background-color: #212529; font-size: 14px; color: #fff; display: flex; align-items: center; justify-content: center; outline: none; padding: 0;"
            type="button" onclick="buy()">
<!--             1onclick="buy()"  -->
         <span>결제하기</span>
         </button>
         </form>
      </div>

   </div>

</body>
</html>