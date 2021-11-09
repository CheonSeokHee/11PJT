<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>



<html lang="ko">


<head>
<meta charset="EUC-KR">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"> </script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

<script type="text/javascript">

function fncUpdateProduct(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	
	
	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
	
	
}

$(function() {
	console.log("hihi");
	
	$("#datePicker").datepicker({		
		  showOn: "button",
		  dateFormat: 'yy-mm-dd',
	      buttonImage: "../images/ct_icon_date.gif",
	      buttonImageOnly: true,
	      buttonText: "Select date"
	 });

	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "button.btn.btn-primary"  ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('����')" ).html() );
		fncUpdateProduct();
	});


	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "a[href='#' ]").on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('���')" ).html() );
		
		history.go(-1);
});	
	
});

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />
	

<div class="container">
	
	<div class="page-header text-center">
	       <h3 class=" text-info">��ǰ��������</h3>
	       <h5 class="text-muted">��ǰ��<strong class="text-danger"> �ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
	    
<form class="form-horizontal">	
	
	<div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}" readonly>	
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">��ǰ��ȣ�� �����Ұ�</strong>
		      </span>	      		    
		    </div>
		  </div>
	
	<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" placeholder="��ǰ�� ����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������ </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail"  value="${product.prodDetail }" placeholder="��ǰ������ ����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">���� ����</label>
		    <div class="col-sm-4">
		      <input type="text" name ="manuDate" id="datePicker" class="form-control"  value="${product.manuDate}" placeholder="�������ڸ� �Է��Ͻÿ�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price"  value="${product.price }" placeholder="���� ����">
		    </div>
		  </div>
		  
		<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName" name="fileName"  value="${product.fileName }" placeholder="���� ����">
		    </div>
		  </div>
	
	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>		 
</form>
</div>
</body>
</html>
<!-- <form name="detailForm" method="post"> -->

<%-- <input type="hidden" name="prodNo" value="${product.prodNo }"/> --%>


<!-- <table width="100%" height="37" border="0" cellpadding="0" cellspacing="0"> -->
<!-- 	<tr> -->
<!-- 		<td width="15" height="37"> -->
<!-- 			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/> -->
<!-- 		</td> -->
<!-- 		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;"> -->
<!-- 			<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="93%" class="ct_ttl01">��ǰ����</td> -->
<!-- 					<td width="20%" align="right">&nbsp;</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 		<td width="12" height="37"> -->
<!-- 			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;"> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write"> -->
<!-- 			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<!-- 			<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="105"> -->
<!-- 						<input 	type="text" name="prodName" class="ct_input_g"  -->
<%-- 										style="width: 100px; height: 19px" maxLength="20" value="${product.prodName }"> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write"> -->
<!-- 			��ǰ������ <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<%-- 			<input type="text" name="prodDetail" value="${product.prodDetail }"  class="ct_input_g"  --%>
<!-- 						style="width: 100px; height: 19px" maxLength="10"	minLength="6"> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write"> -->
<!-- 			�������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<%-- 			<input type="text" readonly="readonly" name="manuDate" value="${product.manuDate}" 		 --%>
<!-- 						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp; -->
<!-- 						<img 	src="../images/ct_icon_date.gif" width="15" height="15"  -->
<!-- 									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" /> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write"> -->
<!-- 			���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<%-- 			<input type="text" name="price" value="${product.price }" --%>
<!-- 						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;�� -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">��ǰ�̹���</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<!-- 			<input	type="text" name="fileName" class="ct_input_g"  -->
<%-- 						style="width: 200px; height: 19px" maxLength="13" value="${product.fileName }"/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- </table> -->


<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;"> -->
<!-- 	<tr> -->
<!-- 		<td width="53%"></td> -->
<!-- 		<td align="right"> -->
<!-- 			<table border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif" width="17" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;"> -->
<!-- 						���� -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td width="30"></td> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif"width="17" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"> -->
<!-- 						��� -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
<!-- </form> -->