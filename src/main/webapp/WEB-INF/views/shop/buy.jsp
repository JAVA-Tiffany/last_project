<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   
   function db() {
      var order_id = '${order_id}';
      var day = '${date}';
      var totalprice ='${buydto.total}';
      var method ='card';
      var addr1 = '${buydto.addr1}';
      var addr2 = '${buydto.addr2}';
      var addr3 = '${buydto.addr3}';

      
      $.ajax({
         url: "payin",
         type : "POST",
         data : {order_id:order_id, day:day, totalprice:totalprice, method:method, addr1:addr1, addr2:addr2, addr3:addr3},
         success:function(data){
            alert('성공');
            window.close();
         },
         error:function(data){
            alert('실패');
         }
            
      });
   }


</script>
</head>

<body>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
<script>
BootPay.request({
   price: '${buydto.total}', 
   application_id: "5efe7c794f74b40021f2c0f2",
   name: '${buydto.lPro}', 
   pg: 'inicis',
   method: 'card', 
   show_agree_window: 1, 
   items: [
      {
         item_name: '나는 아이템', 
         qty: 1,
         unique: '123', 
         price: 1, 
         cat1: '${buydto.type}', 
      }
   ],
   user_info: {
      username: '${buydto.name}',
      email: '${buydto.email}',
      addr: '${buydto.addr1} ${buydto.addr2} ${buydto.addr3}',
      phone: '${buydto.phon}'
   },
   order_id: '${order_id}', 
   params: {callback1: 'item_name', callback2: 'item_name', customvar1234: 'rechard'},
   account_expire_at: '${date}', 
   extra: {
       start_at: '${date}', 
      end_at: '2022-05-10', 
        vbank_result: 1, 
        quota: '0,2,3' 
   }
}).error(function (data) {
   console.log(data);
   window.close();
}).cancel(function (data) {
   console.log(data);
   window.close();
}).ready(function (data) {
   console.log(data);
}).confirm(function (data) {
   console.log(data);
   var enable = true; 
   if (enable) {
      BootPay.transactionConfirm(data); 
   } else {
      BootPay.removePaymentWindow(); 
      window.close();
   }
}).close(function (data) {

    console.log(data);
   
    
}).done(function (data) {
   db();
   console.log(data);
});
</script>
</body>
</html>