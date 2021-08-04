//Tạo tài khoản

function user(){


    let user = {
        username: $("#username").val(),
        password: $("#password").val(),
        phone: $("#phone").val(),
        email: $("#email").val(),
        fullName: $("#fullName").val(),
        role: {
            id: $("#role").val()
        }
    }

    if ($("#create-form").valid()){
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            data: JSON.stringify(user),
            url: "/user/create"
        }).done(() => {
            $("#create-form")[0].reset();
            App.showSuccessAlert("Đăng ký thành công!");
        }).fail(()=>{
            App.showErrorAlert("Có lỗi đã xảy ra, vui lòng kiểm tra lại!")
        })
    }
}

function getAllRole(){
    $.ajax({
        type: "GET",
        url: "/role/allRole"
    }).done((roles) => {
        let content = "";
        for (let i = 0; i < roles.length; i++) {
            content += `
                <option value="${roles[i].id}">${roles[i].name}</option>
            `;
        }
        $("#role").html(content);
    })
}

getAllRole();

$("#create-button").on("click",user);

$.validator.addMethod("validatePhone", function (value, element) {
    return this.optional(element) || /((09|03|07|08|05)+([0-9]{8})\b)/g.test(value);
}, "Hãy nhập số điện thoại hợp lệ!!!");

$.validator.addMethod("validateEmail", function (value, element){
    return this.optional(element) ||  /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
}, "Hãy nhập email hợp lệ!!!")

$(() => {
    $("#create-form").validate({
        errorElement: 'div',
        rules: {
            username:  {
                required: true,
                minlength: 4,
                maxlength: 20
            },
            password: {
                required: true,
                minlength: 4,
                maxlength: 20
            },
            phone: {
                required: true,
                minlength: 10,
                maxlength: 11,
                validatePhone: true
            },
            email:{
                required: true,
                validateEmail: true
            },
            fullName:{
                required: true
            },
            role: {
                required: true
            }
        },
        messages: {
            username: {
            required: "Vui lòng nhập username",
            minlength: "Vui lòng nhập tối thiểu 4 ký tự!",
            maxlength: "Vui lòng nhập tối đa chỉ có 20 ký tự!"
            },
            password: {
                required: "Vui lòng nhập mật khẩu!",
                minlength: "Vui lòng nhập tối thiểu 4 ký tự!",
                maxlength: "Vui lòng nhập tối đa chỉ có 20 ký tự!"
            },
            phone: {
                required: "Vui lòng nhập số điện thoại!",
                minlength: "Vui lòng nhập tối thiểu 10 số!",
                maxlength: "Vui lòng nhập tối đa 11 số!"
            },
            email: {
                required: "Vui lòng nhập email!"
            },
            fullName: {
                required: "Vui lòng họ tên!"
            },
            role: {
                required: "Vui lòng chọn chức vụ"
            }
        },
        submitHandler : user
    });
});




//Hiển thị danh sách tài khoản

function getListUsers(){
    $.ajax({
        type: "GET",
        url: "/user/listUsers"
    }).done((users) =>{
        let content = "";
        for (let i = users.length - 1; i >=0 ; i--) {
            content += `
                <tr id="row${users[i].id}">
                    <td class="text-center">${users[i].fullName}</td>
                    <td class="text-center">${users[i].username}</td>
                    <td class="text-center">${users[i].email}</td>
                    <td class="text-center">${users[i].phone}</td>
                    <td class="text-center">${users[i].role.name}</td>
                    <td>
                       <button value="${users[i].id}" class="btn btn-outline-primary mr-2 edit-button" ><i class="far fa-edit"></i>Sửa</button>
                            <button value="${users[i].id}" class="btn btn-outline-danger delete-button" ><i class="fas fa-trash-alt"></i>Xóa</button>
                    </td>
                </tr>   
            `;
        }
        $("#listUsers").html(content);
        $(".delete-button").on("click", function (){
            App.showDeleteConfirmDialog().then((result) => {
                if (result.isConfirmed) {
                    let id = $(this).attr("value");
                    deleteUser(id);
                }
                App.showSuccessAlert("Xóa thành viên thành công!")
            })
        })
        $(".edit-button").on("click", function (){
            let id = $(this).attr("value");
            $.ajax({
                type: "GET",
                url: `/user/getUser/${id}`
            }).done((user)=> {
                $("#userId").val(user.id);
                $("#edit-username").val(user.username);
                $("#edit-phone").val(user.phone);
                $("#edit-email").val(user.email);
                $("#edit-fullName").val(user.fullName);
                $("#role").val(user.role.id);
                $("#editModal").modal("show");
            })
        })
    })
}

function deleteUser(id){
    $.ajax({
        type: "POST",
        url: `/user/delete/${id}`
    }).done((user) => {
        $(`#row${user.id}`).html("");
        App.showSuccessAlert("Xóa tài khoản thành công!");
    }).fail(() => {
        App.showErrorAlert("Có lỗi xảy ra!");
    })
}

function saveUser(){
    let userId = $("#userId").val();

    let newUser = {
        username: $("#edit-username").val(),
        phone: $("#edit-phone").val(),
        email: $("#edit-email").val(),
        fullName: $("#edit-fullName").val(),
        role: {
            id: $("#role").val()
        }
    }


    $.ajax({
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        type: "PUT",
        url: `/user/edit/${userId}`,
        data: JSON.stringify(newUser)
    }).done((user) =>{
        let content = `
    <td class="text-center">${user.fullName}</td>
                <td class="text-center">${user.username}</td>
                <td class="text-center">${user.email}</td>
                <td class="text-center">${user.phone}</td>
                <td class="text-center">${user.role.name}</td>
                <td>
                   <button value="${userId}" class="btn btn-outline-primary mr-2 edit-button" ><i class="far fa-edit"></i>Sửa</button>
                        <button value="${userId}" class="btn btn-outline-danger delete-button" ><i class="fas fa-trash-alt"></i>Xóa</button>
                </td>
    `;
        $("#row" + userId).html(content);

        $(".delete-button").on("click", function (){
            App.showDeleteConfirmDialog().then((result) => {
                if (result.isConfirmed) {
                    let id = $(this).attr("value");
                    deleteUser(id);
                    App.showSuccessAlert("Xóa thành viên thành công!")
                }
            })
        })

        $(".edit-button").on("click", function (){
            let id = $(this).attr("value");
            $.ajax({
                type: "GET",
                url: `/user/getUser/${id}`
            }).done((user)=> {
                $("#userId").val(user.id);
                $("#edit-username").val(user.username);
                $("#edit-phone").val(user.phone);
                $("#edit-email").val(user.email);
                $("#edit-fullName").val(user.fullName);
                $("#role").val(user.role.id);
                $("#editModal").modal("show");
            })
        })
    })


}

$(".save-user").on("click", function (){
    if ($("#edit-form").valid()){
        saveUser();
        $("#editModal").modal("hide");
        $("#edit-form")[0].reset();
        App.showSuccessAlert("Cập nhật thông tin tài khoản thành công!");
    }

});

getListUsers();

//Danh sách tai khoản bị xóa

function getDeletedUsers(){
    $.ajax({
        type: "GET",
        url: "/user/getDeletedUser"
    }).done((users) =>{
        let content = "";
        for (let i = users.length - 1; i >=0 ; i--) {
            content += `
                <tr id="row${users[i].id}">
                    <td class="text-center">${users[i].fullName}</td>
                    <td class="text-center">${users[i].username}</td>
                    <td class="text-center">${users[i].email}</td>
                    <td class="text-center">${users[i].phone}</td>
                    <td class="text-center">${users[i].role.name}</td>
                    <td>
                       <button value="${users[i].id}" class="btn btn-outline-primary mr-2 restore-button" ><i class="far fa-window-restore"></i> Khôi phục</button>  
                    </td>
                </tr>   
            `;
        }
        $("#deletedUsers").html(content);
        $(".restore-button").on("click", function (){
            App.showDeleteConfirmDialog().then((result) => {
                if (result.isConfirmed) {
                    let id = $(this).attr("value");
                    deleteUser(id);
                    // App.showSuccessAlert("Khôi phục thành viên thành công!")
                }
            })
        })
})
}

$(() => {
    $("#edit-form").validate({
        errorElement: 'div',
        rules: {
            username:  {
                required: true,
                minlength: 4,
                maxlength: 20
            },
            phone: {
                required: true,
                minlength: 10,
                maxlength: 11,
                validatePhone: true
            },
            email:{
                required: true,
                validateEmail: true
            },
            fullName:{
                required: true
            },
            role: {
                required: true
            }
        },
        messages: {
            username: {
                required: "Vui lòng nhập username",
                minlength: "Vui lòng nhập tối thiểu 4 ký tự!",
                maxlength: "Vui lòng nhập tối đa chỉ có 20 ký tự!"
            },
            phone: {
                required: "Vui lòng nhập số điện thoại!",
                minlength: "Vui lòng nhập tối thiểu 10 số!",
                maxlength: "Vui lòng nhập tối đa 11 số!"
            },
            email: {
                required: "Vui lòng nhập email!"
            },
            fullName: {
                required: "Vui lòng họ tên!"
            },
            role: {
                required: "Vui lòng chọn chức vụ"
            }
        },
        submitHandler : saveUser
    });
});

getDeletedUsers();