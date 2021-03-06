<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
  <title>学生考勤</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <style>
      #content-list {
        font-size: 2em;
      }
      .attendance-table {
      	width: 80%;
      	margin: 0 10%;
      	background: url(images/at-bg.jpg) top left no-repeat;
      	background-size: cover;
    	color: #f9bf3b;
      }
      .attendance-table tr {
        text-align: center;
        height: 8em;
      
      }
      .attendance-table td {
      	font-size: 3em;
      }
     .caption {
        text-align: center;
        font-size: 1.8em;
        color: #fef;
        text-shadow: 2px 2px 2px #333; 
        letter-spacing: .6em;
     }
  </style>
</head>
<body>
  <div id="container">
      <%@ include  file="header.jsp"%>
  </div>
 <div id="left-list">
      <jsp:include  page="menu.jsp"/>
 </div>
    <div id="content-list">
    <table class="table table-bordered table-responsive attendance-table">
    <caption class="caption">本月考勤</caption>
    <thead>
    </thead>
    <tbody>
        <tr>
            <td >1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
        </tr>
        <tr>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>11</td>
            <td>12</td>
        </tr>
        <tr>
            <td>13</td>
            <td>14</td>
            <td>15</td>
            <td>16</td>
            <td>17</td>
            <td>18</td>
        </tr>
        <tr>
            <td>19</td>
            <td>20</td>
            <td>21</td>
            <td>22</td>
            <td>23</td>
            <td>24</td>
        </tr>
        <tr>
            <td>25</td>
            <td>26</td>
            <td>27</td>
            <td>28</td>
            <td>29</td>
            <td>30</td>
        </tr>
    </tbody>
</table> 
    </div>
      
<script>
   
    //dom加载过程中动态计算背景高度
    $(document).ready (function (){
        var height = $("#content-list").offset().top;
        $("#content-list").height($(document).height()-height-10);
        $("#left-list").height($(document).height()-height-10);  
        
        
  });
    window.onload = function (){
    	if($("#role-name").html()=="student"){
    	var str1=$("#muser-name").html();
    	}
    	if($("#role-name").html()=="parent"){
        	var str1=$("#mstudent-name").html();
        	}
    	$.ajax({ url: "attendance.do", data:"Student_name="+str1, type: "post",dataType: "json",context: $("#getuname"), success: function(data){
    	    var dal = data.attendance1.length;
    		for (var i=0;i<dal ;i++) {
    	    	var dai = data.attendance1[i]
    			if(dai.attendance_content === "active"){
    	    		$(".attendance-table").find("td").eq(dai.attendance_time-1).addClass("success");
    	    	}
    			else {
    				$(".attendance-table").find("td").eq(dai.attendance_time-1).addClass("danger");
    			}
    	    }   
    	}
    	});
    };
    
  
   
</script>
</body>
</html>