<%@page import="kr.co.acorn.util.Utility"%> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page pageEncoding="utf-8" %>
<%!
public static int[] toDateKorea2(String date) {
	int[] temp = new int[3];
	String[] s = date.split(",");
	String[] s1 = s[0].split(" ");
	String m = toMonth(s1[0].trim());
	String d = s1[1].trim();
	String y = s[1].trim();
	temp[0] = Integer.parseInt(y);
	temp[1] = Integer.parseInt(m);
	temp[2] = Integer.parseInt(d);
	return temp;
}
public static String toMonth(String month) {
	if(month != null && month.equals("Jan")) {
		return "1";
	}else if(month != null && month.equals("Feb")) {
		return "2";
	}else if(month != null && month.equals("Mar")) {
		return "3";
	}else if(month != null && month.equals("Apr")) {
		return "4";
	}else if(month != null && month.equals("May")) {
		return "5";
	}else if(month != null && month.equals("Jun")) {
		return "6";
	}else if(month != null && month.equals("Jul")) {
		return "7";
	}else if(month != null && month.equals("Aug")) {
		return "8";
	}else if(month != null && month.equals("Sep")) {
		return "9";
	}else if(month != null && month.equals("Oct")) {
		return "10";
	}else if(month != null && month.equals("Nov")) {
		return "11";
	}else if(month != null && month.equals("Dec")) {
		return "12";
	}else {
		return "";
	}
}
%>
<%@ include file="../inc/header.jsp" %>  
  <!-- breadcrumb start-->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Library</li>
    </ol>
  </nav>
  <!-- breadcrumb end-->

  <!-- main start-->
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
		<%
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int day = c.get(Calendar.DATE);
			String coin = request.getParameter("coin");
			String startYear = request.getParameter("startYear");
			String startMonth = request.getParameter("startMonth");
			String startDay = request.getParameter("startDay");
			String endYear = request.getParameter("endYear");
			String endMonth = request.getParameter("endMonth");
			String endDay = request.getParameter("endDay");
			if(coin == null || coin.length()==0){
				coin = "bitcoin";
			}
			if(startYear == null || startYear.length()==0){
				startYear = String.valueOf(year-1);
			}
			if(startMonth == null || startMonth.length()==0){
				startMonth = String.valueOf(month);
			}
			if(startDay == null || startDay.length()==0){
				startDay = String.valueOf(day);
			}
			
			if(endYear == null || endYear.length()==0){
				endYear = String.valueOf(year);
			}
			if(endMonth == null || endMonth.length()==0){
				endMonth = String.valueOf(month);
			}
			if(endDay == null || endDay.length()==0){
				endDay = String.valueOf(day);
			}
			int sYear = Integer.parseInt(startYear);
			int sMonth = Integer.parseInt(startMonth);
			int sDay = Integer.parseInt(startDay);
			int eYear = Integer.parseInt(endYear);
			int eMonth = Integer.parseInt(endMonth);
			int eDay = Integer.parseInt(endDay);
		%>
		<h3>Crawling(<%=coin %>)</h3>
		<form name="f" method="post" action="list.jsp">
		  <div class="form-group row">
		    <label for="no" class="col-sm-3 col-form-label">코인선택</label>
		    <div class="form-group col-sm-9">
		      <select id="coin" name="coin" class="form-control">
		        <option selected>Coin...</option>
		        <option value="bitcoin" <%if(coin != null && coin.equals("bitcoin")){ %>selected<%} %>>비트코인</option>
		        <option value="ethereum" <%if(coin != null && coin.equals("ethereum")){ %>selected<%} %>>이더리움</option>
		        <option value="xrp" <%if(coin != null && coin.equals("xrp")){ %>selected<%} %>>리플</option>
		        <option value="bitcoin-cash" <%if(coin != null && coin.equals("bitcoin-cash")){ %>selected<%} %>>비트코인캐쉬</option>
		        <option value="litecoin" <%if(coin != null && coin.equals("litecoin")){ %>selected<%} %>>라이트코인</option>
		      </select>
		    </div>
		    
		  </div>
		  <div class="form-group row">
		    <label for="no" class="col-sm-3 col-form-label">시작날짜</label>
		    <div class="form-group col-sm-3">
		      <select id="startYear" name="startYear" class="form-control">
		        <option selected>Year...</option>
		        <%for(int i=2010;i<=year;i++){ %>
		        <option value="<%=i%>" <%if(sYear == i){ %>selected<%} %>><%=i%></option>
		        <%} %>
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="startMonth" name="startMonth" class="form-control">
		        <option selected>Month...</option>
		        <%for(int i=1;i<=12;i++){ %>
		        <option value="<%=i%>" <%if(sMonth == i){ %>selected<%} %>><%=i%></option>
		        <%} %>
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="startDay" name="startDay"  class="form-control">
		        <option selected>Day...</option>
		        <%for(int i=1;i<=31;i++){ %>
		        <option value="<%=i%>" <%if(sDay == i){ %>selected<%} %>><%=i%></option>
		        <%} %>
		      </select>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="endYear" class="col-sm-3 col-form-label">끝날짜</label>
		    <div class="form-group col-sm-3">
		      <select id="endYear" name="endYear" class="form-control">
		        <option selected>Year...</option>
		        <%for(int i=2010;i<=year;i++){ %>
		        <option value="<%=i%>" <%if(eYear == i){ %>selected<%} %>><%=i%></option>
		        <%} %>
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="endMonth" name="endMonth" class="form-control">
		        <option selected>Month...</option>
		        <%for(int i=1;i<=12;i++){ %>
		        <option value="<%=i%>" <%if(eMonth == i){ %>selected<%} %>><%=i%></option>
		        <%} %>
		      </select>
		    </div>
		    <div class="form-group col-sm-3">
		      <select id="endDay" name="endDay"  class="form-control">
		        <option selected>Day...</option>
		        <%for(int i=1;i<=31;i++){ %>
		        <option value="<%=i%>" <%if(eDay == i){ %>selected<%} %>><%=i%></option>
		        <%} %>
		      </select>
		    </div>
		  </div>
		</form>
		<div class="text-right">
			<button type="button" id="searchCoin" class="btn btn-outline-success">검색</button>
        </div>
        
        <div class="form-group row">
        	<div class="col-lg-12">
        		<div class="table-responsive-lg" id="chart_div2"></div>
        	</div>
        </div>
		
		<div class="table-responsive-lg">
			<table class="table table-hover">
	          <colgroup>
	            <col width="10%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          	<col width="15%"/>
	          </colgroup>
			  <thead>
			    <tr>
			      <th scope="col">Date</th>
			      <th scope="col">Open</th>
			      <th scope="col">High</th>
			      <th scope="col">Low</th>
			      <th scope="col">Close</th>
			      <th scope="col">Volume</th>
			      <th scope="col">Market Cap</th>
			    </tr>
			  </thead>
			  <tbody>
			    <%
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			    c.set(sYear,sMonth-1,sDay);
			    String startDate = sdf.format(c.getTime());
			    c.set(eYear,eMonth-1,eDay);
			    String endDate = sdf.format(c.getTime());
			    String url = 
				"https://coinmarketcap.com/currencies/"+coin+"/historical-data/?start="+startDate+"&end="+endDate;
			    System.out.println(url);
			    Document doc = null;
				
				try {
					doc = Jsoup.connect(url).get();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Elements elements = doc.select(
					".cmc-table__table-wrapper-outer table tbody tr");
				for(int i=0;i<elements.size();i++){
					Element trElement = elements.get(i);
					
					String date = trElement.child(0).text();
					
					date = Utility.getKoreanDate(date);
					
					double open = Double.parseDouble(trElement.child(1).text().replaceAll(",", ""));
					double high = Double.parseDouble(trElement.child(2).text().replaceAll(",", ""));
					double low = Double.parseDouble(trElement.child(3).text().replaceAll(",", ""));
					double close = Double.parseDouble(trElement.child(4).text().replaceAll(",", ""));
					double volume = Double.parseDouble(trElement.child(5).text().replaceAll(",", ""));
					double cap = Double.parseDouble(trElement.child(6).text().replaceAll(",", ""));
			    %>
			    <tr>
			      <td><%= date %></td>
			      <td><%=open %></td>
			      <td><%=high %></td>
			      <td><%=low %></td>
			      <td><%=close %></td>
			      <td><%=volume %></td>
			      <td><%=cap %></td>
			    </tr>
			    <%} %>
			    <%--
			    <tr>
			      <td colspan="7">데이터가 존재하지 않습니다.</td>
			    </tr>
			    --%>
			   
			  </tbody>
			</table>
		</div>
        
      </div>
    </div>
  </div>
  <!-- main end-->
  <%@ include file="../inc/footer.jsp" %> 
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
  	$("#searchCoin").click(function(){
  		f.submit();
  	});
  </script>
  
  <script>
	google.charts.load('current', {packages: ['corechart', 'line']});
	//google.charts.setOnLoadCallback(drawLineColors);
	google.charts.setOnLoadCallback(drawLineColors2);
	//google.charts.setOnLoadCallback(drawLineColors3);

	function drawLineColors2() {
	      var data = new google.visualization.DataTable();
	      data.addColumn('date', 'X');
	      data.addColumn('number', '<%=coin%> price');
	      //data.addColumn('number', 'Open');

	      data.addRows([
	    	  <%
	    	  for(int i=0;i<elements.size();i++){
					Element e = (Element)elements.get(i);
					int[] date = toDateKorea2(e.child(0).text());
					
					double bitClose = Double.parseDouble(e.child(4).text().replaceAll(",",""));
					if((i+1)==elements.size()){
	    	  %>
	        [new Date(<%=date[0]%>,<%=date[1]-1%>,<%=date[2]%>), <%=bitClose%>]
	        
	        <%}else{%>
	        [new Date(<%=date[0]%>,<%=date[1]-1%>,<%=date[2]%>),<%=bitClose%>], 
	        <%}%>
	        <%}%>
	      ]);

	      var options = {
	    		 
	    	    title: '<%=coin%>  chart',
	    	    
	        vAxis: {
	          title: 'Price(dollar)'
	        },
	        width: '100%',
	        height: 500,
	        colors: ['#a52714', '#097138'],
	        fontSize: 18,
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
	      chart.draw(data, options);
	    }
</script>
  
  
  