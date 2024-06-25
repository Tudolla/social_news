<<<<<<< HEAD

# app
=======

- Model của App hiện tại gồm : User , Community 
- UI : đăng nhập, màn hình chính, drawer UI , profile UI, community UI
- Chức năng đã hoàn thiện : đăng nhập, tìm kiếm
>>>>>>> 4b85623a11ea47002cd282f95a16f02e1cbf7cdc
luu y : thu muc image can them '\\' trong Windows
!!! Nút Signin không thiết kế trong LoginUI mà nó đặt riêng ở common folder => tái sử dụng trong mục đích sau này 

FIREBASE SETTUP : 
Tải npm , firebase tool , 
vào terminal : firebase login 
~~~~ flutterfire configure : can reopen lai VScode thi moi add FirebaseFire vao trong project 

Tôi dành 1 buổi chiều - tối để fix lỗi : Exception ( do sau khi làm UI Login, tôi thêm các thư viện vào - mà nó bị CONFIG )
,kết quả là do tôi chưa cập nhật lên SDK mới nhất để tương thích
với các thư viện như firebase_auth , firebase_store , ... . Tôi đã rất nản và muốn bỏ cuộc , nhưng sự cố gắng mới bắt đầu
Tiếp tục phần sau ...
Lay thong tin nguoi dung - duy tri trong main.dart de duy tri State nguoi dung refresh man hinh sau khi Login  
~~~~ Phan UserModel can xem lai , co nen set karma = 0 hay ko? và phần fromMap cần xem lại 


30-10-2023, mình lại gặp cái Bug ngu người ko thể chịu được , Bug này mình đã phạm phải hồi học Android, 
chả là mình xóa Android Studio đi, và trong IDE này có chứa SDK quan trọng liên kết với Vscode để lập trình Flutter
và khi mình tải lại Android Studio, thì nó sẽ tự động thêm folder mới và bản cũ nó vẫn còn lưu trong máy tính 
kết quả là mất 1 ngày fix với bao nhiêu sự tuyệt vọng lẫn hi vọng và năng lượng để não suy nghĩ mình cần lựa chọn cách giải
quyết thế nào là tốt nhất . Tốt lắm ... tiếp tục thôi

!!! Timf hieu them Stream Provider , RiverPod , ConsumerWidget 
!!! Tai phan Show Community , tim hieu Stream , Map<String, dynamic> , ref.watch , read
~~~~ Can't use ref in repository 
~~~~ check user have joined in community
~~~~ Bao ve du lieu nguoi dung (Firebase) nhu the nao?
~~~~ type Future la gi? setState(image) la gi?
~~~~ type reference la gi?
~~~~ statenotifier la gi?
~~~~ uuid lib la gi?
