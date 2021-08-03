function getAllClass(){
    $.ajax({
        type: "GET",
        url: "/members/allClass"
    }).done(function (classes){
        let content = "";
        for (let i = 0; i < classes.length; i++) {
            content += `
                    <option value="${classes[i].class_id}">${classes[i].class_name}</option>
                `;
        }
        $("#classes").html(content);
    })
}

function createMember(){
    let member_name = $("#member_name").val();
    let phoneNumber = $("#phoneNumber").val();
    let email = $("#email").val();
    let classes = $("#classes").val();

    let newClass = {
        class_id : classes
    }

    let member = {
        member_name: member_name,
        phoneNumber: phoneNumber,
        email : email,
        aClass: newClass
    }

    if ($("#create-form").valid()){
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            data: JSON.stringify(member),
            url: "/members/createNewMember"
        }).done(function (){
            $("#create-form")[0].reset();
            App.showSuccessAlert("Tạo mới thành viên thành công");
        }).fail(()=>{
            App.showErrorAlert("Đã xảy ra lỗi!");
        })
    }
}

$("#create-button").on("click",createMember);

getAllClass();

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
                maxlength:11
            },
            email:{
                required:true
            },
            classes:{
                required:true
            }

        },

        messages: {
            member_name: {
                required: "Vui lòng nhập tên sản phẩm",
                minlength: "Vui lòng nhập tối thiểu 2 ký tự!",
                maxlength: "Vui lòng nhập tối đa chỉ có 50 ký tự!"
            },
            phoneNumber: {
                required: "Vui lòng nhập giá sản phẩm!",
                number: "Vui lòng chỉ nhập số",
                minlength: "Vui lòng nhập tối thiểu 10 số!",
                maxlength: "Vui lòng nhập tối đa chỉ có 11 số!"
            },
            email:{
                required:"Vui lòng chọn loại sản phẩm"
            },
            classes:{
                required:"Vui lòng nhập mô tả!"
            }
        },

        submitHandler : createMember
    });
});