<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<style>
            #hieuunglogin{
        		position:fixed;
        		left:40%;
        		top:30%;
        		background:#202020;
        		width:20%;
        		height:30%;
                border: 2px solid #ddd;
                float: left;
                z-index: 99999;
        		box-shadow: 0px 0px 20px #999;
        	   -moz-box-shadow: 0px 0px 20px #999; /* Firefox */
                -webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
                border-radius:3px 3px 3px 3px;
                -moz-border-radius: 3px; /* Firefox */
                -webkit-border-radius: 3px; /* Safari, Chrome */        
                border-color: white;
         	}
            #nuttat{
                position:relative;
                left:95%;
                top:-10%;
                width:10%;
                height:15%;
               	}
           	#click{
                	font-size:12px;
                    color:white; 
               	}
            #click:hover
            {
                font-size:12px;
                color:red; 
            }
    </style>
    <script><!-- HideSC  -->
        function clikF()//
        {
        		disScroll();
       	}
        function clikT()//
        {
        	   enScroll();
        }
        function disScroll()//mainid là id của thẻ body ,do đó phải đặt tên id của thẻ body là mainid
        {//hàm này có chức năng tắt cuộn trang
        	document.getElementById('mainid').style.overflow='hidden';
        }
        function enScroll()//mainid là id của thẻ body ,do đó phải đặt tên id của thẻ body là mainid
        {//hàm này có chức năng bật cuộn trang
        	document.getElementById('mainid').style.overflow='auto';
        }
        function disb(e)
        {//hàm này có chức năng tắt chức năng của chuột
        document.oncontextmenu =function(){return false};
        document.onmousedown = function(){return false};
        document.onmouseup =function(){return false};
        return false;
        }
        function enab(e)
        {//bật các chức năng của chuột
        document.oncontextmenu='';
        document.onmousedown='';
        document.onmouseup='';
        return e;
        }
    </script>
</head>
<body>
	<div id='mainidscroll'>
	<div style='position:fixed;margin-top:-20%;width:100%;height:300%;background:#854666;opacity:0.5;z-index:99999;' onmouseover="disb(event)">
	</div><!--onmouseover="enab(event)" nền body  -->
	        <div id="hieuunglogin" onmouseover="enab(event);"><!--onmouseover="enab(event)" nền form  -->
	        <img id="nuttat" src="images/close_pop.png" onclick="an();clikT();enab(event);" />
	        <br><br>
	    	<!-- <form action="logincontroller.php" method="POST" style="position:relative;left:10px;">
	    		Username: <input  id="t" type="text" name="textusername" value="" onkeyPress='return camspace(event);'/><br><br>
	    		Password: <input  id="t" type="password" name="textpassword" value=""  /><br><br>
	            <a id='click' href="#login-box" onclick="an();hienthisignin();">Create account!</a>       
	            <input  type="submit" name="gui" style="position:relative;left:120px;text-align: center;border-radius: 15px 15px 15px 15px;margin: 0px 0px 0px -30px;font-size: 14px;" value="Login"/>        
	            <br /> <a id='click' href="#login-box" onclick="an();hienforget();" >Forget password!</a><br />
	            <div style="float:left;font-size:18px;color: red;margin: -20px 10px 5px 170px;">
	                        <p></p>                   
	            </div>                       
	    	</form> -->
	        </div>
	</div>
	
	<!-- ====================Javascrip an hien khung login============-->
        <script>
                //fid="hieuung";//sua ten cua id can dieu khien o day--- tao bien hian = true là ẩn ,false là hiện
               
                var login="true";
                function an()
                {                    
                document.getElementById("hieuunglogin").style.visibility="hidden";
                document.getElementById("mainidscroll").style.visibility="hidden";
                clikT();
                enab(event);
                }
                function hienthi()
                {
                document.getElementById("mainidscroll").style.visibility="visible";
                document.getElementById("hieuunglogin").style.visibility="visible";
                clikF();
                var x=0;
                var timer=setInterval(function (){if(x<(screen.height/4)) x=x+1;else{clearTimeout(timer);};
                document.getElementById("hieuunglogin").style.top=x+"px";}, 2);
                }
                if(login=="true")
                    an();
                function camspace(i)
                {
                    var a=i.keyCode;
                    if( (a>=48 && a<=57) || (a>=65 && a<=90) || (a>=97) && (a<=122) )
                    {
                        return true;
                    }
                    else
                        return false;
                }
        //setInterval(function () {showform()},100);
        </script>
</body>
</html>