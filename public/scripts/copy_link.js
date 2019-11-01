// copy_link.js

function copyLink() {
  var copyText = document.getElementById("url");
  copyText.select();
  copyText.setSelectionRange(0, 99999); /*For mobile devices*/
  document.execCommand("copy");
  var copyButton = document.getElementById("copy");
  copyButton.disabled = true;
  copyButton.innerHTML = "Copied";

  setTimeout(function(){
    copyButton.innerHTML = "Copy";
    copyButton.disabled = false;
  }, 3000);

  return false; // to keep the form from submitting and refreshing the page
}
