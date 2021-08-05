App.getUser();

function getAllSchedule(){
    $.ajax({
        type: "GET",
        url: "/schedules/allSchedule"
    }).done(function (schedules){
        let content = "";
        for (let i = schedules.length-1; i >= 0; i--) {
            content += `
                <div class="col-lg-4">
                    <div class="our-team-main" style="background-color: rgb(225, 243, 245)">
                        <div class="team-front">
                            <h3>Lịch chiếu hôm: </h3>
                            <h2>${schedules[i].schedule_date}</h2>
                        </div>
                        <div class="team-back">
                            <button class="btn btn-primary mt-4 ml-3">Click để xem thông tin suất chiếu</button>
                        </div>
                    </div>
                </div>
                `;
        }
        $("#listSchedule tbody").html(content);
    })
}

getAllSchedule();