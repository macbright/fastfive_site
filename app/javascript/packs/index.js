
// my-script.js
document.addEventListener("DOMContentLoaded", function() { 
    // this function runs when the DOM is ready, i.e. when the document has been parsed
    	showCategories()
			showPosts()
			showUsers()
});

var $ = document.querySelector.bind(document);

console.log("custom js file loaded")

function showCategories() {
	let el = document.querySelector(".all-categories");
	console.log(el)
	if(el){
		el.addEventListener('click', e => {
			e.preventDefault();
			$(".categories").style.display = 'block';
			$(".posts").style.display = 'none';
			$(".users").style.display = 'none';
			console.log("clicked")
		})
	}
}

function showPosts() {
	$('.all-posts').addEventListener('click', (e) => {
		e.preventDefault();
		$('.posts').style.display = 'block';
		$('.categories').style.display = 'none';
		$('.users').style.display = 'none';
	})
}

function showUsers() {
	$('.all-users').addEventListener('click', (e) => {
		e.preventDefault();
		$('.users').style.display = 'block';
		$('.categories').style.display = 'none';
		$('.posts').style.display = 'none';
	})
}

