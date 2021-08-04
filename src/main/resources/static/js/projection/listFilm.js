App.getUser();

function getAllFilm(){
    $.ajax({
        type: "GET",
        url: "/films/allFilm"
    }).done(function (films){
        let content = "";
        for (let i = films.length-1; i >= 0; i--) {
            content += `
                            <div class="col-md-6" >
                                <div class="ml-2 mr-2 row g-0 border rounded overflow-hidden flex-md-row  mb-4 shadow-sm h-md-300  position-relative ">
                                    <div class="col-auto d-none d-lg-block">
                                     <img style="object-fit: cover"  width="220" height="310" src= "/uploads/${films[i].image}"  alt="${films[i].film_name}">
                                    </div>
                                    <div class="col p-4 d-flex flex-column position-static">
                                        <div>
                                        <h4 class="mb-5"><b>${films[i].film_name}</b></h4>
                                        </div>
                                        <div class="mb-2"><strong>Thời lượng:</strong></br> ${films[i].duration}</div>
                                        <p class=" mb-2">
                                           <strong>Ngày công chiếu:</strong></br> ${films[i].exp_date}
                                        </p>
                                          <p class="mb-2">
                                           <strong>Lượt xem: ${films[i].admit}</strong></br>
                                        </p>
                                        <a href="/films/edit-form/${films[i].film_id}" value="${films[i].film_id}" type="submit" class="edit-button">
                                        <i class="edit-button" style="color: #0a53be">Chi tiết</i></a>
                                        </a> 
                                    </div>
                             
                                </div>
                            </div>
                `;
        }
        $("#listFilm tbody").html(content);
    })
}

getAllFilm();



// $(() => {
//     $("#edit-product").validate({
//         errorElement: 'div',
//         rules: {
//             product_name:  {
//                 required: true,
//                 minlength: 2,
//                 maxlength: 50,
//             },
//             price: {
//                 required: true,
//                 number: true
//             },
//             upCountry:{
//                 required:true
//             },
//             inputImage: {
//                 required:true
//             }
//         },
//
//         messages: {
//             product_name: {
//                 required: "Vui lòng nhập tên sản phẩm",
//                 minlength: "Vui lòng nhập tối thiểu 2 ký tự!",
//                 maxlength: "Vui lòng nhập tối đa chỉ có 50 ký tự!"
//             },
//             price: {
//                 required: "Vui lòng nhập giá sản phẩm!",
//                 number: "Vui lòng chỉ nhập số"
//             },
//             upCountry: "Vui lòng chọn loại sản phẩm",
//             description:{
//                 required:"Vui lòng nhập mô tả!"
//             }
//         },
//
//         submitHandler : saveProduct
//     });
// });