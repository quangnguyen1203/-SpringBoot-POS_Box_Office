function getAllProduct(){
    $.ajax({
        type: "GET",
        url: "/products/allHiddenProduct"
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
                                <button value="${product[i].product_id}" class="btn btn-outline-primary delete-button" ><i class="fas fa-trash-restore"></i>Khôi phục</button>
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
    })
}

function deleteConfirm(productID) {
    $.ajax({
        type : "POST",
        url : `/products/${productID}`
    }).done(function (){
        $("#row" + productID).remove();
        App.showSuccessAlert("Khôi phục thành công!")
    }).fail(function (){
        App.showErrorAlert("Đã xảy ra lỗi!")
    })
}

getAllProduct();

$(".delete-button").on("click",deleteConfirm);