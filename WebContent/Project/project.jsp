<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="jquery-3.5.1.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="jquery-3.5.1.js"></script>
<title>진로심리검사</title>

<style>
    .bd-footer {
	width:100%;
	height:200px;
	bottom:0;
	background:#5eaeff;
	text-align: left;
	color: white;
	}
		
    .nav-link{
	font-size:125%;
	margin:0 0 8px 0;
	color: white;
	}
	
	#go{
	margin:30px 0 30px 0;
	}
	
	
	.navbar{
	width:100%;
	background-color:#17d348;
	}
	
	
</style>
    
<script>
		function Request(){ //Request 함수 구현
			let requestParam = "";
			this.getParameter = function(param){
				let url = unescape(location.href);
				let paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
				
				for(let i = 0; i < paramArr.length;i++){
					let temp = paramArr[i].split("=");
					
					if(temp[0].toUpperCase()==param.toUpperCase()){
						requestParam = paramArr[i].split("=")[1];
						break;
					}
				}
				return decodeURI(decodeURIComponent(requestParam));
			}		
	
		}
		
        $(function(){
        	let request = new Request(); //home.html에서 parameter 가져옴
        
        	let apikey = "7a9bfb18b65bfce78a1535c601987455";
        	let name = request.getParameter("name");
        	let age = request.getParameter("age");
        	let gender = request.getParameter("gender");
        	let school = request.getParameter("school");
        	let grade;
        	let trgetSe;
        	let choice = request.getParameter("choice");
        	let answerString;
        	let quest;
        	
        	if(choice==19)
        		trgetSe = "100205";
        	else if(choice==4 || choice==6 || choice==17 || choice==20 || choice==22)
        		trgetSe = "100206";
        	else if(choice==5 || choice==6|| choice==18 || choice==21 || choice==23 )
        		trgetSe = "100207";
        	else{
        		trgetSe = "100209";
        	}
        	
        	if(school!=null){
	           	if(age>13 && age<17)
	           		 grade= String(Number(age)-13);
	           	else if(age>16 && age<20)
	           		 grade= String(Number(age)-16);
	           	else if(age<14)
	           		 grade= String(Number(age)-7);
           	}else
           		grade="";
       	
        	
        	$(document).ready(function(){
           
        	 let url = 'http://inspct.career.go.kr/openapi/test/questions?apikey='+apikey+'&q='+choice;
           	// 검사 종류에 따라 url 변경
        	 let address = encodeURIComponent(url);
                
             $.ajax({
                    url : 'proxy.jsp?url='+address,
                    type :'GET',
                    dataType : 'json',
                    error : function(){
                        alert('error');
                    },
                    success : function(obj){
                    	
						console.log(obj);
                     	quest = obj["RESULT"];
                     	
                     	for(let i = 0; i<quest.length; i++){
	                        $("#sel").append("<div style='font-size:145%; margin: 0 0 5px 0'>"+(i+1)+". "+quest[i].question+"</div>");
	                       
	                        let value = [quest[i].answer01,quest[i].answer02,quest[i].answer03,quest[i].answer04,quest[i].answer05,
	                        	quest[i].answer06,quest[i].answer07,quest[i].answer08,quest[i].answer09,quest[i].answer10];
	                    	
	                        for(let j =1; j<11; j++){
	                        	if(value[j-1]!=null )
	                    		$("#sel").append("<input type='radio' name='chk"+(i+1)+"' value=" +j+ ">" +value[j-1]+"<br>");
	                        	else
	                        		continue;
	                        }
	                    	
                    		$("#sel").append("<br>");
                    	}
                    }
                });
            });
        	
         
            $('#go').click(function(){
            	
            	
            	if(choice==4 || choice==5 || choice==17 || choice==18){
            		var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                        		arr.push("A"+i+"="+radioVal);
                         }
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==6){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal =$('input[name="chk'+i+'"]:checked').val();
                         		arr.push("B"+i+"="+radioVal);                        		
                         }
            		 
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==8 || choice==9 || choice==10){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         		if(i==quest.length)		
                         			arr.push(radioVal);
                         		else
                         			arr.push(radioVal+",");
                         			
                         }
            		 answerString = arr.join();
            		 console.log(answerString);
                 }
                
            	 else if(choice==19 || choice==20 || choice==21 || choice==22 ||choice==23){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         		arr.push(i+"="+radioVal);
                         }
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
            	
            	
            	
            	
            	
            	  var postJson ={
                  		"apikey":apikey,
                 		"qestrnSeq":choice,
                 		"trgetSe":trgetSe,
                 		"name": name,
                 		"gender":gender,
                 		"school":school,
                 		"grade": grade,
                 		"email":"",
                 		"startDtm":1550466291034,
                 		"answers": answerString
      	            };
                  
            	  console.log(JSON.stringify(postJson));
            	  
            $.ajax({
            	url : 'http://inspct.career.go.kr/openapi/test/report?apikey='+apikey+'&qestrnSeq='+choice,
            	type : 'POST',
            	dataType : 'json',
            	contentType : 'application/json',
            	data : JSON.stringify(postJson),
	                error: function(){
	                    alert("errorpost");
	                },
	                success:function(obj){
	                	console.log(obj);
	                	let url = obj["RESULT"].url;
	                	console.log(url);
	                	location.href = url;
	                }
            	});
            
        	});
        });
    </script>
    
    
</head>
<body>
<nav class="navbar navbar-expand-md fixed-top navbar-dark">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		<label class="navbar-brand" href="#"><strong>진로 심리 검사</strong></label>
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0"></ul>
		<form class="form-inline my-2 my-lg-0">
			<a class="nav-link" href="http://localhost/Project/home.jsp"><strong>홈</strong> <span class="sr-only">(current)</span></a>
		</form>
	</div>
</nav>


<div class="container" style="margin:70px auto;">
	<div class="row" style="margin:0 auto;">
		<div class="col-sm-2" ></div>
		<div class="col-sm-8" >
			<div id="sel"></div>
			<button class="btn btn-primary col-sm-12" id="go" type="button">제출</button>
		</div>
		<div class="col-sm-2" ></div>
	</div>
</div>


<footer class="bd-footer bg-dark text-muted" >
	<div class="container-fluid p-3 p-md-5" >
		<p> 5조 OpenApi & Crawling 프로젝트 : 후아유</p>
    	<p>사용한 api : <a href="http://www.career.go.kr/cnet/front/openapi/openApiTestCenter.do" target="_blank" rel="license noopener">CareerNet 진로심리검사 OpenApi</a> <br> 코드 보기 : <a href="https://www.github.com/rimki/Kpc_Crawling" target="_blank" rel="license noopener">github.com/rimki/Kpc_Crawling</a></p>
	</div>
</footer>

</body>
</html>