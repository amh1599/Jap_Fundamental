<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
{
"name" : "an",
"age" : 19,
"address" : "아산"
"items" : [
		{"no":"1","storeName":"강남스토어1"},
		{"no":"2","storeName":"강남스토어2"},
		{"no":"3","storeName":"강남스토어3"}
		]
}
<%
	JSONObject obj = new JSONObject();
	obj.put("name","an");
	obj.put("age",19);
	obj.put("address","아산");
	
	JSONArray array = new JSONArray();
	
	JSONObject obj1 = new JSONObject();
	obj1.put("no","1");
	obj1.put("storeName","강남스토어1");
	
	JSONObject obj2 = new JSONObject();
	obj2.put("no","2");
	obj2.put("storeName","강남스토어2");
	
	JSONObject obj3 = new JSONObject();
	obj3.put("no","3");
	obj3.put("storeName","강남스토어3");
	
	array.add(obj1);
	array.add(obj2);
	array.add(obj3);
	
	obj.put("item",array);
	
	out.print(obj.toJSONString());
	
%>