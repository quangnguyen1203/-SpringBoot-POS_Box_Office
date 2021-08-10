App.getUser();


function getSchedules(){
    $.ajax({
        type: "GET",
        url: "/schedules/allSchedule"
    }).done((schedules) => {
        let content = "";
        for (let i = 0; i < schedules.length ; i++) {
            let d1 = Date.parse(schedules[i].schedule_date);
            let d2 = Date.parse(App.getToday());
            if (d1 === d2){
                content += `
                <option value="${schedules[i].schedule_id}" selected>${schedules[i].schedule_date}</option>
            `;
            } else {
                content += `
                <option value="${schedules[i].schedule_id}">${schedules[i].schedule_date}</option>
            `;
            }
        }
        $("#schedule_date").html(content);
    })
}

function checkAvailable(){
    $.ajax({
        type: "GET",
        url: "/films/checkAvailable"
    }).done(getAllFilm)
}

function getAllFilm(){
    $.ajax({
        type: "GET",
        url: "/films/allFilm"
    }).done(function (films){
        let content = "";
        for (let i = films.length-1; i >= 0; i--) {
            content += `
            <option value="${films[i].film_id}"> ${films[i].film_name}</option>
                `;
        }
        $("#film_id").html(content);
    })
}

checkAvailable();

getSchedules();


//Tạo suất chiếu

function createShow(){

    let film_id = $("#film_id").val();

    $.ajax({
        type: "GET",
        url: `/films/find/${film_id}`
    }).done((film) => {
        let room = {
            room_name: $("#room_name").val()
        }
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            url: "/room/create",
            data: JSON.stringify(room)
        }).done((room1) =>{
            $.ajax({
                type: "POST",
                url: `/room/initSeat/${room1.room_id}`
            }).done(() =>{
                let schedule = {
                    schedule_id: $("#schedule_date").val()
                }
                let bonus_time = "00:30:00";
                let time_start = $("#time_start").val();
                let time_end = App.addTimes(App.addTimes(time_start,film.duration),bonus_time);
                console.log(time_end)
                let show = {
                    schedule: schedule,
                    film: film,
                    room: room1,
                    time_start: time_start,
                    time_end: time_end
                }
                if(time_end > App.getTime())
                $.ajax({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    type: "POST",
                    url: "/show/create",
                    data: JSON.stringify(show)
                }).done(() =>{
                    $("#create-form")[0].reset();
                    App.showSuccessAlert("Tạo mới suất chiếu thành công!")
                }).fail(() =>{
                    App.showErrorAlert("Đã xảy ra lỗi!")
                })
            })
        })

    })



}

$("#create-button").on("click",createShow);

