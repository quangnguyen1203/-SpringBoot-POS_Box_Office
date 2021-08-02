function getAllCategory(){
    $.ajax({
        type: "GET",
        url: "/products/allCategory"
    }).done(function (category){
        let content = "";
        for (let i = 0; i < category.length; i++) {
            content += `
                    <option value="${category[i].category_id}">${category[i].category_name}</option>
                `;
        }
        $("#upCategory").html(content);
    })
}

function getAllProduct(){
    $.ajax({
        type: "GET",
        url: "/products/allProduct"
    }).done(function (product){
        let content = "";
        for (let i = product.length-1; i >= 0; i--) {
            content += `
                        <tr id="row${product[i].product_id}">
                              <input hidden id="${product[i].product_id}">
                              <td>${product[i].product_name}</td>
                              <td>${product[i].price + "$"}</td>
                              <td>${product[i].description}</td>
                              <td>${product[i].category.category_name}</td>
                              <td class="text-center">
                                <button value="${product[i].product_id}" class="btn btn-outline-primary mr-2 edit-button" ><i class="far fa-edit"></i>Sửa</button>
                                <button value="${product[i].product_id}" class="btn btn-outline-danger delete-button" ><i class="fas fa-trash-alt"></i>Xóa</button>
                              </td>
                        </tr>
                `;
        }
        $("#productList tbody").html(content);
        $(".delete-button").on("click", function (){
            App.showDeleteConfirmDialog().then((result) => {
                if (result.isConfirmed){
                    let id = $(this).attr("value");
                    deleteConfirm(id);
                }
            });
        })
        $(".edit-button").on("click",function (){
            let id = $(this).attr("value");
            editProduct(id);
        })
    })
}

function editProduct(productID){
    $.ajax({
        type: "GET",
        url: `/products/edit-product/${productID}`,
    }).done(function (product){
        $('#upID').val(product.product_id);
        $('#upProductName').val(product.product_name);
        $('#upPrice').val(product.price);
        $('#upDescription').val(product.description);
        $('#upCategory').val(product.category.category_id);
        $('#editModal').modal('show');
    }).fail(function (){
        App.showErrorAlert("Đã xảy ra lỗi!")
    })
}

function saveProduct(){
    let product_id = $("#upID").val();
    let product_name = $("#upProductName").val();
    let price = $("#upPrice").val();
    let description = $("#upDescription").val();
    let category = $("#upCategory").val();
    let newCategory = {
        category_id : category
    }

    let product = {
        product_id:product_id,
        product_name : product_name,
        price : price,
        description : description,
        category : newCategory
    }

    if ($("#edit-product").valid()){
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "PUT",
            data: JSON.stringify(product),
            url: `/products/edit/${product_id}`,
            success: function (product) {
                $('#row'+product_id+ ' td').remove();
                $('#row'+product_id).html(`
                        <td>${product.product_name}</td>
                        <td>${product.price} $</td>
                        <td>${product.description}</td>
                        <td>${product.category.category_name}</td>
                        <td class="text-center">
                            <button value="${product.product_id}" class="btn btn-outline-primary mr-2 edit-button" ><i class="fas fa-edit"></i>Sửa</button>
                            <button value="${product.product_id}" class="btn btn-outline-danger delete-button" ><i class="fas fa-trash-alt"></i>Xóa</button>
                        </td>`);
                $(".delete-button").on("click", function (){
                    App.showDeleteConfirmDialog().then((result) => {
                        if (result.isConfirmed){
                            let id = $(this).attr("value");
                            deleteConfirm(id);
                        }
                    });
                })
                $(".edit-button").on("click",function (){
                    let id = $(this).attr("value");
                    editProduct(id);
                })
                $('#editModal').modal("hide");
                App.showSuccessAlert("Edit product successfully!")
                $("#edit-product")[0].reset();
            }
        })
    }
}

function deleteConfirm(productID) {
    $.ajax({
        type : "DELETE",
        url : `/products/${productID}`
    }).done(function (){
        $("#row" + productID).remove();
        App.showSuccessAlert("Xóa")
    }).fail(function (){
        App.showErrorAlert("Đã xảy ra lỗi!")
    })
}


$(".edit-button").on("click",editProduct);

$(".save-product").on("click",saveProduct);

$(".delete-button").on("click",deleteConfirm);

getAllCategory();

getAllProduct();

$(() => {
    $("#edit-product").validate({
        errorElement: 'div',
        rules: {
            product_name:  {
                required: true,
                minlength: 2,
                maxlength: 50,
            },
            price: {
                required: true,
                number: true
            },
            upCountry:{
                required:true
            },
            inputImage: {
                required:true
            }
        },

        messages: {
            product_name: {
                required: "Vui lòng nhập tên sản phẩm",
                minlength: "Vui lòng nhập tối thiểu 2 ký tự!",
                maxlength: "Vui lòng nhập tối đa chỉ có 50 ký tự!"
            },
            price: {
                required: "Vui lòng nhập giá sản phẩm!",
                number: "Vui lòng chỉ nhập số"
            },
            upCountry: "Vui lòng chọn loại sản phẩm",
            description:{
                required:"Vui lòng nhập mô tả!"
            }
        },

        submitHandler : saveProduct
    });
});
