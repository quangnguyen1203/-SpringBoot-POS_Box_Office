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
        $("#schedule").html(content);
        $("#schedule").on("change",function (){
            let id = $(this).val();
            getShows(id);
        })
        getCurrentShow();
    })
}

function getShows(scheduleId){
    $.ajax({
        type: "GET",
        url: `/schedules/${scheduleId}`
    }).done((schedule) =>{
        if (schedule.schedule_date === App.getToday()){
            $.ajax({
                type: "GET",
                url: `/show/allActiveShowsToday/${schedule.schedule_id}`
            }).done((shows) => {
                let content =``;
                for (let i = 0; i < shows.length; i++) {
                    content += `
                        <div class="col-md-4 mb-3" >
                            <div class="rounded card h-40 text-dark" >
                                <div class="d-flex flex-column h-70 p-2 pb-3 text-shadow-1">
                                    <div class="mb-1">
                                        <h4 class="fw-bold" style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${shows[i].film.film_name}
                                  
                                        </h4>
                                        <p class="text-muted">${schedule.schedule_date} ${shows[i].time_start}</p>
                                        <p class="badge ${(shows[i].status) ? 'bg-success text-white' : 'bg-danger text-white'}">${shows[i].status ? 'ACTIVE' : 'IN-ACTIVE'}</p>
                                    </div>
                                    <ul class="d-flex list-unstyled mt-3">
                                        <li class="me-auto">
                                            <button class="btn btn-outline-warning showSeats" value="${shows[i].room.room_id}"><i class="fas fa-plus"></i></button></li>

                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                                            <span id="admit${shows[i].room.room_id}" class="admit" value="${shows[i].room.room_id}"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    `;
                }
                $("#menuProduct").html(content);
                $(".showSeats").on("click", function (){
                    let roomId = $(this).val();
                    showListSeats(roomId);
                })
                for (let i =0; i < shows.length; i++){
                    $.ajax({
                        type: "GET",
                        url: `/seat/getSeatsByRoom/${shows[i].room.room_id}`
                    }).done((seats) =>{
                        $(`#admit${shows[i].room.room_id}`).html(`
                            <p>${App.countTakenSeat(seats)}/100</p>
                        `)
                    })
                }
            })
        }
            else {
            $.ajax({
                type: "GET",
                url: `/show/allShows/${schedule.schedule_id}`
            }).done((shows) => {
                let content =``;
                for (let i = 0; i < shows.length; i++) {
                    content += `
                        <div class="col-md-4 mb-3" >
                            <div class="rounded card h-40 text-dark" >
                                <div class="d-flex flex-column h-70 p-2 pb-3 text-shadow-1">
                                    <div class="mb-1">
                                        <h4 class="fw-bold" style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${shows[i].film.film_name}</h4>
                                        <p class="text-muted">${schedule.schedule_date} ${shows[i].time_start}</p>
                                        <p class="badge ${(shows[i].status) ? 'bg-success text-white' : 'bg-danger text-white'}">${shows[i].status ? 'ACTIVE' : 'IN-ACTIVE'}</p>
                                    </div>
                                    <ul class="d-flex list-unstyled mt-3">
                                        <li class="me-auto">
                                            <button class="btn btn-outline-warning showSeats" value="${shows[i].room.room_id}"><i class="fas fa-plus"></i></button></li>

                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                                            <span id="admit${shows[i].room.room_id}" class="admit" value="${shows[i].room.room_id}"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    `;
                }
                $("#menuProduct").html(content);
                $(".showSeats").on("click", function (){
                    let roomId = $(this).val();
                    showListSeats(roomId);
                })
                for (let i =0; i < shows.length; i++){
                    $.ajax({
                        type: "GET",
                        url: `/seat/getSeatsByRoom/${shows[i].room.room_id}`
                    }).done((seats) =>{
                        $(`#admit${shows[i].room.room_id}`).html(`
                            <p>${App.countTakenSeat(seats)}/100</p>
                        `)
                    })
                }
            })
        }
    })
}

function getCurrentShow(){
    let id = $("#schedule").val();
    $.ajax({
        type: "GET",
        url: `/schedules/${id}`
    }).done((schedule) =>{
        if (schedule.schedule_date === App.getToday()){
            $.ajax({
                type: "GET",
                url: `/show/allActiveShowsToday/${schedule.schedule_id}`
            }).done((shows) => {
                let content =``;
                for (let i = 0; i < shows.length; i++) {
                    content += `
                        <div class="col-md-4 mb-3" >
                            <div class="rounded card h-40 text-dark" >
                                <div class="d-flex flex-column h-70 p-2 pb-3 text-shadow-1">
                                    <div class="mb-1">
                                        <h4 class="fw-bold" style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${shows[i].film.film_name}</h4>
                                        <p class="text-muted">${schedule.schedule_date} ${shows[i].time_start}</p>
                                        <p class="badge ${(shows[i].status) ? 'bg-success text-white' : 'bg-danger text-white'}">${shows[i].status ? 'ACTIVE' : 'IN-ACTIVE'}</p>   
                                    </div>
                                    <ul class="d-flex list-unstyled mt-3">
                                        <li class="me-auto">
                                            <button class="btn btn-outline-warning showSeats" value="${shows[i].room.room_id}"><i class="fas fa-plus"></i></button></li>

                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                                            <span id="admit${shows[i].room.room_id}" class="admit" value="${shows[i].room.room_id}"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    `;
                }
                $("#menuProduct").html(content);
                $(".showSeats").on("click", function (){
                    let roomId = $(this).val();
                    showListSeats(roomId);
                })
                for (let i =0; i < shows.length; i++){
                    $.ajax({
                        type: "GET",
                        url: `/seat/getSeatsByRoom/${shows[i].room.room_id}`
                    }).done((seats) =>{
                        $(`#admit${shows[i].room.room_id}`).html(`
                            <p>${App.countTakenSeat(seats)}/100</p>
                        `)
                    })
                }
            })
        }
    })
}

function searchFilmName(){
    let schedule_id = $("#schedule").val();
    let film_name = $("#searchFilmName").val();

    $.ajax({
        type: "GET",
        url: `/show/searchShow/${schedule_id}/${film_name}`
    }).done((shows) => {
        let content =``;
        for (let i = 0; i < shows.length; i++) {
            content += `
                        <div class="col-md-4 mb-3" >
                            <div class="rounded card h-40 text-dark" >
                                <div class="d-flex flex-column h-70 p-2 pb-3 text-shadow-1">
                                    <div class="mb-1">
                                        <h4 class="fw-bold" style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${shows[i].film.film_name}
                                  
                                        </h4>
                                        <p class="text-muted">${schedule.schedule_date} ${shows[i].time_start}</p>
                                        <p class="badge ${(shows[i].status) ? 'bg-success text-white' : 'bg-danger text-white'}">${shows[i].status ? 'ACTIVE' : 'IN-ACTIVE'}</p>
                                    </div>
                                    <ul class="d-flex list-unstyled mt-3">
                                        <li class="me-auto">
                                            <button class="btn btn-outline-warning showSeats" value="${shows[i].room.room_id}"><i class="fas fa-plus"></i></button></li>

                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                                            <span id="admit${shows[i].room.room_id}" class="admit" value="${shows[i].room.room_id}"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    `;
        }
        $("#menuProduct").html(content);
        $(".showSeats").on("click", function (){
            let roomId = $(this).val();
            showListSeats(roomId);
        })
        for (let i =0; i < shows.length; i++){
            $.ajax({
                type: "GET",
                url: `/seat/getSeatsByRoom/${shows[i].room.room_id}`
            }).done((seats) =>{
                $(`#admit${shows[i].room.room_id}`).html(`
                            <p>${App.countTakenSeat(seats)}/100</p>
                        `)
            })
        }
    })
}

function showListSeats(roomId){
    $.ajax({
        type: "GET",
        url: `/seat/getSeatsByRoom/${roomId}`
    }).done((seats) => {
        let content = ` <div class="modal-header">
                <h5 class="modal-title" id="room-name">${seats[0].room.room_name}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="d-flex justify-content-center">
                    <thead class="justify-content-center">
                        <h2 class="text-center">Màn hình</h2>
                    </thead>
                    <tbody >
                        <tr>`;
        for (let i = 1; i <= seats.length; i++) {
            if (i === 100){
                content += `<td class="btn ${(seats[i-1].seatStatus.id === 1) ? 'btn-light' : ((seats[i-1].seatStatus.id === 2) ? 'btn-success' : 'btn-danger')} m-2">${seats[i-1].seat_name}</td>
                        </tr>`
            }
            else if (i % 10 === 0){
                content += `<td class="btn ${(seats[i-1].seatStatus.id === 1) ? 'btn-light' : ((seats[i-1].seatStatus.id === 2) ? 'btn-success' : 'btn-danger')} m-2">${seats[i-1].seat_name}</td>
                        </tr>
                        <tr>`
            } else {
                content += `<td class="btn ${(seats[i-1].seatStatus.id === 1) ? 'btn-light' : ((seats[i-1].seatStatus.id === 2) ? 'btn-success' : 'btn-danger')} m-2">${seats[i-1].seat_name}</td>`
            }
        }
        content += `</tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary dismiss-modal" data-bs-dismiss="modal">Đóng</button>
            </div>` ;
        $("#seatsModal .modal-content").html(content);
        $("#seatsModal").modal("show");
    })
}

$("#searchFilmName").on("input", function (){
    if ($("#searchFilmName").val() === ""){
        getCurrentShow();
    } else {
        searchFilmName();
    }
});

getSchedules();
