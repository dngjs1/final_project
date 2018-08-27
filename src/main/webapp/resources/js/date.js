//날짜를  0000-00-00 형식으로 된 String으로 변환
function formatDate(date) {
	var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
			+ d.getDate(), year = d.getFullYear();

	if (month.length < 2)
		month = '0' + month;
	if (day.length < 2)
		day = '0' + day;

	return [ year, month, day ].join('-');
}

// 날짜 배열 출력
function date_array_print(array) {
	for (var i = 0; i < array.length; i++) {
		console.log(formatDate(array[i]));
	}
}

/*
 * 날짜와 날짜 사이의 날짜들을 구한다.
 * ex) 2016-04-25, 2016-04-28
 * 
 * return 2016-04-25,2016-04-26,2016-04-27,2016-04-28
 */
function get_period(start, end) {
	var dates = new Array();
	var start_date = new Date(start);
	var end_date = new Date(end);
	console.log("start : "+start);
	console.log("end : "+end);
	console.log("------------");
	
	
	var index = 0;
	while (start_date.getTime() <= end_date.getTime()) {
		dates.push(formatDate(start_date));
		start_date.setDate(start_date.getDate() + 1);
		
		index++;
	}
	return dates;
}

function date_invalid_check(start,end, invalid_date){
	
	var start_date = new Date(start);
	var end_date = new Date(end);
	while (start_date.getTime() <= end_date.getTime()) {
		if(invalid_date.indexOf(formatDate(start_date))>-1)
			return false;
		
		start_date.setDate(start_date.getDate() + 1);
	}
	return true;
}