<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진로 검사</title>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../js/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/ulg/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
    <style>
    #btn{
		margin:15px 0 15px 0;
		text-align:center
		}
	html,
	body {
   		margin:0;
   		padding:0;
   		height:100%;
		}
	.container{
   		min-height:100%;
   		position:relative;
   		padding-bottom:100px;/* footer height */
		}
    .footer {
  		width:100%;
  		height:100px;
   		position:absolute;
   		bottom:0;
   		background:#5eaeff;
  		text-align: center;
  		color: white;
		}	
	.nav-link{
		font-size:25px;
		margin:0 0 8px 0;
		color: white;
	}
	
	#navbarTogglerDemo01 label{
	font-size: 25px;
	}
	
	#go{
	margin:30px 0 30px 0;
	}
	
	
    </style>
   
</head>
<body>
<div>
<nav class="navbar navbar-expand-md fixed-top navbar-dark " style="background-color:#17d348;">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		<label class="navbar-brand" href="#" ><strong>진로 심리 검사 : WhoAmI</strong></label>
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0"></ul>
		<form class="form-inline my-2 my-lg-0">
			<a class="nav-link" href="http://localhost/project/home.jsp"><strong>홈</strong> <span class="sr-only">(current)</span></a>
		</form>
	</div>
</nav>
</div>
	<div class="container" style="margin:100px auto;">
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
		<p> 5조 OpenApi & Crawling 프로젝트 : WhoAmI</p>
    	<p>사용한 api : <a href="http://www.career.go.kr/cnet/front/openapi/openApiTestCenter.do" target="_blank" rel="license noopener">CareerNet 진로심리검사 OpenApi</a> <br> 코드 보기 : <a href="https://www.github.com/rimki/Kpc_Crawling" target="_blank" rel="license noopener">github.com/rimki/Kpc_Crawling</a></p>
	</div>
	
</footer>

</body>



	<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
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
        	
        	
        	function print(t,obj){
        		
        		if(t==6){
        			for(let i = 0; i<obj.length; i++){
                        $("#sel").append("<div style='font-size:145%; margin: 0 0 5px 0'>"+(i+1)+". "+quest[i].question+"</div>");
                       
                        let value = [obj[i].answer01,obj[i].answer02,obj[i].answer03,obj[i].answer04,obj[i].answer05,
                        	obj[i].answer06,obj[i].answer07,obj[i].answer08,obj[i].answer09,obj[i].answer10];
                    	
                        for(let j =1; j<3; j++){
                        	
                        	if(value[j-1]!=null )
                    		$("#sel").append("<input type='radio' name='chk"+(i+1)+"' value=" +j+ ">" +value[j-1]+"<br>");
                        	else
                        		continue;
                        }
     		           		$("#sel").append("<br><br>");
            			}
        			
        		}
        		
        		else{
        		
        		for(let i = 0; i<obj.length; i++){
                    $("#sel").append("<div class='alert alert-success' role='alert' style='font-size:145%; margin: 0 0 5px 0'>"+(i+1)+". "+quest[i].question+"</div>");
                   
                    let value = [obj[i].answer01,obj[i].answer02,obj[i].answer03,obj[i].answer04,obj[i].answer05,
                    	obj[i].answer06,obj[i].answer07,obj[i].answer08,obj[i].answer09,obj[i].answer10];
                	
                    
                    for(let j =1; j<11; j++){
                    	
                    	if(j==10){
                    		$("#sel").append("</div>");
                    	}
                    	if(value[j-1]!=null ){
                		//$("#sel").append("<input type='radio' name='chk"+(i+1)+"' value=" +j+ ">" +value[j-1]+"<br>");
                		if(j==1){
                		$("#sel").append("<div class= 'btn-group btn-group-toggle' data-toggle = 'buttons'>");
                		}
                		else{
                		$("#sel").append("<label class = 'btn btn-info'><input type='radio' name='chk"+(i+1)+"' id='option"+j+"' value = "+j+">"+value[j-1]+"</label><br>");
                		//$("#sel").append("<input type='radio' name='options"+(i+1)+"'>"+value[j-1]+"</label><br>");
                		}
                    	}
                    	else
                    		continue;
                    	
                    }
                    	
 		           		$("#sel").append("<br><br>");
        			}
        		}
        	};
        	
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
                     	
                     	print(choice,quest);
                    	
                    }
                });
            });
        	
       
        	
            $('#go').click(function(){
            	
        		
            	if(choice==4 || choice==5 || choice==17 || choice==18){
            		var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         		if(radioVal){
                        		arr.push("A"+i+"="+radioVal);
                         		}
                         		else{
                         			alert(i+"번을 확인해주세요");
                         			return ;
                         			}
                         }
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==6){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal =$('input[name="chk'+i+'"]:checked').val();
                         		if(radioVal)
                         		arr.push("B"+i+"="+radioVal);  
                         		else{
                             		alert(i+"번을 확인해주세요");
                             		return ;
                             		}
                         }
            		 
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==8 || choice==9 || choice==10){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         if(radioVal){
                         		if(i==quest.length)		
                         			arr.push(radioVal);
                         		else
                         			arr.push(radioVal+",");
                         }
                         else{
                      		alert(i+"번을 확인해주세요");
                      		return ;
                      		}
                         
                         			
                         }
            		 answerString = arr.join();
            		 console.log(answerString);
                 }
                
            	 else if(choice==19 || choice==20 || choice==21 || choice==22 ||choice==23){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                        	 if(radioVal){
                         		arr.push(i+"="+radioVal);
                        	 }
                        	 else{
                        		if((choice ==22 || choice == 23) && i==38){
                        			 arr.push(i+"="+"개발자");
                        			 continue;
                        		}
                          		alert(i+"번을 확인해주세요");
                          		return ;
                          		}
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
	                	window.open(url);;
	                }
            	});
            
        	});
        });
    </script>
</html>