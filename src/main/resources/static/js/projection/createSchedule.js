App.getUser();

function createSchedule(){
    let schedule_date = $("#schedule_date").val();

    let schedule = {
        schedule_date : schedule_date,
    }

    // if ($("#create-form").valid()){
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            data: JSON.stringify(schedule),
            url: "/schedules/create-schedule"
        }).done(function (){
            $("#create-form")[0].reset();
            App.showSuccessAlert("Tạo mới sản phẩm thành công");
        }).fail(()=>{
            App.showErrorAlert("Đã xảy ra lỗi!");
        })
    // }
}

$("#create-button").on("click",createSchedule)