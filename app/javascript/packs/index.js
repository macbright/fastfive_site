
// my-script.js
document.addEventListener("DOMContentLoaded", function() { 
    // this function runs when the DOM is ready, i.e. when the document has been parsed
    	showCategories()
			showPosts()
			showUsers()
			showCardTypes()
			showSoldCard()
			showUnsoldCards()
			showCards()	
			
			$('.carousel').carousel({
					interval: 2000
			});
			$('.dropdown-toggle').dropdown()
});

var $ = document.querySelector.bind(document);

console.log("custom js file loaded")

function showCategories() {
	let el = document.querySelector(".all-categories");
	if(el){
		el.addEventListener('click', e => {
			e.preventDefault();
			$(".categories").style.display = 'block';
			$('.soldCards').style.display = 'none';
			$('.cards').style.display = 'none';
			$('.unsoldCards').style.display = 'none';
			$('.cardTypes').style.display = 'none';
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
		$('.soldCards').style.display = 'none';
		$('.cards').style.display = 'none';
		$('.unsoldCards').style.display = 'none';
		$('.cardTypes').style.display = 'none';
		$('.categories').style.display = 'none';
		$('.users').style.display = 'none';
	})
}

function showUsers() {
	$('.all-users').addEventListener('click', (e) => {
		e.preventDefault();
		$('.users').style.display = 'block';
		$('.soldCards').style.display = 'none';
		$('.cards').style.display = 'none';
		$('.unsoldCards').style.display = 'none';
		$('.cardTypes').style.display = 'none';
		$('.categories').style.display = 'none';
		$('.posts').style.display = 'none';
	})
}

function showCardTypes() {
	$('.card-types').addEventListener('click', (e) => {
		e.preventDefault();
		$('.cardTypes').style.display = 'block';
		$('.soldCards').style.display = 'none';
		$('.cards').style.display = 'none';
		$('.unsoldCards').style.display = 'none';
		$('.users').style.display = 'none';
		$('.categories').style.display = 'none';
		$('.posts').style.display = 'none';

	})
}


function showCards() {
	$('.all-cards').addEventListener('click', (e) => {
		e.preventDefault();
		$('.cards').style.display = 'block';
		$('.unsoldCards').style.display = 'none';
		$('.soldCards').style.display = 'none';
		$('.cardTypes').style.display = 'none';
		$('.users').style.display = 'none';
		$('.categories').style.display = 'none';
		$('.posts').style.display = 'none';

	})
}

function showUnsoldCards() {
	$('.unsold-cards').addEventListener('click', (e) => {
		e.preventDefault();
		$('.unsoldCards').style.display = 'block';
		$('.cards').style.display = 'none';
		$('.soldCards').style.display = 'none';
		$('.cardTypes').style.display = 'none';
		$('.users').style.display = 'none';
		$('.categories').style.display = 'none';
		$('.posts').style.display = 'none';

	})
}
function showSoldCard() {
	$('.sold-cards').addEventListener('click', (e) => {
		e.preventDefault();
		$('.soldCards').style.display = 'block';
		$('.cards').style.display = 'none';
		$('.unsoldCards').style.display = 'none';
		$('.cardTypes').style.display = 'none';
		$('.users').style.display = 'none';
		$('.categories').style.display = 'none';
		$('.posts').style.display = 'none';

	})
}