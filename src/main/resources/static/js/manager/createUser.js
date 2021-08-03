function createUser(){


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
        console.log(user.email)
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

$("#create-button").on("click",createUser);

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
        submitHandler : createUser
    });
});