<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.2.js"></script>
    <script src="${pageContext.request.contextPath }/js/echarts.js"></script>
</header>

<body>
    <!-- 为 ECharts 准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;margin-top:50px;margin-left:100px;"></div>
</body>
    <script type="text/javascript">
	    <!-- /*  // 基于准备好的dom，初始化echarts实例
	    var myChart = echarts.init(document.getElementById('main'));
	    // 指定图表的配置项和数据
	    var option = {
	    	
	    		 title : {
	    		        text: '图书销量报表',
	    		        subtext: '图书销售占比',
	    		        x:'center'
	    		    },
	    		    tooltip : {
	    		        trigger: 'item',
	    		        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    		    },
	    		    legend: {
	    		        orient : 'vertical',
	    		        x : 'left',
	    		        data:${legendData }
	    		    },
	    		    toolbox: {
	    		        show : true,
	    		        feature : {
	    		            mark : {show: true},
	    		            dataView : {show: true, readOnly: false},
	    		            magicType : {
	    		                show: true, 
	    		                type: ['pie', 'funnel'],
	    		                option: {
	    		                    funnel: {
	    		                        x: '25%',
	    		                        width: '50%',
	    		                        funnelAlign: 'left',
	    		                        max: 1548
	    		                    }
	    		                }
	    		            },
	    		            restore : {show: true},
	    		            saveAsImage : {show: true}
	    		        }
	    		    },
	    		    calculable : true,
	    		    series : [
	    		        {
	    		            name:'访问来源',
	    		            type:'pie',
	    		            radius : '55%',
	    		            center: ['50%', '60%'],
	    		            data:${seriesData } 
	    		        }
	    		    ]
	               }
    	myChart.setOption(option);
    </script>
</html>

   

    