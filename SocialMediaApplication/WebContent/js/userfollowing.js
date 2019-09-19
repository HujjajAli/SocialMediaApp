
/*$(document).ready(function(){
	$('.followunfollow').click(function(){
		var state = $('.followunfollow').text();
		alert("state is "+state);
		alert("Its is Working");
	});
});*/

function following(id,username,friend){
	var state = $('#'+id).text();
	
	console.log("State "+state)
	if(state == "Follow"){
		
		$.ajax({
			url:"ProfileController",
			type:"Post",
			data:"action=userfollow&username="+username+"&friend="+friend,
			success:function(data){
				$('#'+id).text(data);
				console.log(username+" Wants To Follow "+friend);
			}
		});
		
	}else if(state == "Unfollow"){
		console.log(username+" Wants To Unfollow "+friend);
	}
		
}
