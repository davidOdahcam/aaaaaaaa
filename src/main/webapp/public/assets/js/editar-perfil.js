const editResponsible = (e) => {
    const form = $('#form-edit')[0];
    
    let query_string = [];

    for(let input of form) {
    	if(!input.name) continue;
    	if(input.value == "null") input.value = "";
    	
        query_string.push(`${input.name}=${input.value}`);
    }

    query_string = query_string.join("&");

    $.ajax({
        method: "POST",
        url: "./perfil/editar",
        data: query_string,
        cache: false,
        processData: false,
        success: res => {
            location.reload();
        },
        error: err => {
            toastr.error(err.responseText);
        }
    });
}

const editPediatricDentist = () => {
	const form = $('#form-edit')[0];
    
    let query_string = [];

    for(let input of form) {
    	if(!input.name) continue;
    	if(input.value == "null") input.value = "";
    	
        query_string.push(`${input.name}=${input.value}`);
    }

    query_string = query_string.join("&");
    
    $.ajax({
        method: "POST",
        url: "./perfil/editar",
        data: query_string,
        cache: false,
        processData: false,
        success: res => {
            location.reload();
        },
        error: err => {
            toastr.error(err.responseText);
        }
    });
}

$('.edit-child').click(function () {
	const id = this.dataset.id;
	
	const form = $(`#ChildrenFormId-${id}`)[0];
	
	let query_string = [`id=${id}`, 'type=crianca'];

    for(let input of form) {
    	if(!input.name) continue;
    	if(input.value == "null") input.value = "";
    	
        query_string.push(`${input.name}=${input.value}`);
    }

    query_string = query_string.join("&");
    
    $.ajax({
        method: "POST",
        url: "./perfil/editar",
        data: query_string,
        cache: false,
        processData: false,
        success: res => {
            location.reload();
        },
        error: err => {
            toastr.error(err.responseText);
        }
    });
});
