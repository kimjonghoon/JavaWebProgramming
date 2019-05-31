$(document).ready(function () {
	
	prettyPrint();
	$('pre.prettyprint').html(function () {
	    return this.innerHTML.replace(/\t/g, '&nbsp;&nbsp;&nbsp;&nbsp;');
	});
	$('pre.prettyprint').dblclick(function () {
	    selectRange(this);
	});
	
    $('pre.script-result-display').each(function () {
        var $result = "";
        function println(str) {
            $result += str + "\n";
        }
        var $convert = $(this).text().replace(/alert/g, "println");
        eval($convert);
        $(this).after('<pre class="result">' + $result + '</pre>');
    });

});