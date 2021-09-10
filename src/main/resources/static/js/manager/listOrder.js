App.getUser();

$(".logout").on("click", App.logout);

function getListOrderDate(){
    let order_date  = $('#order_date').val();
    $.ajax({
        type : "GET",
        url : `/orders/findByOrderDate/${order_date}`
    }).done(function (orders){
        let content = "";
        // if(orders.length === 0){
            // content = "Chưa Thực hiện giao dịch"
        // }else {
            for (let i = 0; i < orders.length; i++) {
                content += `
             <tr id="row${orders[i].order_id}">
                              <input hidden id="${orders[i].order_id}">
                              <td>${orders[i].order_id}</td>
                              <td class="text-center">${orders[i].order_time}</td>
                              <td class="text-right"><a value="${orders[i].order_id}" class="btn modalProduct">${orders[i].total_product.toLocaleString('vi', {
                    style: 'currency',
                    currency: 'VND'
                })}</a></td>
                              <td class="text-right"><a value="${orders[i].order_id}" class="btn modalTicket">${orders[i].total_ticket.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</a></td>
                              <td class="text-right">${orders[i].total_price.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</td>
                              <td class="text-center">${orders[i].member == null ? "None" : orders[i].member.member_name}</td>
                              <td class="text-center">${orders[i].user.username}</td>
                        </tr>
                        
            `;
            }
        // }
        $("#orderList tbody").html(content);

        $('.modalProduct').on("click", function () {
            let id = $(this).attr('value');
            getTotalProduct(id);
        })
        $('.modalTicket').on('click',function (){
            let id = $(this).attr('value');
            getTotalTicket(id);
        })

    })
}

function getTotalAllPrice(){
    let order_date = $("#order_date").val();
    $.ajax({
        type: "GET",
        url: `/orders/findByTicketOfOrderDate/${order_date}`
    }).done(function (tickets) {
        $.ajax({
            type: "GET",
            url : `/orders/findByOrderDate/${order_date}`
        }).done(function (orders){
            let amountTicket = 0;
            let totalMoney = 0;
            let content = "";
            for (let i = 0; i < tickets.length ; i++) {
                amountTicket++;
            }
            for (let i = 0; i < orders.length; i++) {
                totalMoney += orders[i].total_price;
                content = `
            <tr>
                <td colspan="5"><strong>Tống số vé bán ra trong ngày:</strong></td>
                <td></td>
                <td colspan="2" class="text-right"><strong>${amountTicket}</strong></td>
            </tr>
            <tr>
                <td colspan="5"><strong>Tống doanh thu trong ngày:</strong></td>
                <td></td>
                <td colspan="2" class="text-right"><strong>${totalMoney.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</strong></td>
            </tr>
            `;
            }
            $("#orderList tfoot").html(content);
        })
    })
}

function getTotalProduct(id) {
    $.ajax({
        type: "GET",
        url: `/orderDetails/getAllOrderDetail/${id}`
    }).done(function (products) {
        let content1 = "";
        let content = "";
        for (let i = 0; i < products.length; i++) {
            content += `
                        <tr>
                            <td>${products[i].product_name}</td>
                            <td class="text-center">${products[i].product_amount}</td>
                            <td class="text-right">${products[i].price.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</td>
                        </tr> 
        `;
            content1 =`
                     <tr>
                      <td colspan="2"><strong>Tổng giá vé</strong></td>
                      <td class="text-right"><strong>${products[i].order.total_product.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</strong></td>
                    </tr>
            `
        }
        $("#product-modal tbody").html(content);
        $("#product-modal tfoot").html(content1);
        $("#showModalProduct").modal('show');
    })
}

function getTotalTicket(id){
    $.ajax({
        type : "GET",
        url : `/tickets/allTicketByOder/${id}`
    }).done(function (tickets){
        let content1 = "";
        let content = "";
        for (let i = 0; i  < tickets.length ; i++) {
            content += `
                        <tr>
                            <td>${tickets[i].show.film.film_name}</td>
                            <td>${tickets[i].seat.seat_name}</td>
                            <td>${tickets[i].show.time_start}</td>
                            <td>${tickets[i].price.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</td>
                        </tr> 
         `;
            content1 =`
                     <tr>
                      <td colspan="3"><strong>Tổng giá vé</strong></td>
                      <td class="text-right"><strong>${tickets[i].order.total_ticket.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</strong></td>
                    </tr>
            `
        }
        $("#ticket-modal tbody").html(content);
        $("#ticket-modal tfoot").html(content1);
        $("#showModalTicket").modal('show');
    })
}


$("#order_date").on("change",function (){
    getListOrderDate();
    getTotalAllPrice();
});

currentOrderDate();
function currentOrderDate(){
    $("#order_date").val(App.getToday())
}

getListOrderDateToday();

function getListOrderDateToday(){
    let order_date = App.getToday();
    $.ajax({
        type: "GET",
        url: `/orders/findByTicketOfOrderDate/${order_date}`
    }).done(function (tickets) {
        $.ajax({
            type: "GET",
            url : `/orders/findByOrderDate/${order_date}`
        }).done(function (orders){
            let amountTicket = 0;
            let totalMoney = 0;
            let content = "";
            for (let i = 0; i < tickets.length ; i++) {
                amountTicket++;
            }
            for (let i = 0; i < orders.length; i++) {
                totalMoney += orders[i].total_price;
                content = `
            <tr>
                <td colspan="5"><strong>Tống số vé bán ra trong ngày</strong></td>
                <td></td>
                <td colspan="2" class="text-right"><strong>${amountTicket}</strong></td>
            </tr>
            <tr>
                <td colspan="5"><strong>Tống tiền trong ngày</strong></td>
                <td></td>
                <td colspan="2" class="text-right"><strong>${totalMoney.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</strong></td>
            </tr>
            `;
            }
            $("#orderList tfoot").html(content);
        })
    })
    $.ajax({
        type : "GET",
        url : `/orders/findByOrderDate/${order_date}`
    }).done(function (orders){
        let content = "";
        // if(orders.length === 0){
        //     content = "Chưa thực hiện giao dịch"
        // }else {
            for (let i = 0; i < orders.length; i++) {
                content += `
             <tr id="row${orders[i].order_id}">
                              <input hidden id="${orders[i].order_id}">
                              <td>${orders[i].order_id}</td>
                              <td class="text-center">${orders[i].order_time}</td>
                              <td class="text-right"><a value="${orders[i].order_id}" class="btn modalProduct">${orders[i].total_product.toLocaleString('vi', {
                    style: 'currency',
                    currency: 'VND'
                })}</a></td>
                              <td class="text-right"><a value="${orders[i].order_id}" class="btn modalTicket">${orders[i].total_ticket.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</a></td>
                              <td class="text-right">${orders[i].total_price.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</td>
                              <td class="text-center">${orders[i].member == null ? "None" : orders[i].member.member_name}</td>
                              <td class="text-center">${orders[i].user.username}</td>
                        </tr>
                        
            `;
            }
        // }
        $("#orderList tbody").html(content);

        $('.modalProduct').on("click", function () {
            let id = $(this).attr('value');
            getTotalProduct(id);
        })
        $('.modalTicket').on('click',function (){
            let id = $(this).attr('value');
            getTotalTicket(id);
        })
    })
}

$("#orderList").DataTable({
    columnDefs: [
        { orderable: false, targets: [2,3,4] },
        { searchable: false, targets: [0,2,3,4] }
    ],
    "language": {
        "processing": "Đang xử lý...",
        "infoFiltered": "(được lọc từ _MAX_ mục)",
        "aria": {
            "sortAscending": ": Sắp xếp thứ tự tăng dần",
            "sortDescending": ": Sắp xếp thứ tự giảm dần"
        },
        "autoFill": {
            "cancel": "Hủy",
            "fill": "Điền tất cả ô với <i>%d<\/i>",
            "fillHorizontal": "Điền theo hàng ngang",
            "fillVertical": "Điền theo hàng dọc"
        },
        "buttons": {
            "collection": "Chọn lọc <span class=\"ui-button-icon-primary ui-icon ui-icon-triangle-1-s\"><\/span>",
            "colvis": "Hiển thị theo cột",
            "colvisRestore": "Khôi phục hiển thị",
            "copy": "Sao chép",
            "copyKeys": "Nhấn Ctrl hoặc u2318 + C để sao chép bảng dữ liệu vào clipboard.<br \/><br \/>Để hủy, click vào thông báo này hoặc nhấn ESC",
            "copySuccess": {
                "1": "Đã sao chép 1 dòng dữ liệu vào clipboard",
                "_": "Đã sao chép %d dòng vào clipboard"
            },
            "copyTitle": "Sao chép vào clipboard",
            "csv": "File CSV",
            "excel": "File Excel",
            "pageLength": {
                "-1": "Xem tất cả các dòng",
                "_": "Hiển thị %d dòng"
            },
            "pdf": "File PDF",
            "print": "In ấn"
        },
        "infoThousands": "`",
        "select": {
            "cells": {
                "1": "1 ô đang được chọn",
                "_": "%d ô đang được chọn"
            },
            "columns": {
                "1": "1 cột đang được chọn",
                "_": "%d cột đang được được chọn"
            },
            "rows": {
                "1": "1 dòng đang được chọn",
                "_": "%d dòng đang được chọn"
            }
        },
        "thousands": "`",
        "searchBuilder": {
            "title": {
                "_": "Thiết lập tìm kiếm (%d)",
                "0": "Thiết lập tìm kiếm"
            },
            "button": {
                "0": "Thiết lập tìm kiếm",
                "_": "Thiết lập tìm kiếm (%d)"
            },
            "value": "Giá trị",
            "clearAll": "Xóa hết",
            "condition": "Điều kiện",
            "conditions": {
                "date": {
                    "after": "Sau",
                    "before": "Trước",
                    "between": "Nằm giữa",
                    "empty": "Rỗng",
                    "equals": "Bằng với",
                    "not": "Không phải",
                    "notBetween": "Không nằm giữa",
                    "notEmpty": "Không rỗng"
                },
                "number": {
                    "between": "Nằm giữa",
                    "empty": "Rỗng",
                    "equals": "Bằng với",
                    "gt": "Lớn hơn",
                    "gte": "Lớn hơn hoặc bằng",
                    "lt": "Nhỏ hơn",
                    "lte": "Nhỏ hơn hoặc bằng",
                    "not": "Không phải",
                    "notBetween": "Không nằm giữa",
                    "notEmpty": "Không rỗng"
                },
                "string": {
                    "contains": "Chứa",
                    "empty": "Rỗng",
                    "endsWith": "Kết thúc bằng",
                    "equals": "Bằng",
                    "not": "Không phải",
                    "notEmpty": "Không rỗng",
                    "startsWith": "Bắt đầu với"
                }
            },
            "logicAnd": "Và",
            "logicOr": "Hoặc",
            "add": "Thêm điều kiện",
            "data": "Dữ liệu",
            "deleteTitle": "Xóa quy tắc lọc"
        },
        "searchPanes": {
            "countFiltered": "{shown} ({total})",
            "emptyPanes": "Không có phần tìm kiếm",
            "clearMessage": "Xóa hết",
            "loadMessage": "Đang load phần tìm kiếm",
            "collapse": {
                "0": "Phần tìm kiếm",
                "_": "Phần tìm kiếm (%d)"
            },
            "title": "Bộ lọc đang hoạt động - %d",
            "count": "{total}"
        },
        "datetime": {
            "hours": "Giờ",
            "minutes": "Phút",
            "next": "Sau",
            "previous": "Trước",
            "seconds": "Giây"
        },
        "emptyTable": "Không có dữ liệu",
        "info": "Hiển thị _START_ tới _END_ của _TOTAL_ dữ liệu",
        "infoEmpty": "Hiển thị 0 tới 0 của 0 dữ liệu",
        "lengthMenu": "Hiển thị _MENU_ dữ liệu",
        "loadingRecords": "Đang tải...",
        "paginate": {
            "first": "Đầu tiên",
            "last": "Cuối cùng",
            "next": "Sau",
            "previous": "Trước"
        },
        "search": "Tìm kiếm:",
        "zeroRecords": "Không tìm thấy kết quả"
    }
})