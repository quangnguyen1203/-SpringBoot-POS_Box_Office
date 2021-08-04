
class App {
    static showDeleteConfirmDialog() {
        return Swal.fire({
            icon: 'warning',
            text: 'Bạn có muốn xóa dữ liệu đã chọn không ?',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Có, tôi muốn xóa!',
            cancelButtonText: 'Không',
        })
    }

    static showRestoreConfirmDialog() {
        return Swal.fire({
            icon: 'warning',
            text: 'Bạn có muốn khôi phục dữ liệu đã chọn không ?',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Có, tôi muốn khôi phục!',
            cancelButtonText: 'Không',
        })
    }

    static showSuccessAlert(t) {
        Swal.fire({
            icon: 'success',
            title: t,
            position: 'top-end',
            showConfirmButton: false,
            timer: 1500
        })
    }

    static showErrorAlert(t) {
        Swal.fire({
            icon: 'error',
            title: 'Cảnh báo',
            text: t,
        })
    }

    static getUser(){
        $.ajax({
            type:"GET",
            url: "/user/getUser"
        }).done(function (user){
            $("#user").html(`${user.username}`);
        })
    }

    static getTime(){
        let time = new Date();
        let hh = time.getHours();
        let mm = time.getMinutes();
        let ss = time.getSeconds();
        return `${hh}:${mm}:${ss}`;
    }

    static getToday(){
            let today = new Date();
            let dd = String(today.getDate()).padStart(2, '0');
            let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            let yyyy = today.getFullYear();
            return `${yyyy}-${mm}-${dd}`;
    }
}
