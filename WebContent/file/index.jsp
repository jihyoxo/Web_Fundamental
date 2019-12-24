<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3>파일 업로드</h3>	
			<%-- 파일 업로드할 때 form 엘리먼트에 enctype 속성을 반드시 추가해야한다. --%>
			<form name="f" method="post" enctype="multipart/form-date" action="upload.jsp">
				<div class="form-group">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name">
					</div>
				</div> 
				
				<div class="form-group">
					<label for="exampleFormControlFile1">파일을 선택하세요.</label>
					<input type="file" class="form-control-file" id="exampleFormControlFile1">
				</div>
				
			</form>
			<div class="text-right">
				<%if(memberDto != null){ %>
				<button type="button" id="uploadFile" class="btn btn-outline-success">저장</button>
				<%} %>
			</div>

		</div>
	</div>
<!--  main end -->
<%@ include file="../inc/footer.jsp" %>
	<script>
		$(function(){
			$("#uploadFile").click(function(){
				f.submit();
			});
		});
	</script>