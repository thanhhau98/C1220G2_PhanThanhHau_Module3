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


-- 1.	Th??m m???i th??ng tin cho t???t c??? c??c b???ng c?? trong CSDL ????? c?? th??? th??a m??n c??c y??u c???u b??n d?????i. 
insert into Vitri(TenViTri)
value
('L??? T??n'),
('Ph???c V???'),
('Chuy??n Vi??n'),
('Gi??m S??t'),
('Qu???n L??'),
('Gi??m ?????c');

insert into TrinhDo(TrinhDo)
value
('Trung C???p'),
('Cao ?????ng'),
('?????i H???c'),
('Sau ?????i H???c');

insert into BoPhan(TenBoPhan)
value
('Sale-Marketing'),
('H??nh Ch??nh'),
('Ph???c V???'),
('Qu???n L??');

insert into LoaiKhach(TenLoaiKhach)
value
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into KieuThue(TenKieuThue)
value
('N??m'),
('Th??ng'),
('Ng??y'),
('Gi???');

insert into LoaiDichVu(TenLoaiDichVu)
value
('Villa'),
('House'),
('Room');

insert into DichvuDikem(TenDichVuDikem,Gia,Donvi,TrangThaiKhaDung)
value
('massage',500,000,'c??'),
('karaoke',200,000,'c??'),
('Th???c ??n',100,000,'c??'),
('N?????c U???ng',50,000,'c??'),
('Thu?? Xe',300,000,'c??');

insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Sang',1,2,3,'1998-10-18',123456879,8000000,12312312,'123@gmail.com','???? N???ng'),
('Dong',2,2,2,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Qu???ng Tr???'),
('Kien',3,3,3,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','H?? N???i'),
('Thang',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Qu???ng Nam');


insert into KhachHang(IDLoaiKhach,HoVaTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
value 
(1,'Kien','1998-10-18',123123123,123123123,'cong@gmail.com','???? N???ng'),
(2,'Nhan','1998-10-18',123123123,123123123,'cong@gmail.com','Qu???ng Nam'),
(3,'Cuong','1998-10-18',123123123,123123123,'cong@gmail.com','Qu???ng Tr???'),
(4,'Cong','1998-10-18',123123123,123123123,'cong@gmail.com','Qu???ng Tr???'),
(1,'Cong','1998-10-18',123123123,123123123,'cong@gmail.com','Qu???ng Tr???');

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

-- 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.

select *
from NhanVien
where (HoVaTen like '%T%'
or HoVaTen like '%K%' 
or HoVaTen like '%H%')
and length(HoVaTen) <= 15 ;
insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thangasdassdasdasdasdasda',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Qu???ng Nam');

insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thai Thi Thang Sang',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Qu???ng Nam');

-- 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.

select *
from khachhang
where (DiaChi = '???? N???ng'
or  DiaChi = 'Qu???ng Tr???')
and (timestampdiff(year,NgaySinh,curdate()) between 18 and 50) ;

-- 4.	??  ???m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.

select KhachHang.IDKhachHang, KhachHang.HoVaTen, LoaiKhach.TenLoaiKhach, count(*) as SoLanDatPhong 
from 
KhachHang inner join LoaiKhach on KhachHang.IDLoaiKhach = LoaiKhach.IDLoaiKhach 
			left join HopDong on khachhang.IDKhachHang = hopdong.IDKhachHang	
            where LoaiKhach.TenLoaiKhach = 'Diamond'
group by IDKhachHang
order by SoLanDatPhong ;



-- 5.	Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau: ChiPhiThue + SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng. (Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).
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
                

-- 6.	Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? ch??a t???ng ???????c Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3).

select DichVu.IDDichVu,DichVu.TenDichVu,DichVu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu
from dichvu 
			inner join hopdong on hopdong.IDDichVu = dichvu.IDDichVu
            inner join loaidichvu on loaidichvu.IDLoaiDichVu= dichvu.IDLoaiDichVu
            where hopdong.NgayLamHopDong  > '2019-03-31';

-- 7.	Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i d???ch v??? ???? t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2018 nh??ng ch??a t???ng ???????c Kh??ch h??ng ?????t ph??ng  trong n??m 2019.
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

-- 8.	Hi???n th??? th??ng tin HoTenKhachHang c?? trong h??? th???ng, v???i y??u c???u HoThenKhachHang kh??ng tr??ng nhau.H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n

-- C??ch 1
select *
from khachhang 
group by HoVaTen;

-- C??ch 2
select * 
from khachhang
where HoVaTen in (
			 select distinct HoVaTen
             from khachhang
             );

-- 9.	Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2019 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.

select dichvu.TenDichVu, count(*) as SoLanDat , month(hopdong.NgayLamHopDong)'ThangDat'
from dichvu 
			inner join hopdong on dichvu.IDDichVu = hopdong.IDDichVu
            where year(hopdong.NgayLamHopDong) =2019
group by TenDichVu;

-- 10.	Hi???n th??? th??ng tin t????ng ???ng v???i t???ng H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m. K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (???????c t??nh d???a tr??n vi???c count c??c IDHopDongChiTiet).

select hopdong.IDHopDong,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,hopdong.TienDatCoc,count(IDHopDongChiTiet) as SoLuongDichVuDiKem
from hopdong
			inner join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
group by IDHopDong;

-- 11.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng Kh??ch h??ng c?? TenLoaiKhachHang l?? ???Diamond??? v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???.
select dichvudikem.IDDichVuDiKem,dichvudikem.TenDichVuDiKem,khachhang.IDKhachHang,dichvudikem.Gia,dichvudikem.DonVi,dichvudikem.TrangThaiKhaDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDdichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
                inner join khachhang on khachhang .IDKhachHang= hopdong.IDKhachHang
                inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
where loaikhach.TenLoaiKhach = 'Diamond' and khachhang.DiaChi in ('Vinh','Qu???ng Ng??i')
group by TenDichVuDiKem
order by IDdichVuDiKem asc;
-- 12.	Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (???????c t??nh d???a tr??n t???ng H???p ?????ng chi ti???t), TienDatCoc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 th??ng cu???i n??m 2019 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2019.
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
            
            

-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).

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
-- 14.	Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. Th??ng tin hi???n th??? bao g???m IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

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

-- 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2018 ?????n 2019.

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

-- 16.	X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2019.

SET FOREIGN_KEY_CHECKS=0; 
delete 
from nhanvien 
where IDNhanVien not in (
select IDNhanVien
from hopdong
where year(hopdong.NgayLamHopDong ) between 2017 and 2019
) ;
SET FOREIGN_KEY_CHECKS=1;


-- 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? TenLoaiKhachHang t???  Platinium l??n Diamond, ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i t???ng Ti???n thanh to??n trong n??m 2019 l?? l???n h??n 10.000.000 VN??.

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



-- 18.	X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2016 (ch?? ?? r??ngbu???c gi???a c??c b???ng).

-- 19.	C???p nh???t gi?? cho c??c D???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2019 l??n g???p ????i.

-- 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c Nh??n vi??n v?? Kh??ch h??ng c?? trong h??? th???ng, th??ng tin hi???n th??? bao g???m ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.




