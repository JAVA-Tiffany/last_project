<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
</head>

<body>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
<script>
BootPay.request({
   price: '1000', 
   application_id: "5efe7c794f74b40021f2c0f2",
   name: '${fpro} and others ${sum}', 
   pg: '',
   method: '', 
   show_agree_window: 1, 
   items: [
      {
         item_name: '나는 아이템', 
         qty: 1,
         unique: '123', 
         price: 1000, 
         cat1: 'TOP', 
         cat2: '티셔츠', 
         cat3: '라운드 티', 
      }
   ],
   user_info: {
      username: '장승',
      email: 'rechardjang@naver.com',
      addr: '인천 서창남순환로200 101동 1103호',
      phone: '010-5772-5132'
   },
   order_id: '513251d3r2gf153', 
   params: {callback1: 'item_name', callback2: 'item_name', customvar1234: 'rechard'},
   account_expire_at: '2020-07-20', 
   extra: {
       start_at: '2020-07-06', 
      end_at: '2022-05-10', 
        vbank_result: 1, 
        quota: '0,2,3' 
   }
}).error(function (data) {
   console.log(data);
}).cancel(function (data) {
   console.log(data);
}).ready(function (data) {
   console.log(data);
}).confirm(function (data) {
   console.log(data);
   var enable = true; 
   if (enable) {
      BootPay.transactionConfirm(data); 
   } else {
      BootPay.removePaymentWindow(); 
   }
}).close(function (data) {
    console.log(data);
    window.close();
}).done(function (data) {
   console.log(data);
});
</script>
</body>
</html>