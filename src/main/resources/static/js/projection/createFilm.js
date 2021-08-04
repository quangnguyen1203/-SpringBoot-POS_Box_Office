App.getUser();

let singleUploadForm = document.querySelector('#singleUploadForm');
let singleFileUploadInput = document.querySelector('#singleFileUploadInput');

function uploadSingleFile(file) {
    let formData = new FormData();
    formData.append("file", file);

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/uploadFile");
    xhr.send(formData);
}

$("#singleUploadForm").on("submit",function (){
    let files = singleFileUploadInput.files;
    $("#imageName").val(files[0].name);
    uploadSingleFile(files[0]);
})

function getTime(){
    let duration =  $("#film_duration").val() + ":00"
    return duration;
}

function createFilm(){
    let files = singleFileUploadInput.files;
    $("#imageName").val(files[0].name);
    uploadSingleFile(files[0]);

    let film_id = $('#film_id').val();
    let film_name = $("#film_name").val();
    let image = $("#imageName").val();
    let duration = getTime();
    let rel_date = $("#rel_date").val();
    let exp_date = $("#exp_date").val();
    let description = $("#film_description").val();
    let admit = $("#film_admit").val();
    let status = $("#film_status").val();


    let newFilm = {
        film_id : film_id,
        film_name : film_name,
        image : image,
        duration : duration,
        rel_date : rel_date,
        exp_date : exp_date,
        description : description,
        admit : admit,
        isStatus : status
    }
    if ($("#create-form").valid()){
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            data: JSON.stringify(newFilm),
            url: "/films/createFilm"
        }).done(function (){
            $("#create-form")[0].reset();
            App.showSuccessAlert("Tạo mới sản phẩm thành công");
        }).fail(()=>{
            App.showErrorAlert("Đã xảy ra lỗi!");
        })
    }
}

$("#create-button").on("click",createFilm);