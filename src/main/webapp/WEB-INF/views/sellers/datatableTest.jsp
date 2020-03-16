<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

 --><style>
.btnabs {
	position: absolute;
	margin-left: 3px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<font></font>
<font></font>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<font></font>


<script>

$(document).ready(function(){
	
	let header = "${_csrf.headerName}";
	
	let token = "${_csrf.token}";
    $('#aaatest').DataTable({
        pageLength: 3,
        bPaginate: true,
        bLengthChange: true,
        lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
        bAutoWidth: false,
        processing: true,
        ordering: true,
        serverSide: false,
        searching: true,
        ajax : {
            "url":"${pageContext.request.contextPath}/datatest2",
            "type":"POST",
			"beforeSend" : function(xhr){
				xhr.setRequestHeader(header, token)
			}
            
            /*   "data": function (item) {
            	console.log(item);
            	console.log(item.order_code);
            	
            } */
        },
        columns: [
            {data: "order_code"},
            {data: "name"}
            
        ]

    });

});
   
</script>


</head>
<body>
	<!-- DataTales Example -->
	<table class="table table-bordered" id="aaatest" width="100%"
		cellspacing="0">
		<thead>
			<tr>
				<th style="width: 50px"><input type="checkbox" id="all"></th>



				<th>주문번호</th>
				<th>상품 코드</th>
			</tr>
		</thead>
	</table>
</body>
</html>