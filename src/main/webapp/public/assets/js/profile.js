$('.child-card').hover(
	function () { // In
		const id = this.dataset.id;

		// $(this).css("background-color", "rgb(245, 245, 245)");
		$(`#delete-child-${id}`).show();
	},
	
	function () { // Out
		const id = this.dataset.id;
		
		// $(this).css("background-color", "white");
		// $(this).css("transition", "all 300 ease-in-out");
		$(`#delete-child-${id}`).hide();
	}
)

$('.delete-child-btn').click(function () {
	const id = this.dataset.id;
	
	$.ajax({
	    method: "DELETE",
	    url: `./perfil?id=${id}`,
	    success: res => {
	        location.reload();
	    },
	    error: async (err) =>  {
			await $(`#delete-child-${id}-modal`).modal('hide');
			
	        toastr.error(err.responseText);
	    }
	});
})
