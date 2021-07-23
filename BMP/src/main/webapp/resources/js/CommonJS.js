function validateEmail(inputEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(inputEmail))
		return true;
	else
		return false;
}

function notice(input) {
	setTimeout(function() {
		$('.notice').css({
			'display': 'flex',
			'opacity': '100'
		});
	}, 100);
	setTimeout(function() {
		$('.notice').css('opacity', '0');
	}, 1000);
	setTimeout(function() {
		$('.notice').css('display', 'none');
		if(input=='reset')
			location.reload(true);
	}, 2000);
}