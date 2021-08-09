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
                                        <h4 class="fw-bold" style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${shows[i].film.film_name}</h4>
                                        <p class="text-muted">${schedule.schedule_date} ${shows[i].time_start}</p>
                                    </div>
                                    <ul class="d-flex list-unstyled mt-3">
                                        <li class="me-auto">
                                            <button class="btn btn-outline-warning addToOrder"><i class="fas fa-plus"></i></button></li>

                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                                            <span class="admit" value="${shows[i].room.room_id}"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    `;
                }
                $("#menuProduct").html(content);
            })
        }
    })
}



getSchedules();
