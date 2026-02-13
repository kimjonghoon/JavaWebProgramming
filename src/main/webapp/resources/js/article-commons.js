$(document).ready(function() {
	//title
	$('title').empty();
	const title = $('#content > article > h1').first().html();
	$('title').append(title);
	//Keywords
	const keywordsArr = $('#content > article em').map(function() {
		return $(this).text();
	}).get();
	const keywords = keywordsArr.join(',');
	$("meta[name='Keywords']").attr("content", keywords);
	//Description
	const description = $('#content > article i').first().html();
	$("meta[name='Description']").attr("content", description);

	$('pre.prettyprint').html(function() {
		return this.innerHTML.replace(/\t/g, '&nbsp;&nbsp;')
	});
	$('pre.prettyprint').dblclick(function() {
		selectRange(this);
	});
})