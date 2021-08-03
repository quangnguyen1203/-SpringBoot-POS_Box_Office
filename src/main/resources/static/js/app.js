
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
}
