window.onload = initPage;

function initPage() {
	const submit = document.getElementById("submit");
	submit.disabled = true;
	const form = document.getElementById("testForm");
	form.onsubmit = check;
	form.agreement.onchange = agree;
}

function agree() {
	const form = document.getElementById("testForm");
	const submit = document.getElementById("submit");
	if (form.agreement.checked == true) {
		submit.disabled = false;	
	} else {
		submit.disabled = true;
	}
}
function check() {
	const form = document.getElementById("testForm");
	form.condition[4].disabled = true;
	return true;
}