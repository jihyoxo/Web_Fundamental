<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json; charset=utf-8"%>

<%
	JSONObject jsonObj = new JSONObject();
	JSONArray jsonArray = new JSONArray();
	
	JSONObject item1 = new JSONObject();
	item1.put("name", "성영한");
	item1.put("clubid", "syh1011");
	
	JSONObject item2 = new JSONObject();
	item2.put("name", "손정의");
	item2.put("clubid", "sjh1011");
	
	JSONObject item3 = new JSONObject();
	item3.put("name", "스티브잡스");
	item3.put("clubid", "steve1011");
	
	jsonArray.add(item1);
	jsonArray.add(item2);
	jsonArray.add(item3);
	
	jsonObj.put("cafelist",jsonArray);
	out.print(jsonObj.toString());
%>