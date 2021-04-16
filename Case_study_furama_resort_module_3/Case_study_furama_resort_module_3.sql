drop database if exists case_study;

create database case_study;
use case_study;




create table ViTri (
IDViTri int(10) primary key auto_increment,
TenViTri varchar(45)
);


create table TrinhDo (
IDTrinhDo int(10) primary key auto_increment,
TrinhDo varchar(45)
);



create table BoPhan (
IDBoPhan int(10) primary key auto_increment,
TenBoPhan varchar(45)
);



create  table LoaiKhach (
IDLoaiKhach int (10) primary key auto_increment,
TenLoaiKhach varchar(45)
);


create table KieuThue (
IDKieuThue int(10) primary key auto_increment,
TenKieuThue varchar(45)
);


create table LoaiDichVu (
IDLoaiDichVu int(10) primary key auto_increment,
TenLoaiDichVu varchar(45)
);


create table DichVuDiKem (
IDdichVuDiKem int(10) primary key auto_increment,
TenDichVuDiKem varchar(45),
Gia int(10),
DonVi int(10),
TrangThaiKhaDung varchar(45)
);




create table NhanVien (
IDNhanVien int(10) primary key auto_increment,
HoVaTen varchar(45),
IDViTri int(10),
foreign key(IDViTri) references ViTri(IDViTri) on delete cascade,
IDTrinhDo int(10),
foreign key(IDTrinhDo) references TrinhDo(IDTrinhDo) on delete cascade,
IDBoPhan int(10) ,
foreign key(IDBoPhan) references BoPhan(IDBoPhan) on delete cascade,
NgaySinh date,
SoCMND int (10),
Luong int (10),
SDT int (10),
Email varchar(45),
DiaChi varchar(45)
);


create table KhachHang (
IDKhachHang int(10) primary key auto_increment,
IDLoaiKhach int(10),
foreign key(IDLoaiKhach) references Loaikhach(IDLoaiKhach) on delete cascade,
HoVaTen varchar(45),
NgaySinh date,
SoCMND int (10),
SDT int (10),
Email varchar(45),
DiaChi varchar(45)
);


create table DichVu (
IDDichVu int(10) primary key auto_increment,
TenDichVu varchar(45),
DienTich int(10),
SoTang int(10),
SoNguoitoida int(10),
ChiPhithue int(10),
IDKieuThue int(10),
foreign key(IDKieuThue) references KieuThue(IDKieuThue) on delete cascade ,
IDLoaiDichVu int(10),
foreign key(IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu) on delete cascade,
TrangThai varchar(45)
);



create table HopDong (
IDHopDong int(10) primary key auto_increment,
IDNhanVien int(10),
foreign key(IDNhanVien) references NhanVien(IDNhanVien) on delete cascade,
IDKhachHang int(10),
foreign key(IDKhachHang) references KhachHang(IDKhachHang)on delete cascade ,
IDDichVu int(10),
foreign key(IDDichVu) references DichVu(IDDichVu)on delete cascade,
NgayLamHopDong date,
NgayKetThuc date,
TienDatCoc int(10),
TongTien int(10)
);


create table HopDongChiTiet (
IDHopDongChiTiet int(10) primary key auto_increment,
IDHopDong int(10),
foreign key(IDHopDong) references HopDong(IDHopDong)on delete cascade,
IDDichVuDiKem int(10),
foreign key(IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem) on delete cascade,
SoLuong int(10)
);


-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới. 
insert into Vitri(TenViTri)
value
('Lễ Tân'),
('Phục Vụ'),
('Chuyên Viên'),
('Giám Sát'),
('Quản Lý'),
('Giám Đốc');

insert into TrinhDo(TrinhDo)
value
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

insert into BoPhan(TenBoPhan)
value
('Sale-Marketing'),
('Hành Chính'),
('Phục Vụ'),
('Quản Lý');

insert into LoaiKhach(TenLoaiKhach)
value
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into KieuThue(TenKieuThue)
value
('Năm'),
('Tháng'),
('Ngày'),
('Giờ');

insert into LoaiDichVu(TenLoaiDichVu)
value
('Villa'),
('House'),
('Room');

insert into DichvuDikem(TenDichVuDikem,Gia,Donvi,TrangThaiKhaDung)
value
('massage',500,000,'có'),
('karaoke',200,000,'có'),
('Thức Ăn',100,000,'có'),
('Nước Uống',50,000,'có'),
('Thuê Xe',300,000,'có');

insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Sang',1,2,3,'1998-10-18',123456879,8000000,12312312,'123@gmail.com','Đà Nẵng'),
('Dong',2,2,2,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Quảng Trị'),
('Kien',3,3,3,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Hà Nội'),
('Thang',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Quảng Nam');


insert into KhachHang(IDLoaiKhach,HoVaTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
value 
(1,'Kien','1998-10-18',123123123,123123123,'cong@gmail.com','Đà Nẵng'),
(2,'Nhan','1998-10-18',123123123,123123123,'cong@gmail.com','Quảng Nam'),
(3,'Cuong','1998-10-18',123123123,123123123,'cong@gmail.com','Quảng Trị'),
(4,'Cong','1998-10-18',123123123,123123123,'cong@gmail.com','Quảng Trị'),
(1,'Cong','1998-10-18',123123123,123123123,'cong@gmail.com','Quảng Trị');

insert into DichVu(TenDichVu,DienTich,SoTang,SoNguoitoida,ChiPhithue,IDKieuThue,IDLoaiDichVu,TrangThai)
value
('villa',12321,12,2,2,1,1,'new'),
('villa',12321,12,2,2,2,2,'new'),
('villa',12321,12,2,2,1,2,'new'),
('villa',12321,12,2,2,2,1,'new');

insert into HopDong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien)
value
(1,1,1,'2020-12-11','2020-12-18',12121212,1231231231),
(1,2,3,'2020-12-11','2020-12-18',12121212,1231231231),
(2,1,3,'2020-12-11','2020-12-18',12121212,1231231231),
(3,3,3,'2020-12-11','2020-12-18',12121212,1231231231);

insert into HopDongChiTiet(IDHopDong,IDDichVuDiKem,SoLuong)
value
(1,1,2),
(2,2,3),
(1,2,4);

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

select *
from NhanVien
where (HoVaTen like '%T%'
or HoVaTen like '%K%' 
or HoVaTen like '%H%')
and length(HoVaTen) <= 15 ;
insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thangasdassdasdasdasdasda',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Quảng Nam');

insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thai Thi Thang Sang',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Quảng Nam');

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from khachhang
where (DiaChi = 'Đà Nẵng'
or  DiaChi = 'Quảng Trị')
and (timestampdiff(year,NgaySinh,curdate()) between 18 and 50) ;

-- 4.	Đ  ếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select KhachHang.IDKhachHang, KhachHang.HoVaTen, LoaiKhach.TenLoaiKhach, count(*) as SoLanDatPhong 
from 
KhachHang inner join LoaiKhach on KhachHang.IDLoaiKhach = LoaiKhach.IDLoaiKhach 
			left join HopDong on khachhang.IDKhachHang = hopdong.IDKhachHang	
            where LoaiKhach.TenLoaiKhach = 'Diamond'
group by IDKhachHang
order by SoLanDatPhong ;



-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
insert into HopDongChiTiet(IDHopDong,IDDichVuDiKem,SoLuong)
value
(4,4,2),
(4,2,3),
(3,3,4);
insert into HopDong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien)
value
(1,1,4,'2020-12-11','2020-12-18',12121212,1231231231),
(1,2,3,'2020-12-11','2020-12-18',12121212,1231231231),
(2,1,3,'2020-12-11','2020-12-18',12121212,1231231231),
(3,1,3,'2020-12-11','2020-12-18',12121212,1231231231);

select khachhang.IDKhachHang, khachhang.HoVaTen, loaikhach.TenLoaiKhach,hopdong.IDHopDong,dichvu.TenDichVu,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,sum(hopdong.TongTien-hopdong.TienDatCoc+dichvudikem.Gia*hopdongchitiet.SoLuong) as Tongtien
from khachhang
			left join hopdong on khachhang.IDKhachHang=hopdong.IDKhachHang
			left join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
			left join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
			left join dichvudikem on hopdongchitiet.IDDichVuDiKem=dichvudikem.IDDichVuDiKem
			left join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
group by IDKhachHang;
                

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select DichVu.IDDichVu,DichVu.TenDichVu,DichVu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu
from dichvu 
			inner join hopdong on hopdong.IDDichVu = dichvu.IDDichVu
            inner join loaidichvu on loaidichvu.IDLoaiDichVu= dichvu.IDLoaiDichVu
            where hopdong.NgayLamHopDong  > '2019-03-31';

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select dichvu.IDDichVu,dichvu.TenDichVu,dichvu.DienTich,dichvu.ChiPhithue,loaidichvu.TenLoaiDichVu
from dichvu
			left join loaidichvu on dichvu.IDLoaiDichVu=loaidichvu.IDLoaiDichVu
            left join hopdong on hopdong.IDDichVu = dichvu.IDDichVu
where dichvu.IDDichVu in (
					select distinct IDDichVu 
                    from hopdong 
                    where year(NgayLamHopDong) = 2018
                    )
and dichvu.IDDichVu not in (
					select distinct IDDichVu 
                    from hopdong 
                    where year(NgayLamHopDong) =2019
                    )
group by IDDichVu;

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

-- Cách 1
select *
from khachhang 
group by HoVaTen;

-- Cách 2
select * 
from khachhang
where HoVaTen in (
			 select distinct HoVaTen
             from khachhang
             );

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select dichvu.TenDichVu, count(*) as SoLanDat , month(hopdong.NgayLamHopDong)'ThangDat'
from dichvu 
			inner join hopdong on dichvu.IDDichVu = hopdong.IDDichVu
            where year(hopdong.NgayLamHopDong) =2019
group by TenDichVu;

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

select hopdong.IDHopDong,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,hopdong.TienDatCoc,count(IDHopDongChiTiet) as SoLuongDichVuDiKem
from hopdong
			inner join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
group by IDHopDong;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select dichvudikem.IDDichVuDiKem,dichvudikem.TenDichVuDiKem,khachhang.IDKhachHang,dichvudikem.Gia,dichvudikem.DonVi,dichvudikem.TrangThaiKhaDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDdichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
                inner join khachhang on khachhang .IDKhachHang= hopdong.IDKhachHang
                inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
where loaikhach.TenLoaiKhach = 'Diamond' and khachhang.DiaChi in ('Vinh','Quảng Ngãi')
group by TenDichVuDiKem
order by IDdichVuDiKem asc;
-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
select hopdong.IDHopDong,nhanvien.HoVaTen,khachhang.HoVaTen,khachhang.SDT,dichvu.TenDichVu,count(hopdongchitiet.IDHopDongChiTiet) as SoLuongdichVuDiKem,hopdong.TienDatCoc
from hopdong
			left join khachhang on hopdong.IDKhachHang = khachhang.IDKhachHang
			left join nhanvien on nhanvien.IDNhanVien = hopdong.IDNhanVien
			left join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
			left join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
where hopdong.IDDichVu in (
					select distinct IDDichVu 
                    from hopdong 
                    where NgayLamHopDong between '2019-10-01' and '2019-12-31'
                    )
and hopdong.IDDichVu not in (
					select distinct IDDichVu 
                    from hopdong 
                    where NgayLamHopDong between '2019-01-01' and '2019-06-30'
                    )	
group by IDHopDong;
            
            

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

create view so_lan_sd_dvdk as 
select dichvudikem.IDdichVuDiKem,dichvudikem.TenDichVuDiKem,dichvudikem.Gia,dichvudikem.DonVi,dichvudikem.TrangThaiKhaDung,sum(hopdongchitiet.SoLuong) as SoLanSuDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
group by IDdichVuDiKem;

set @max_use = (select
	max(SoLanSuDung)
	from so_lan_sd_dvdk);
    
select IDdichVuDiKem,TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung
from so_lan_sd_dvdk 
where SoLanSuDung = @max_use;
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

create view so_lan_su_dung_dvdk as 
select hopdong.IDHopDong, loaidichvu.TenLoaiDichVu, dichvudikem.TenDichVuDiKem,sum(hopdongchitiet.SoLuong) as SoLanSuDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDdichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
                inner join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
                inner join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
group by TenDichVuDiKem;

select *
from so_lan_su_dung_dvdk;

select IDHopDong,TenLoaiDichVu,TenDichVuDiKem,SoLanSuDung
from so_lan_su_dung_dvdk
where SoLanSuDung = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

drop view so_lan_ky_hop_dong;

create view so_lan_ky_hop_dong as
select nhanvien.IDNhanVien, nhanvien.HoVaTen, trinhdo.TrinhDo, bophan.TenBoPhan, nhanvien.SDT, nhanvien.DiaChi,count(hopdong.IDNhanVien)as SoHopDong
from nhanvien
			inner join hopdong on hopdong.IDNhanVien = nhanvien.IDNhanVien
			inner join trinhdo on trinhdo.IDTrinhDo = nhanvien.IDTrinhDo
			inner join bophan on bophan.IDBoPhan = nhanvien.IDBoPhan
where year(hopdong.NgayLamHopDong) between 2018 and 2019
group by IDNhanVien;

select * 
from so_lan_ky_hop_dong;

select IDNhanVien,HoVaTen,TrinhDo,TenBoPhan,SDT,DiaChi
from so_lan_ky_hop_dong
where SoHopDong <=3 ;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.

SET FOREIGN_KEY_CHECKS=0; 
delete 
from nhanvien 
where IDNhanVien not in (
select IDNhanVien
from hopdong
where year(hopdong.NgayLamHopDong ) between 2017 and 2019
) ;
SET FOREIGN_KEY_CHECKS=1;


-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.

update loaikhach
set TenLoaiKhach = 'Diamond'
where IDLoaiKhach not in(
select IDLoaiKhach
from khachhang 
where IDKhachHang not in (
select hopdong.IDKhachHang, sum(hopdong.TongTien) as TongSoTien
from hopdong 
where TongSoTien > 10000000 ) 
)
and
(select IDLoaiKhach
from loaikhach
where TenLoaiKhach = 'Platinium' 
);



-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.




