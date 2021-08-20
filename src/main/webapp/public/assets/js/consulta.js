$('.calendario').change(function () {
	let date = this.value;
	console.log(date);
	let query = "date="+date;
    $.ajax({
        method: "GET",
        url: "./consulta",
        data: query,
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

$('#consulta_op').click(function () {
	let operacao = this.value;
	let query = "op="+operacao;
    $.ajax({
        method: "POST",
        url: "./consulta",
        data: query,
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
