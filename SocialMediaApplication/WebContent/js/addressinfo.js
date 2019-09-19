/**
 * 
 */

$(document).ready(function(){
	
	$("#country").click(function(){
		var country = $("#country").val();
		console.log("You Choose ==  "+country);
		$.ajax({
			url:"ProfileController",
			type:"Post",
			data:"action=sortaddress&find=province&country="+country,
			success:function(data){
				$("#province").html(data);
				console.log(data);
			}
		});
	});
	
	$("#province").click(function(){
		var province = $("#province").val();
		console.log("Province Choose "+province);
		$.ajax({
			url:"ProfileController",
			type:"Post",
			data:"action=sortaddress&find=city&province="+province,
			success:function(data){
				$("#city").html(data);
				console.log(data);
			}
		});
		
		
	});
	
});