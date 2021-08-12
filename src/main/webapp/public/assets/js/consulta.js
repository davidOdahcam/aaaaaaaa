var state = 1;
var btnBack = document.getElementById("btn-back");
var btnSubmit = document.getElementById("btn-submit");
var btnCancel = document.getElementById("btn-cancel");
var btnJump = document.getElementById("btn-jump");



function imgSelected(res){

    if(res == "pular") state++;
    else if(res == "voltar") state--;
    
    if(res > 0){
        console.log('kk');
        document.getElementById(`input-state-${state}`).value = res;
        state++;
    }
    
    if(state === 1){
        btnBack.style.display = "none";
        btnCancel.style.display = "block";
    }else if(state === 8){
        btnSubmit.style.display = "block";
        btnJump.style.display = "none";
    }else if(state === 9){
        document.getElementById("form-hidden").submit();
    }
    else if(state > 1){
        btnBack.style.display = "block";
        btnCancel.style.display = "none";
        btnSubmit.style.display = "none";
        btnJump.style.display = "block";
    }
    document.getElementById("title").innerHTML = `Pergunta número ${state}`;
    
}