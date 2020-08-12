<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function isNotInMyArea( $targetObj )
{
    var isIn = true;
    var $objArr = Array();
    var opts = {
        left: 99999, right: 0, top: 99999, bottom: 0
    }
    
    if( $targetObj )
    {
        if( $targetObj.length == 1 ) {
            $objArr.push( $targetObj );
        } else {
            $objArr = $targetObj;
        }

        $.each($objArr, function(i, $obj){          
            var obj_position = $obj.offset();
            obj_position.right = parseInt( obj_position.left ) + ( $obj.width() );
            obj_position.bottom = parseInt( obj_position.top ) + parseInt( $obj.height() );
            
            if( obj_position.left < opts.left ) opts.left = obj_position.left;
            if( obj_position.right > opts.right ) opts.right = obj_position.right;
            if( obj_position.top < opts.top ) opts.top = obj_position.top;
            if( obj_position.bottom > opts.bottom ) opts.bottom = obj_position.bottom;
        });
        
        if( ( opts.left <= event.pageX && event.pageX <= opts.right )
            && ( opts.top <= event.pageY && event.pageY <= opts.bottom ) )
        {
            isIn = false;
        }
    }
    
    return isIn;
}

$(function(){
    $(document).mousedown(function( e ){
        if( isNotInMyArea ( [ $("button"), $("#menuLayer") ] ) ) {
            $("#menuLayer").hide();
        }
    });
    
    $("button").click(function(){
        if( !$("#menuLayer").is(":visible") ) {
            $("#menuLayer").show();
        }
    });
});

//    텍스트 더블 클릭시 실행
    function test_dblclick() {
       alert("텍스트 더블클릭")
       $("div").remove("#text_dblclick_event");
       $("#left_menu").append("<div id='text_dblclick_event' style='margin-top:30px'><input id='textin' type='text' placeholder='입력할 글자 입력' onchange='dblclick_end("+ch+")'></div>");
   }
   function dblclick_end(d) {
      alert($("#textin").val())
      $("div").remove("#image"+d);
      new_id="myCanvas"+d;
      $('#in').append("<div id='image"+d+"' style='width: 50px; height: 50px; z-index:"+d+"' ondblclick='test_dblclick("+d+")' onclick='imgclick("+d+")'><canvas id='myCanvas"+d+"'style='width: 350px; height: 100px;'></canvas></div>")
      $("#image"+d).draggable();
      $("#image"+d).resizable();
      ctx[count] = document.getElementById(new_id).getContext("2d");
      ctx[count].font = '40px Arial';
      ctx[count].fillText($("#textin").val(), 0, 50);
      $("div").remove("#text_dblclick_event");
   }
   
   // 이미지 클릭시 화면 투명도 절반으로 줄이는 함수
    function imgclick(d) {
        ch=d;
        $("#myCanvas"+d).resizable({
            minWidth: 50,
            minHeight: 50,
        });
        for(i=1;i<count+1;i++){
           $("#image"+i).css("opacity", "1");
        }
        $(function(){
           $("#image"+d).css("opacity", "0.5");
       });
      }
</script>
</head>
<body>
<button>레이어 보이기</button>
<a href="#" >aaaaa</a>
<p></p>
<div id="menuLayer" style="width:150px; height:250px; border:1px solid black;">레이어 바깥 아무데나 클릭하시면 사라집니다.</div>
</body>
</html>