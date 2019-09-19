/**
 * 
 */

$(document).ready(function(){
	
	$("#loaddate").click(function(){
		var days = "<option value=''>Day</option>";
		for(var i=1;i<=31;i++){
			days += "<option value='"+i+"'>"+i+"</option>";
		}
		console.log(days);
			
		var	years = "<option value=''>Year</option>";
		for(var i=1920;i<=2006;i++){
			years += "<option value='"+i+"'>"+i+"</option>";
		}
		
		$("#dateday").html(days);
		$("#dateyear").html(years);
		
	});
	
});