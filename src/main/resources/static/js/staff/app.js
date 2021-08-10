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
                                            <button class="btn btn-outline-warning addToProduct"><i class="fas fa-plus"></i></button></li>

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


//Quầy đồ uống
function allItems(){
    $.ajax({
        type: "GET",
        url: "/app/allProduct"
    }).done(function (product){
        let content = "";
        for (let i = 0; i < product.length ; i++) {
            content += `
                  <div class="col-md-4 mb-5" >
                    <div class="rounded card h-40 text-dark" >
                      <div class="d-flex flex-column h-80 p-2 pb-3 text-shadow-1">
                        <div class="mb-1">
                          <h4 class="fw-bold"  style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${product[i].product_name}</h4>
                          <p class="text-muted" >${product[i].category.category_name}</p>
                        </div>
                        <ul class="d-flex list-unstyled mt-3">
                          <li class="me-auto">
                            <button class="btn btn-outline-warning addToOrder" value="${product[i].product_id}"><i class="fas fa-plus "></i></button></li>
                          <li class="d-flex align-items-center">
                            <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                            <strong><small >${product[i].price}</small> $</strong>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>`;
            $('#menuProduct').html(content);
            // $(".addToOrder").on("click",function (){
            //     let id = $(this).attr("value");
            //     getProduct(id);
            // })
        }
    })
}

function getAllCategory(){
    $.ajax({
        type: "GET",
        url: "/app/allCategory"
    }).done(function (category){
        let content = `<li class="nav-item">
                           <a class="nav-link btn-outline-warning fw-bold allListProduct" aria-current="page" href="#" >Tất cả</a>
                        </li>`;
        for (let i = 0; i < category.length; i++) {
            content += `
                    <li class="nav-item">
                    <a class="nav-link btn-outline-warning fw-bold searchByCategoryId" href="#" value="${category[i].category_id}">${category[i].category_name}</a>
                  </li>
                `;
        }
        $(".allItemProduct").html(content);
        $(".allListProduct").on("click",allItems);
        $(".searchByCategoryId").on("click",function (){
            let id = $(this).attr("value");
            searchProductByCategoryId(id);
        })
    }).fail(()=>{
        App.showErrorAlert("Đã xảy ra lỗi!");
    })
}

function searchProductByCategoryId(id){
    console.log(id);
    $.ajax({
        type: "GET",
        url: `/app/menuProductByCategory/${id}`
    }).done(function (product){
        console.log(product)
        let content = "";
        for (let i = 0; i < product.length ; i++) {
            content += `
                  <div class="col-md-4 mb-5" >
                    <div class="rounded card h-40 text-dark" >
                      <div class="d-flex flex-column h-80 p-2 pb-3 text-shadow-1">
                        <div class="mb-1">
                          <h4 class="fw-bold"  style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${product[i].product_name}</h4>
                          <p class="text-muted">${product[i].category.category_name}</p>
                        </div>
                        <ul class="d-flex list-unstyled mt-3">
                          <li class="me-auto">
                            <button class="btn btn-outline-warning addToOrder" value="${product[i].product_id}"><i class="fas fa-plus "></i></button></li>
                          <li class="d-flex align-items-center">
                            <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                            <strong><small >${product[i].price}</small> $</strong>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>`;}
        $('#menuProduct').html(content);
    })
}

//Tạo mới thành viên
$(".createMember").on("click",function (){
    $("#editModal").modal('show');
});

function createMemberApp(){
    let member_name = $("#member_name").val();
    let phoneNumber = $("#phoneNumber").val();
    let email = $("#email").val();


    let member = {
        member_name: member_name,
        phoneNumber: phoneNumber,
        email : email
    }

    if ($("#create-form").valid()){
        console.log(member)
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            data: JSON.stringify(member),
            url: "/app/createNewMember"
        }).done(function (e){
            console.log(e)
            $("#create-form")[0].reset();
            App.showSuccessAlert("Tạo mới thành viên thành công");
            $("#editModal").modal('hide');
        }).fail(()=>{
            App.showErrorAlert("Đã xảy ra lỗi!");
        })
    }
}

$("#create-button").on("click",createMemberApp);


$(() => {
    $("#create-form").validate({
        errorElement: 'div',
        rules: {
            member_name:  {
                required: true,
                minlength: 5,
                maxlength: 50,
            },
            phoneNumber: {
                required: true,
                number: true,
                minlength:10,
                maxlength:11,
                validatePhone:true
            },
            email:{
                required:true
            }
        },

        messages: {
            member_name: {
                required: "Vui lòng nhập họ và tên",
                minlength: "Vui lòng nhập tối thiểu 2 ký tự!",
                maxlength: "Vui lòng nhập tối đa chỉ có 50 ký tự!"
            },
            phoneNumber: {
                required: "Vui lòng nhập số điện thoại!",
                number: "Vui lòng chỉ nhập số",
                minlength: "Vui lòng nhập tối thiểu 10 số!",
                maxlength: "Vui lòng nhập tối đa chỉ có 11 số!"
            },
            email:{
                required:"Vui lòng nhập địa chỉ email"
            }
        },

        submitHandler : createMemberApp
    });
});
$.validator.addMethod("validatePhone", function (value, element) {
    return this.optional(element) || /((09|03|07|08|05)+([0-9]{8})\b)/g.test(value);
}, "Hãy nhập số điện thoại hợp lệ!!!");


//Tìm kiếm thành viên
function searchByMember(){
    let string = $("#search").val();
        $.ajax({
            type:"GET",
            url: `/app/searchMember/${string}`
        }).done(function (member){
                if(member !== "") {
                    let content = "";
                    for (let i = 0; i < member.length; i++) {
                        content += `
                            <tr>
                                <td>${member[i].member_name}</td>
                                <td>${member[i].phoneNumber}</td>
                                <td>${member[i].email}</td>
                                <td>${member[i].aclass.class_name}</td>
                                <td>
                                    <button type="button" class="btn btn-outline-primary text-center">Chọn</button>
                                </td>
                            </tr>
                        `;
                    }
                    $("#detailMember").html(content);
                } else {
                    App.showErrorAlert("Chưa đăng ký thành viên!")
                }
        }).fail(function (){
            App.showErrorAlert("Hãy nhập để tìm kiếm!")
        })
}

$(".searchMember").on("click",function (){
    if($("#search").val() !== ""){
        $("#searchModal").modal('show');
        searchByMember();
    } else {
        App.showErrorAlert("Hãy nhập để tìm kiếm!")
    }

});
$(".close-button").on("click",function (){
    $("#search").val("");
    $("#editModal").modal('hide');
});

//Thêm vào danh sách bán hàng

let order = {
    total_price: 0,
    order_time: 0,
    order_date: 0,
    products: [],
    ticket: []
};

function checkSelected(arr, name){
    for (let i = 0; i < arr.length; i++){
        if (arr[i].product_name === name){
            return i;
        }
    }
    return -1;
}

function getProduct(id){
    $.ajax({
        type: "GET",
        url: `/app/findProduct/${id}`,
        success: function (data){
            let productName = data.product_name;
            let indexProduct = checkSelected(order.products,productName);
            if (indexProduct === -1){
                order.products.push(data);
            } else {
                order.products[indexProduct].amount++;
            }
            drawOrder(order);
        }
    })
}

$(".allProduct").on("click",allItems)
$(".allProduct").on("click",getAllCategory)
