<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
    
<title>Insert title here</title>
    <script>
        $(function(){
        	
        	
            $('#btn').click(function(){
            	var address = encodeURIComponent('http://inspct.career.go.kr/openapi/test/questions?apikey=7a9bfb18b65bfce78a1535c601987455&q=20');
                $.ajax({
                    url : '/Project/proxy.jsp?url='+ address,
                    type:'GET',
                    dataType:'json',
                    error:function(){
                        alert('error');
                    },
                    success:function(obj){
                    	let quest = obj["RESULT"];
                    	for(let i = 0; i<quest.length; i++){
	                        $("#sel").append("<div>"+quest[i].question+"</div>");
	                        
	                        for(let j =1; j<11; j++){
	                        let value = [quest[i].answer01,quest[i].answer02,quest[i].answer03,quest[i].answer04,quest[i].answer05,
	                        	quest[i].answer06,quest[i].answer07,quest[i].answer08,quest[i].answer09,quest[i].answer10];
	                        $("#sel").append("<input type='radio' name='chk"+i+"' value=" +j+ ">" +value[j-1]+"<br>");
	                        if(value[j] === null) break;
	                        }
                    		$("#sel").append("<br>");
                    	}
                    }
                });
            });
            
            
            $('#radioButton').click(function () {
                // getter
                var radioVal = $('input[name="chk1"]:checked').val();
                alert(radioVal);
              });
            
            
            $('#btnGo').click(function(){
// 	            var jObj = new JSONObject();
// 	            jObj.put("apikey","7a9bfb18b65bfce78a1535c601987455");
// 	            jObj.put("qestrnSeq","20");
// 	            jObj.put("trgetSe","100206");
// 	            jObj.put("name","홍길동");
// 	            jObj.put("gender","100323");
// 	            jObj.put("school","융도즁");
// 	            jObj.put("grade","2");
// 	            jObj.put("email","");
// 	            jObj.put("startDtm","1550466291034");
// 	            jObj.put("answers","1=5 2=7 3=3 4=7 5=1 6=2 7=1 8=5 9=5 10=1 11=4 12=4 13=5 14=4 15=4 16=4 17=4 18=5 19=1 20=1 21=1 22=5 23=3 24=6 25=3 26=2 27=2 28=6 29=3 30=2 31=4 32=3 33=5 34=2 35=3 36=2 37=7 38=2 39=5 40=5 41=5 42=1 43=7 44=6 45=5 46=4 47=2 48=5 49=4 50=5 51=5 52=5 53=7 54=2 55=6 56=4 57=6 58=4 59=3 60=5 61=5 62=5 63=7 64=4 65=7 66=5");
	            
	            var jjj ={
            		"apikey":"7a9bfb18b65bfce78a1535c601987455",
           			"qestrnSeq":"20",
           			"trgetSe":"100206",
           			"name":"홍길동",
           			"gender":"100323",
           			"school":"융도즁",
           			"grade":"2",
           			"email":"",
           			"startDtm":1550466291034,
           			"answers":"1=5 2=7 3=3 4=7 5=1 6=2 7=1 8=5 9=5 10=1 11=4 12=4 13=5 14=4 15=4 16=4 17=4 18=5 19=1 20=1 21=1 22=5 23=3 24=6 25=3 26=2 27=2 28=6 29=3 30=2 31=4 32=3 33=5 34=2 35=3 36=2 37=7 38=2 39=5 40=5 41=5 42=1 43=7 44=6 45=5 46=4 47=2 48=5 49=4 50=5 51=5 52=5 53=7 54=2 55=6 56=4 57=6 58=4 59=3 60=5 61=5 62=5 63=7 64=4 65=7 66=5"
	            }
// 	            var jObj = new Object();
// 	            jObj.apikey ="7a9bfb18b65bfce78a1535c601987455";
// 	            jObj.qestrnSeq="20";
// 	            jObj.trgetSe="100206";
// 	            jObj.name="홍길동";
// 	            jObj.gender="100323";
// 	            jObj.school="융도즁";
// 	            jObj.grade="2";
// 	            jObj.email="";
// 	            jObj.startDtm=1550466291034;
// 	            jObj.answers="1=5 2=7 3=3 4=7 5=1 6=2 7=1 8=5 9=5 10=1 11=4 12=4 13=5 14=4 15=4 16=4 17=4 18=5 19=1 20=1 21=1 22=5 23=3 24=6 25=3 26=2 27=2 28=6 29=3 30=2 31=4 32=3 33=5 34=2 35=3 36=2 37=7 38=2 39=5 40=5 41=5 42=1 43=7 44=6 45=5 46=4 47=2 48=5 49=4 50=5 51=5 52=5 53=7 54=2 55=6 56=4 57=6 58=4 59=3 60=5 61=5 62=5 63=7 64=4 65=7 66=5";
// 	            var jsonData = JSON.stringify(jObj);

//	            $("#sel").append(jsonData);
	            
	            var queryString = $("form[name=jsonData]").serialize() ;
	            var address2 = encodeURIComponent('inspct.career.go.kr/openapi/test/report?apikey=7a9bfb18b65bfce78a1535c601987455&qestrnSeq=20');
	            $.ajax({
	                url : 'http://inspct.career.go.kr/openapi/test/report?apikey=7a9bfb18b65bfce78a1535c601987455&qestrnSeq=20',
	                //url : '/Project/proxy.jsp?url='+ address2,
	                //url : address2,
	                type : 'post',
	                cache : false,
	                data : JSON.stringify(jjj),
	                contentType : 'application/json; charset=utf-8',
	                dataType : 'json',
	                error: function(){
	                    alert("error111111");
	                },
	                success:function(obj){
	                    //alert("well done");
	                	$.ajax({
	                        url : '/Project/proxy.jsp?url='+ address2,
	                        type:'GET',
	                        dataType:'json',
	                        error:function(){
	                            alert('error222222');
	                        },
	                        success:function(obj){
	                        	let quest = obj["RESULT"];
	    	                    $("#sel").append("<div>"+quest.url+"</div>");
	    	                        
	                        }
	                    });
	                },
	            });
	            
	            
	            
// 	            var address3 = encodeURIComponent('http://inspct.career.go.kr/openapi/test/report?apikey=7a9bfb18b65bfce78a1535c601987455&qestrnSeq=20');
//                 $.ajax({
//                    // url : '/Project/proxy.jsp?url='+ address3,
//                     url : 'http://inspct.career.go.kr/openapi/test/report?apikey=7a9bfb18b65bfce78a1535c601987455&qestrnSeq=20',
//                     type:'GET',
//                     dataType:'json',
//                     error:function(){
//                         alert('error22222');
//                     },
//                     success:function(obj){
//                     		$("#sel").append(JSON.stringify(obj));
//                     }
//                 });
	            
	            
            });
        });
    </script>
</head>
<body>
	<button type="button" name="button" id="radioButton">get radio Value</button>
    <button id='btn'>가져오기</button>
    <button id='btnGo'>결과</button>
    <div id='sel'>

    </div>
</body>
</html>