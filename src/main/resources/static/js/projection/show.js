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
            <option value="${films[0].film_id}"> ${films[0].film_name}</option>
                `;
        }
        $("#film_name").html(content);
    })
}

checkAvailable();

getSchedules();


//Tạo suất chiếu

function createShow(){


    let film_id = $("#film_name").val();

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
            }).done((room2) =>{
                let schedule = {
                    schedule_id: $("#schedule_date").val()
                }
                
            })
        })

    })

}