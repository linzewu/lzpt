<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
            年份: <input id="year" class="easyui-combobox" panelHeight="auto" style="width:100px" data-options="valueField: 'label',textField: 'value',data:years" prompt="请选择年份" />
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="loadChar()">加载图表</a>
</div>
<HR  width="98%"  SIZE=2>

<div id="container" style="min-width:700px;height:400px"></div>
 
 <script type="text/javascript">
 
 function getUnitsIndex(id){
	 
	 var index;
	 
	 $.each(units,function(i,n){
		 if(id==n.id){
			 index=i; 
			 return false;
		 }
	 })
	 return index;
 }
 
 
 function loadChar(){
	 
	 var year = $("#year").combobox("getValue");
	 
	 if(year==""){
		 $.messager.alert("提示","请选择年份");
		 return;
	 }
	 
	 $.post("/lzpt/project!getYearReport.action",{"pro.year":year},function(data){
		 var colors = Highcharts.getOptions().colors;
		 var charData=new Array(units.length);
		 var categories=[];
		 var  name = year+'年';
		 
		 $.each(units,function(i,n){
			 categories[i]=n.wname;
		 });
		 
		 $.each(data.rows,function(i,n){
			 var temp={};
			 temp.y=n.score;
			 temp.color='#'+('00000'+(Math.random()*0x1000000<<0).toString(16)).slice(-6);
			 charData[getUnitsIndex(n.unit)]=temp;
		 });
		 
		console.log(charData)
		 
		  var chart = $('#container').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: "吉安市永新县"+year+'年度乡镇单位廉政项目考核得分图表'
		        },
		        xAxis: {
		            categories: categories
		        },
		        yAxis: {
		            title: {
		                text: '单位年度得分'
		            }
		        },
		        plotOptions: {
		            column: {
		                cursor: 'pointer',
		                point: {
		                   
		                },
		                dataLabels: {
		                    enabled: true,
		                    color: colors[0],
		                    style: {
		                        fontWeight: 'bold'
		                    },
		                    formatter: function() {
		                        return this.y +'分';
		                    }
		                }
		            }
		        },
		        tooltip: {
		            formatter: function() {
		                var point = this.point,
		                    s = this.x +':<b>'+ this.y +'分</b><br>';
		                return s;
		            }
		        },
		        series: [{
		            name: name,
		            data: charData,
		            color: 'white'
		        }],
		        exporting: {
		            enabled: false
		        }
		    })
		    .highcharts();
		 
		 
	 });
 }
 
 function setChart(name, categories, data, color) {
		chart.xAxis[0].setCategories(categories, false);
		chart.series[0].remove(false);
		chart.addSeries({
			name: name,
			data: data,
			color: color || 'white'
		}, false);
		chart.redraw();
 }
 
 </script>