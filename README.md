# posfin_test

Aplikasi Flutter ini menggunakan GetX untuk state management dan Dio untuk permintaan HTTP. Aplikasi ini memungkinkan Anda untuk mengelola daftar buku, termasuk mengambil, menambahkan, memperbarui, dan menghapus buku. Backend dapat dialihkan antara Golang dan Node.js.


## Struktur Folder untuk tanpa api
lib/
|-- controllers/
|   |-- book_controller.dart
|-- models/
|   |-- book.dart
|-- services/
|   |-- book_services.dart
|-- views/
|   |-- book_add_view.dart
|   |-- book_edit_view.dart
|   |-- book_list_view.dart
main.dart

## Struktur Folder untuk dengan api Node.js
lib/
|-- controllers/
|   |-- book_controller2.dart
|-- models/
|   |-- book.dart
|-- services/
|   |-- book_service.dart
|-- views/
|   |-- WithApi
|   |-- |-- book_edit_view.dart
|   |-- |-- book_add_view.dart
|   |-- |-- book_list_view.dart
main.dart

## Struktur Folder untuk dengan api golang
lib/
|-- controllers/
|   |-- backup_controller.dart
|-- models/
|   |-- book.dart
|-- services/
|   |-- backup_service.dart
|-- views/
|   |-- WithGolang
|   |-- |-- book_edit_view.dart
|   |-- |-- book_add_view.dart
|   |-- |-- book_list_view.dart
main.dart


## Penginstalan

- Pastikan sudah mengclone github
- gunakan flutter pub get untuk menginstal dependencies yang ada, adapun dependencies yang dipakai Dio ,GetX dan cuppertino_icons
- setelah dijalankan pastikan menjalankan backend terlebih dahulu dikarenakan menggunakna local host dan karena menggunakan local host dapat dipilih  salah satu antara golang atau node.js sebagai backendnya 
untuk golang dapat diclone sesuai dari backend teman saya valen, dan node.js dapat clone backendnya di https://github.com/christyuda/backend-nodejs, dan jika tanpa api pilih dimainnya itu boo_list_view.dart yang berada setelah folder view. begitu juga untuk golang dan node.js untuk node js itu pilih yang withApi
- setelah jalankan go run . atau misalnya node index.js
silahkan jalankan flutter dengan cara flutter run atau bisa tekan tombol disebelah pojok kanan atas 
