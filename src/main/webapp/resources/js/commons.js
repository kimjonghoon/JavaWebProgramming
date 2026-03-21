function selectRange(obj) {
    if (window.getSelection) {
        const selected = window.getSelection();
        selected.selectAllChildren(obj);
    } else if (document.body.createTextRange) {
        const range = document.body.createTextRange();
        range.moveToElementText(obj);
        range.select();
    }
}