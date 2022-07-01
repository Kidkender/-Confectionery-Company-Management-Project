d
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------   -------   ------            ------   ------------------   --------------                  ---------------------------------------
----------------   -------   ------            ------   ------------------   --------------   ------------   ---------------------------------------
----------------   -------   ------   ---------------   ------------------   --------------   ------------   ---------------------------------------
----------------   -------   ------   ---------------   ------------------   --------------   ------------   ---------------------------------------
----------------   _______   ------   ---------------   ------------------   --------------   ------------   ---------------------------------------
----------------             ------            ------   ------------------   --------------   ------------   ---------------------------------------
----------------   -------   ------   ---------------   ------------------   --------------   ------------   ---------------------------------------
----------------   -------   ------   ---------------  -------------------  ---------------   ------------   ---------------------------------------
----------------   -------   ------   ---------------   ------------------   --------------   ------------   ---------------------------------------
----------------   -------   ------            ------               ------            -----                  ---------------------------------------
----------------   -------   ------            ------               ------            --------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------\\\--------------///--------------------------------------------------------------------------------------------------
-----------------\\\    ----    ///------------------------------------------------------------------------------------------------------------
----------------- \\\          ///    -----------------------------------------------------------------------------------------------------------    -
---------------    \\\________///      --------------------------------------------------------------------------------------------------
---------------     \\ _______//      ---------------------------------------------------------------------------------------------------------------
-----------------                   ---------  -----------------------------------------------------------------------------------
-------------------               ------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------   ------------  -------------------------------------------------------------------------------------------------------------------------------
--Nguyễn Hữu Đức----------------------------------------------------------------------------------------------------------------------------------------------------
-------2001190484---------------------------------------------------------------------------------------------------------------------------------------------------------
---CSDL--CHIỀU THỨ 5---GVDHD:------------------------------------------------------------------------------------------------------------------------------------------
--Phần Phụ Lục----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------Line---
--Tạo database ,tạo table,tạo khóa chính khóa phụ...................36-----200
--Nhập liệu cho các table...........................................204----445
--Phần truy vấn dữ liệu.............................................453----745
--Tạo bảng ảo.......................................................785----827
--Khai báo và sử dụng biến & Cấu trúc điều khiển....................828----987
--Thủ tục thường trú (Stored Procedure).............................1004----1390
--Hàm do người dùng định nghĩa(function)............................1398----1616
--Ràng buộc toàn vẹn Trigger........................................1623----1812
--Biến con trỏ Cursor...............................................1819----2130
--Phần dữ liệu của Client Java......................................2131----2182
--Sao lưu phục hồi(backup & restore)................................2185----2235
--Quản lý quyền trên CSDL...........................................2241----2355
CREATE DATABASE QL_CTSXBanhkeo_Duc
on primary
(
	name='Filemain',
	filename='C:\file_mdf_ldf\main.mdf',
	size=15MB,
	maxsize=100mb,
	filegrowth=10%
),
filegroup nhom1
(
	name='File_ndf_n1',
	filename='C:\file_mdf_ldf\ndf1.ndf',
	size=15MB,
	maxsize=100mb,
	filegrowth=15%
),
(
	name='File_ndf2_n1',
	filename='C:\file_mdf_ldf\ndf2_n1.ndf',
	size=15MB,
	maxsize=100mb,
	filegrowth=15%
),
filegroup nhom2
(
	name='File_ndf1_n2',
	filename='C:\file_mdf_ldf\ndf1_n2.ndf',
	size=15MB,
	maxsize=100mb,
	filegrowth=15%
)
log on
(
	name='Fileldf',
	filename='C:\file_mdf_ldf\fileldf.ldf',
	size=15MB,
	maxsize=100mb,
	filegrowth=15%
)
USE QL_CTSXBanhkeo_Duc
GO
CREATE TABLE LOAISANPHAM --1
(
	MALOAISP CHAR(5) NOT NULL,
	TENLOAISP NCHAR(15),
)
ALTER TABLE LOAISANPHAM
ADD CONSTRAINT PK_MALOAISP PRIMARY KEY(MALOAISP)

CREATE TABLE CHITIETSANPHAM--4
(
	MALOAISP CHAR(5) NOT NULL,
	TENSP NVARCHAR(20),
	HANSUDUNG INT,
	MANL CHAR(4) NOT NULL,
	DVT NCHAR(5),
	NGAYSX DATE,
)
ALTER TABLE CHITIETSANPHAM
ADD CONSTRAINT FK_MALOAISP_CTSP FOREIGN KEY (MALOAISP) REFERENCES LOAISANPHAM(MALOAISP)
ALTER TABLE CHITIETSANPHAM
ADD CONSTRAINT FK_MANL_CTSP FOREIGN KEY (MANL) REFERENCES NGUYENLIEU(MANL)
ALTER TABLE CHITIETSANPHAM
ADD CONSTRAINT PK_CTSP PRIMARY KEY (MALOAISP,MANL)
CREATE TABLE NGUYENLIEU--3
(
	MANL CHAR(4) NOT NULL,
	TENNGUYENLIEU NCHAR(16),
	NhietdoBaoQuan int,
	Dangnguyenlieu nchar(10)
)
ALTER TABLE NGUYENLIEU
ADD CONSTRAINT PK_MANL PRIMARY KEY (MANL)
alter table nguyenlieu
alter column nhietdobaoquan float
CREATE TABLE NHACUNGCAPNL--2
(
	MANCC CHAR(6) NOT NULL,
	TENNHACC VARCHAR(25),
	DIACHINCC CHAR(40),
	QUOCGIA NCHAR(20),
)
ALTER TABLE NHACUNGCAPNL
ADD CONSTRAINT PK_MANCC PRIMARY KEY(MANCC)
CREATE TABLE PHIEUNHAP--5
(
	MAPN CHAR(5) NOT NULL,
	NGAYNHAP DATE,
	TONGTIEN MONEY,
	MANCC CHAR(6) NOT NULL,
)
ALTER TABLE PHIEUNHAP
ADD CONSTRAINT PK_MAPN PRIMARY KEY (MAPN)
ALTER TABLE PHIEUNHAP
ADD CONSTRAINT FK_MANCC_PN FOREIGN KEY (MANCC) REFERENCES NHACUNGCAPNL(MANCC)
CREATE TABLE CHITIETPN--6
(
	MAPN CHAR(5) NOT NULL,
	MANL CHAR(4) NOT NULL,
	SOLUONG INT,
	DONGIA MONEY,
)
ALTER TABLE CHITIETPN
ADD CONSTRAINT FK_MAPN_CTPN FOREIGN KEY(MAPN) REFERENCES PHIEUNHAP(MAPN)
ALTER TABLE CHITIETPN
ADD CONSTRAINT FK_MANL_CTPN FOREIGN KEY(MANL) REFERENCES NGUYENLIEU(MANL)
ALTER TABLE CHITIETPN
ADD CONSTRAINT PK__CTPN PRIMARY KEY (MAPN,MANL)
CREATE TABLE NHANVIEN--8
(
	MANV CHAR(5) NOT NULL,
	TENNV CHAR(25),
	DIACHI VARCHAR(50),
	DIENTNV INT,
	LUONGNV  MONEY,
	MAPH CHAR (6) NOT NULL,
	
)
ALTER TABLE NHANVIEN
ADD CONSTRAINT PK_MANV PRIMARY KEY(MANV)
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_PB_NV FOREIGN KEY (MAPH) REFERENCES PHONGBAN(MAPH)
Alter table Nhanvien
add Ngaysinh date
CREATE TABLE PHONGBAN--7
(
	MAPH CHAR(6) NOT NULL, 
	TENPH NCHAR(35),
	TRUONGPHONG CHAR(5)
)
--ALTER TABLE PHONGBAN
--ADD CONSTRAINT FK_TP FOREIGN KEY (TRUONGPHONG) REFERENCES NHANVIEN(MANV)
--ALTER TABLE PHONGBAN
--ALTER COLUMN TENPH NCHAR(35)
ALTER TABLE PHONGBAN
ADD CONSTRAINT PK_PB PRIMARY KEY(MAPH)
alter table phongban
add siso int
CREATE TABLE PHANCONG--9
(
	MANV CHAR(5) NOT NULL,
	MALOAISP CHAR(5) NOT NULL,
	COSOLAMVIEC CHAR(20)
	
)
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_MANV_PC FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_MALOAISP_PC FOREIGN KEY (MALOAISP) REFERENCES LOAISANPHAM(MALOAISP)
ALTER TABLE PHANCONG
ADD CONSTRAINT PK_MANV_MALOAISP PRIMARY KEY(MANV,MALOAISP)
CREATE TABLE LICHLAMVIEC--10
(
	MANV CHAR(5) NOT NULL,
	calam int NOT NULL,
	NGAYLAM DATE NOT NULL,
)
DROP TABLE LICHLAMVIEC
--alter table lichlamviec
--alter column calam char(2) not nul
ALTER TABLE LICHLAMVIEC 
ADD CONSTRAINT PK_LLV PRIMARY KEY(MANV,CALAM,NGAYLAM)
ALTER TABLE LICHLAMVIEC
ADD CONSTRAINT FK_LLV_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
GO
select * from nguyenlieu
go
INSERT INTO LOAISANPHAM
VALUES
('MUT',N'Mứt' ),
('BANH',N'Bánh' ),
('KEO',N'Kẹo' ),
('KM' ,N'Kem'),
('SR',N'Si rô')
set dateformat dmy
INSERT INTO CHITIETSANPHAM
VALUES
('MUT',N'Mứt dừa','180','NL20' ,N'Hộp','01/01/2021'),
('MUT',N'Mứt nho','190','NL02' ,N'Hộp','02/01/2021'),
('MUT',N'Mứt táo','200','NL12',N'Hộp','03/01/2021'),
('MUT',N'Mứt Bửi','180','NL03',N'Hộp','04/01/2021'),
('BANH',N'Bánh gạo','90','NL13' ,N'Bịch','05/01/2021'),
('BANH',N'Bánh sô cu la','90','NL15',N'Bịch','06/01/2021'),
('BANH',N'Bánh kẹp trứng','14','NL11',N'Lát','07/01/2021'),
('BANH',N'Bánh cam','35','NL18' ,N'Cái','08/01/2021'),
('KEO',N'Kẹo lá dứa','90','NL16',N'viên','22/02/2020'),
('KEO',N'Kẹo nho','80','NL02',N'viên','25/04/2021'),
('KEO',N'Kẹo sô cu la','100','NL15',N'Hộp','28/03/2021'),
('KEO',N'Kẹo nho sữa táo','100','NL12' ,N'Bịch','17/02/2021'),
('BANH',N'Bánh bao nhân táo','40','NL12' ,N'Cái','30/04/2021'),
('MUT',N'Mứt cam','140','NL18' ,N'Hộp','03/04/2021'),
('MUT',N'Mứt trân châu','115','NL19',N'Hộp','27/2/2021'),
('BANH',N'Bánh đậu lá dứa','124','NL16',N'Lát','17/03/2021'),
('BANH',N'Bánh xốp vani','35','NL19' ,N'Cái','02/04/2021'),
('SR',N'Si rô dâu','60','NL17' ,N'Chai','15/03/2021'),
('SR',N'Si rô nho','90','NL02' ,N'Chai','19/02/2021'),
('SR',N'Si rô cam','60','NL18' ,N'Chai','18/04/2021'),
('SR',N'Si rô vani','90','NL19' ,N'Chai','05/04/2021'),
('SR',N'Si rô sầu riêng','70','NL10' ,N'Chai','12/04/2021'),
('SR',N'Si rô táo','60', 'NL12',N'Chai','25/04/2021'),
('KEO',N'Kẹo cam bu chê','140','NL01' ,N'viên','23/3/2021')
GO
--INSERT INTO CHITIETSANPHAM
--VALUES

--go
--INSERT INTO CHITIETSANPHAM
--VALUES


INSERT INTO NGUYENLIEU
VALUES
('NL01',N'Cam pu chê','20',N'Rắn'),
('NL02',N'Nho','20',N'Rắn'),
('NL03',N'Bưởi','25',N'Rắn'),
('NL04',N'Dầu ân','30',N'Lỏng'),
('NL05',N'Ô liu','15',N'Lỏng'),
('NL06',N'Mướp','15',N'Rắn'),
('NL07',N'Xoài','20',N'Rắn'),
('NL08',N'Đào','20',N'Rắn'),
('NL09',N'Mận','25',N'Rắn'),
('NL10',N'Sầu riêng','30',N'Rắn'),
('NL11',N'Trứng','15',N'Rắn'),
('NL12',N'Táo','20',N'Rắn'),
('NL13',N'Gạo','28',N'Lỏng'),
('NL14',N'Xí muội','20',N'Rắn'),
('NL15',N'Ca cao','23',N'Rắn'),
('NL16',N'Dứa','20',N'Rắn'),
('NL17',N'Dâu tây','15',N'Lỏng'),
('NL18',N'Cam','20',N'Rắn'),
('NL19',N'Sữa tươi','20',N'Lỏng'),
('NL20',N'Dừa','20',N'Rắn')
go
--INSERT INTO NGUYENLIEU
--VALUES

INSERT INTO NHACUNGCAPNL
VALUES
('NCC01',N'Toyota' ,'Phan Thiet Binh Thuan',N'Korea'),
('NCC02',N'Honda' ,'Quan 1 ,TP HCM',N'Singapore'),
('NCC03',N'Suzuki','Tay Ninh' ,N'Thai Lan'),
('NCC04',N'Kawasaki','Bac Ninh' ,N'Taiwan'),
('NCC05',N'Hayabusa' ,'Tan Binh, TP HCM',N'Japan'),
('NCC06',N'Yasuo' ,'Thanh Xuan, Ha Noi',N'Viet Nam'),
('NCC07',N'Vinfast' ,'Thanh Khe Da Nang',N'France'),
('NCC08',N'Testla' ,'Long Bien,Ha Noi',N'America')

GO
SET DATEFORMAT DMY
INSERT INTO PHIEUNHAP
VALUES
('PN01','3/3/2021',null,'NCC05'),
('PN02','4/3/2021',null,'NCC04'),
('PN03','5/3/2021',null,'NCC03'),
('PN04','26/03/2021',null,'NCC02'),
('PN05','17/03/2021',null,'NCC01'),
('PN06','12/2/2021',null,'NCC03'),
('PN07','26/02/2021',null,'NCC08'),
('PN08','10/3/2021',null,'NCC03'),
('PN09','24/3/2021',null,'NCC07'),
('PN10','17/2/2021',null,'NCC07'),
('PN11','18/2/2021',null,'NCC01'),
('PN12','30/4/2021',null,'NCC06'),
('PN13','24/4/2021',null,'NCC02'),
('PN14','15/4/2021',null,'NCC06'),
('PN15','20/2/2021',null,'NCC04'),
('PN16','25/2/2021',null,'NCC06'),
('PN17','12/2/2021',null,'NCC08')
GO
insert into PHIEUNHAP
values
('PN18','17/3/2021',null,'NCC03')
go
INSERT INTO CHITIETPN
VALUES
('PN01','NL05','10','250000'),
('PN02','NL13','20','225000'),
('PN03','NL08','10','500000'),
('PN04','NL06','40','50000'),
('PN05','NL10','30','50000'),
('PN06','NL11','120','100000'),
('PN07','NL14','10','2500000'),
('PN08','NL15','4','100000'),
('PN09','NL04','15','20000'),
('PN10','NL12','75','72500'),
('PN11','NL18','30','39000'),
('PN12','NL02','24','50000'),
('PN13','NL16','35','250000'),
('PN14','NL19','12','30000'),
('PN15','NL20','150','125000'),
('PN16','NL17','20','125000'),
('PN17','NL09','10','500000')

GO
insert into CHITIETPN
values
('PN18','NL09','30','75000')

INSERT INTO NHANVIEN
VALUES
('NV001','Zlatan Ibrahimovic','England','123456783','800000','PH0001'),
('NV002','Luis Suarez','Germany','123456780','1200000','PH0001'),
('NV003','Diego Maradona','United Kingdome','123456787','500000','PH0004'),
('NV004','Pele','Brazil','123456786','600000','PH0002'),
('NV005','Ronadinho','France','123456785','700000','PH0002'),
('NV006','Zinedine Zindane','Brazil','123456784','900000','PH0005'),
('NV007','Cristano Ronaldo','Bo Dao Nha','123456789','300000','PH0001'),
('NV008','Wayne Rooney','Spain','123456782','1000000','PH0003'),
('NV009','Paul Pogba','Serbia','123456781','1100000','PH0004'),
('NV010','Lionel Messi','Argentina','123456788','400000','PH0003'),
('NV011','David Beckham','Colombia','123456790','1300000','PH0001'),
('NV012','Edinson Cavani','Croatia','123456780','1400000','PH0005'),
('NV013','Roberto Carlos','Nigeria','123456770','150000','PH0006'),
('NV014','Ronaldo de Lima','Spain','123456760','300000','PH0007'),
('NV015','KaKa','Germany','123456750','2300000','PH0001'),
('NV016','Seirgo Ramous','France','123546790','1300000','PH0001'),
('NV017','Paolo Rosi','Croatia','123457680','1400000','PH0005'),
('NV018','Gianluigi Buffon','Nigeria','121456770','1540000','PH0002'),
('NV019','Xavi','Spain','123456360','3000000','PH0001'),
('NV020','Zico','Germany','1231216750','3200000','PH0001')
GO
SET DATEFORMAT DMY
INSERT INTO LICHLAMVIEC
VALUES
('NV001','1','01/05/2021'),
('NV002','2','02/05/2021'),
('NV003','1','03/05/2021'),
('NV004','2','04/05/2021'),
('NV005','2','05/05/2021'),
('NV006','3','06/05/2021'),
('NV007','3','07/05/2021'),
('NV008','2','08/05/2021'),
('NV009','2','09/05/2021'),
('NV010','1','10/05/2021'),
('NV011','2','11/05/2021'),
('NV012','1','12/05/2021'),
('NV013','1','13/05/2021'),
('NV014','2','14/05/2021'),
('NV015','1','15/05/2021'),
('NV016','2','16/05/2021'),
('NV017','2','17/05/2021'),
('NV018','2','18/05/2021'),
('NV019','1','19/05/2021'),
('NV002','3','20/05/2021'),
('NV003','1','21/05/2021'),
('NV004','3','22/05/2021'),
('NV005','1','23/05/2021'),
('NV006','2','24/05/2021'),
('NV007','2','25/05/2021'),
('NV008','1','26/05/2021'),
('NV009','3','27/05/2021'),
('NV010','3','28/05/2021'),
('NV011','1','29/05/2021'),
('NV012','3','30/05/2021'),
('NV013','1','01/05/2021'),
('NV014','2','02/05/2021'),
('NV015','2','03/05/2021'),
('NV001','1','04/05/2021'),
('NV002','2','05/05/2021'),
('NV003','3','06/05/2021'),
('NV004','1','07/06/2021'),
('NV005','1','08/05/2021'),
('NV006','3','09/05/2021'),
('NV007','2','10/05/2021'),
('NV009','1','11/05/2021'),
('NV010','2','12/05/2021'),
('NV011','1','13/05/2021'),
('NV012','2','14/05/2021'),
('NV004','3','15/05/2021'),
('NV005','1','16/05/2021'),
('NV004','2','27/05/2021')
GO
insert into Lichlamviec
values
('NV007','2','05/07/2021')
go
INSERT INTO PHONGBAN
VALUES
('PH0001',N'Phòng quản lý','NV003'),
('PH0002',N'Phòng điều hành','NV007'),
('PH0003',N'Phòng QC','NV012'),
('PH0004',N'Phòng kế hoạch đầu tư','NV008'),
('PH0005',N'Phòng nhân sự','NV015'),
('PH0006',N'Phòng A101','NV018'),
('PH0007',N'Phòng A102','NV016')
GO
SET DATEFORMAT DMY
INSERT INTO PHANCONG
VALUES
('NV001','BANH','Co so 1'),
('NV002','BANH','Co so 2'),
('NV003','KEO','Co so 2'),
('NV004','MUT','Co so 1'),
('NV005','KEO','Co so 1'),
('NV006','KEO','Co so 2'),
('NV007','MUT','Co so 1'),
('NV008','MUT','Co so 1'),
('NV009','BANH','Co so 1'),
('NV010','SR','Co so 1'),
('NV011','KEO','Co so 2'),
('NV012','KEO','Co so 2'),
('NV013','SR','Co so 2'),
('NV014','SR','Co so 1'),
('NV015','BANH','Co so 2'),
('NV016','SR','Co so 2'),
('NV017','BANH','Co so 1'),
('NV018','MUT','Co so 1'),
('NV019','SR','Co so 2'),
('NV020','SR','Co so 2')
GO
--SET DATEFORMAT DMY
--INSERT INTO PHIEUNHAP


---//////////////-----------------///////////////---
-------------------*---------------*----------------
--Phần truy vấn
------------------------------------------------------
-- câu 1 Cho biết thông tin của phòng PH0002
SELECT *
FROM PHONGBAN
WHERE MAPH='PH0002'
--Câu 2 Cho biết mã Trưởng phòng hành chính nhân sự
Select TRUONGPHONG
from PHONGBAN
where TENPH=N'Phòng nhân sự'
-- câu 3 Cho biết thông tin nhân viên phòng hành chính nhân sự
SELECT MANV,TENNV,DIENTNV,DIACHI,LUONGNV
FROM NHANVIEN,PHONGBAN
WHERE NHANVIEN.MAPH=PHONGBAN.MAPH AND PHONGBAN.TENPH=N'Phòng Nhân sự'
-- câu 4 Cho biết thông tin nhân viên  của nhân viên làm loại sản phẩm MUT
SELECT *
FROM NHANVIEN,PHANCONG
WHERE NHANVIEN.MANV=PHANCONG.MANV AND MALOAISP='MUT' 
-- câu 4 Cho biết tên sản phẩm có đơn giá thấp nhất
SELECT TENNGUYENLIEU
FROM CHITIETPN,NGUYENLIEU
WHERE CHITIETPN.MANL=NGUYENLIEU.MANL AND DONGIA in (SELECT MIN(DONGIA) FROM CHITIETPN)
-- Câu 5 Lương cao nhất công ty thuộc nhân viên phòng nào ?  
SELECT TENPH
FROM PHONGBAN,NHANVIEN
WHERE PHONGBAN.MAPH=NHANVIEN.MAPH AND LUONGNV =(SELECT MAX(LUONGNV) FROM NHANVIEN)
-- Câu 6 Cho biết mã số ,tên nhân viên được phân công đi làm từ ngày 27-31 tháng 5
SET DATEFORMAT DMY
SELECT NHANVIEN.MANV,TENNV
FROM NHANVIEN,LICHLAMVIEC
WHERE NHANVIEN.MANV=LICHLAMVIEC.MANV AND NGAYLAM BETWEEN'27/05/2021' AND '31/05/2021'
-- Câu 7 Cho biết tổng số lượng sản phẩm nhập vào từ tháng 2-3
--SELECT SUM(SOLUONG),DONGIA,MANL
--FROM PHIEUNHAP,CHITIETPN
--WHERE PHIEUNHAP.MAPN=CHITIETPN.MAPN AND NGAYNHAP BETWEEN '01/05/2020' AND '30/09/2020'
--GROUP BY DONGIA,MANL
--HAVING SUM(SOLUONG) <40
--ORDER BY DONGIA ASC ,MANL DESC
SELECT SUM(SOLUONG) as N'Tổng số lượng đã nhập'
FROM CHITIETPN
HAVING SUM(SOLUONG) >= all(SELECT SUM(SOLUONG)
						FROM CHITIETPN,PHIEUNHAP
						WHERE CHITIETPN.MAPN=PHIEUNHAP.MAPN AND NGAYNHAP BETWEEN '01/02/2021' AND '30/03/2021')
-- Câu 8 Cho biết những nhân viên chưa được phân công đi làm
-------------[CẦN LƯU Ý]-------------------------------
--SELECT TENNV
--FROM NHANVIEN
--WHERE NOT EXISTS (SELECT NHANVIEN.MANV
--FROM lichlamviec,NHANVIEN
--WHERE lichlamviec.MANV=NHANVIEN.MANV)
GO
SELECT TENNV
FROM NHANVIEN
WHERE MANV NOT IN(SELECT MANV FROM lichlamviec)
-- Câu 9 Cho biết tên mã sản phẩm nhân viên 'Kaka' được phân công làm
SELECT distinct(TENSP)
FROM NHANVIEN,PHANCONG,LOAISANPHAM,CHITIETSANPHAM
WHERE NHANVIEN.MANV=[PHANCONG].MANV AND PHANCONG.MALOAISP=LOAISANPHAM.MALOAISP AND CHITIETSANPHAM.MALOAISP=LOAISANPHAM.MALOAISP AND TENNV='Kaka'
-- Câu 10 Với mỗi loại sản phẩm cho biết tên nguyên liệu và  mã nhà cung cấp 
--SELECT MALOAISP,TENNGUYENLIEU,TENNHACC
--FROM NGUYENLIEU,NHACUNGCAPNL,CHITIETSANPHAM
--WHERE NGUYENLIEU.MANCC=NHACUNGCAPNL.MANCC AND CHITIETSANPHAM.MANL=NGUYENLIEU.MANL
--GROUP BY MALOAISP,TENNGUYENLIEU,TENNHACC
--ORDER BY TENNGUYENLIEU ASC ,TENNHACC DESC

SELECT MALOAISP,TENNGUYENLIEU,MANCC
from nguyenlieu,PHIEUNHAP,CHITIETPN,CHITIETSANPHAM
where NGUYENLIEU.MANL = CHITIETSANPHAM.MANL and NGUYENLIEU.MANL = CHITIETPN.MANL and CHITIETPN.MAPN =PHIEUNHAP.MAPN
group by MALOAISP,TENNGUYENLIEU,MANCC
order by MANCC asc
-- Câu 11 Với mỗi phiếu nhập từ 3 triệu cho biết số lượng đơn giá và tên nhà cung cấp của những Bill 
--SELECT SOLUONG,DONGIA,TENNHACC
--FROM CHITIETPN,PHIEUNHAP,NHACUNGCAPNL
--WHERE CHITIETPN.MAPN=PHIEUNHAP.MAPN AND PHIEUNHAP.MANCC=NHACUNGCAPNL.MANCC
--GROUP BY SOLUONG,DONGIA,TENNHACC,TONGTIEN
--HAVING TONGTIEN>'3000000'
--ORDER BY SOLUONG ASC

select TONGTIEN
from PHIEUNHAP

-- Câu 12 Cho biết tên nhà cung cấp ,số lượng và ngày nhập của nguyên liệu 'Tờ rứng'
SELECT TENNHACC,SOLUONG,NGAYNHAP
FROM PHIEUNHAP,NHACUNGCAPNL,CHITIETPN ,NGUYENLIEU
WHERE PHIEUNHAP.MAPN=CHITIETPN.MAPN AND NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC AND CHITIETPN.MANL=NGUYENLIEU.MANL AND TENNGUYENLIEU=N'Trứng' 
-- Câu 13 Với mỗi loại sản phẩm có hạn sử dụng TRÊN 120 ngày cho biết tên nhà cung cấp và ngày nhập
SELECT MALOAISP,TENNHACC,NGAYNHAP,HANSUDUNG
FROM PHIEUNHAP,NHACUNGCAPNL,CHITIETSANPHAM,NGUYENLIEU,CHITIETPN
WHERE NGUYENLIEU.MANL=CHITIETSANPHAM.MANL AND NGUYENLIEU.MANL=CHITIETPN.MANL AND HANSUDUNG >= '120' AND CHITIETPN.MAPN=PHIEUNHAP.MAPN AND  NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC
GROUP BY MALOAISP,TENNHACC,NGAYNHAP,HANSUDUNG
go
-- Câu 14 Cho biết tên nguyên liệu được sử dụng nhiều nhất

SELECT TENNGUYENLIEU,COUNT(*)
FROM NGUYENLIEU,CHITIETSANPHAM
WHERE NGUYENLIEU.MANL =CHITIETSANPHAM.MANL AND EXISTS (SELECT COUNT(NGUYENLIEU.MANL) FROM NGUYENLIEU,CHITIETSANPHAM WHERE CHITIETSANPHAM.MANL=NGUYENLIEU.MANL)
GROUP BY TENNGUYENLIEU
HAVING count(*)
go
SELECT TENNGUYENLIEU,COUNT(*)
FROM NGUYENLIEU
GROUP BY TENNGUYENLIEU
HAVING COUNT(*) >= ALL(SELECT COUNT(*)
						FROM NGUYENLIEU,CHITIETSANPHAM
						WHERE NGUYENLIEU.MANL =CHITIETSANPHAM.MANL 
						GROUP BY TENNGUYENLIEU)
go
---Succelly
select  TENNGUYENLIEU,MANL
from NGUYENLIEU
where nguyenlieu.MANL = (select manl
				from CHITIETSANPHAM
				group by MANL
				having count(*) >= all(select count(*)
									from CHITIETSANPHAM
									group by MANL) )

select TENNGUYENLIEU from NGUYENLIEU where manl='nl12'
go 
SELECT MANL FROM NGUYENLIEU
-- Câu 15 Cho biết tên loại NGUYÊN liệu CHƯA được sử dụng
SELECT MANL,TENNGUYENLIEU
FROM NGUYENLIEU
WHERE  MANL NOT IN (SELECT MANL FROM CHITIETSANPHAM)
go
-- Câu 16 Cho biết thông tin nhân viên được phân công làm mứt 
select NHANVIEN.MANV,TENNV,count(NHANVIEN.MANV) as N'Số lần làm mứt'
from NHANVIEN,PHANCONG
where NHANVIEN.MANV=PHANCONG.MANV and MALOAISP='MUT'
group by NHANVIEN.MANV,TENNV
--having COUNT(*) >= (select nhanvien.MANV ,(NHANVIEN.MANV) from NHANVIEN,PHANCONG where NHANVIEN.MANV=PHANCONG.MANV and MALOAISP='MUT' group by NHANVIEN.MANV)
go
--select 
--go
-- Câu 17 Cho biết tên nhà cung cấp ,địa chỉ nơi cung cấp nhiều loại nguyên liệu nhất
select NHACUNGCAPNL.MANCC,sum(soluong)
from NHACUNGCAPNL,PHIEUNHAP,CHITIETPN
where NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MAPN = CHITIETPN.MAPN and max(SOLUONG) IN (SELECT SUM(SOLUONG) FROM CHITIETPN)
group by NHACUNGCAPNL.MANCC
go
select NHACUNGCAPNL.MANCC,TENNHACC,DIACHINCC,MAX(SOLUONG)
from NHACUNGCAPNL,PHIEUNHAP,CHITIETPN
where NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MAPN = CHITIETPN.MAPN 
GROUP BY  NHACUNGCAPNL.MANCC,TENNHACC,DIACHINCC
having MAX(SOLUONG) <= ANY (select SUM(soluong)
				from NHACUNGCAPNL,PHIEUNHAP,CHITIETPN
				where NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MAPN = CHITIETPN.MAPN
				group by NHACUNGCAPNL.MANCC)
GO
--Succelly
select TENNHACC,DIACHINCC
from NHACUNGCAPNL
where NHACUNGCAPNL.MANCC in ( select MANCC
								from NGUYENLIEU
								group by MANCC 
								having count(*) > (select top 1 count(*) from NGUYENLIEU
																		group by MANCC ) )
																		group by TENNHACC,DIACHINCC
go
select * from NHACUNGCAPNL where MANCC='ncc06'
go
--Bổ sung thêm tên nguyên liệu của nhà cung cấp đó
select TENNHACC,TENNGUYENLIEU
from NHACUNGCAPNL,PHIEUNHAP,CHITIETPN,NGUYENLIEU
where NHACUNGCAPNL.MANCC in ( select MANCC
								from PHIEUNHAP
								group by MANCC 
								having count(*) >=all (select top 3 count(*) 
														from PHIEUNHAP
														group by MANCC )) and NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MAPN = CHITIETPN.MAPN and CHITIETPN.MANL=NGUYENLIEU.MANL
GROUP BY TENNHACC,TENNGUYENLIEU
go
select mancc,count(mancc) 
from PHIEUNHAP
group by mancc 
go
select * from CHITIETPN
select * from PHIEUNHAP
select * from NHACUNGCAPNL
go
-- Câu 18 Cho biết nhân viên được phân công làm ca đúp (2 ca)

select distinct  MANV,MALOAISP ,count(*)
from PHANCONG
group by MANV,MALOAISP
having count(*)<= all(select count(*) from PHANCONG group by MANV)
go
select MANV ,COUNT(*)
from PHANCONG
group by MANV
go
select NgayLAM,TENNV,count(calam)
from NHANVIEN,lichlamviec
where NHANVIEN.MANV=lichlamviec.manv 
group by NgayLam,TENNV
HAVING count(calam) >1
go
-- Câu 19 Cho biết mã tên nhân viên có lương thấp nhất
select MANV, TENNV,LUONGNV
from NHANVIEN
WHERE  LUONGNV<= ALL(SELECT LUONGNV FROM NHANVIEN)
GROUP BY MANV,TENNV,LUONGNV
-------------
select MANV,TENNV
from NHANVIEN 
WHERE LUONGNV= (SELECT MIN(LUONGNV) FROM NHANVIEN)
GO
-- Câu 20 Cho biết phòng có nhiều nhân viên nhất.Xuất tên phòng và mã nhân viên
select TENPH, count(NHANVIEN.MAPH) as N'Số lượng nhân viên'
from NHANVIEN,PHONGBAN
where NHANVIEN.MAPH=PHONGBAN.MAPH
group by TENPH
having count(NHANVIEN.MAPH) >= ALL (select count(NHANVIEN.MAPH)
from NHANVIEN,PHONGBAN
where NHANVIEN.MAPH=PHONGBAN.MAPH)
go
---đã chạy thành công
select nhanvien.MAPH,TENPH, count(*) as N'Số lượng nhân viên'
from NHANVIEN,PHONGBAN where NHANVIEN.MAPH=PHONGBAN.MAPH
group by nhanvien.MAPH,TENPH
having count(*) >= all (select COUNT(*) 
					from NHANVIEN
					group by MAPH)
				
go
-- Câu 21 Sắp xếp lương của nhân viên từ thấp đến cao
select  MANV,TENNV,LUONGNV
from NHANVIEN
order by LUONGNV asc
go
-- Câu 22 Với mỗi phiếu nhập hãy xuất ra tên nhà cung cấp có mức độ nhập hàng từ cao đến thấp(dựa vào số lượng nguyên liệu nhập vào) và ngày nhập từ thấp đến cao
select MANCC,NGAYNHAP,SUM(soluong) as N'Tổng số lượng đã nhập'
from PHIEUNHAP,CHITIETPN
where PHIEUNHAP.MAPN=CHITIETPN.MAPN 
group by MANCC ,NGAYNHAP
order by sum(soluong) desc ,NGAYNHAP asc
go
-- Câu 23 Hãy cho biết từ ngày 5-10/5 Nhân viên chủ yếu làm Tên loại sản phẩm gì ?
--select  TONGTIEN
--from PHIEUNHAP
--order by TONGTIEN desc
set dateformat dmy
Select TENLOAISP,count(*)
from lichlamviec,NHANVIEN,PHANCONG,LOAISANPHAM
Where NHANVIEN.MANV = lichlamviec.manv and NHANVIEN.MANV=PHANCONG.MANV and PHANCONG.MALOAISP = LOAISANPHAM.MALOAISP and Ngaylam>='5/5/2021' and ngaylam<='10/5/2021'
group by TENLOAISP
having count(TENLOAISP)>=all(Select count(TENLOAISP)
							from lichlamviec,NHANVIEN,PHANCONG,LOAISANPHAM
							Where NHANVIEN.MANV = lichlamviec.manv and NHANVIEN.MANV=PHANCONG.MANV and PHANCONG.MALOAISP = LOAISANPHAM.MALOAISP and Ngaylam>='05/05/2021' and ngaylam<='10/05/2021'
							group by tenloaisp)
go
-- Câu 24 Cho biết lương trung bình của những nhân viên làm bánh
select AVG(LUONGNV) as N'Lương trung bình'
from NHANVIEN,PHANCONG,LOAISANPHAM
where NHANVIEN.MANV=PHANCONG.MANV and PHANCONG.MALOAISP=LOAISANPHAM.MALOAISP and TENLOAISP=N'Bánh'
go
-- Câu 25 Cho biết những nhân viên nào có lịch đi làm từ 3 lần trở lên trong tháng
select  NHANVIEN.MANV,count(*) as N'Số lần được phân công'
from NHANVIEN,LICHLAMVIEC
where NHANVIEN.MANV=LICHLAMVIEC.MANV
group by NHANVIEN.MANV
having count(*)>=3
order by count(*) asc
go
-- Câu 26a Tổng tiền nguyên liệu làm kẹo trong tháng 6 tháng đầu là bao nhiêu (Đợi set tổng tiền )
select TENSP,TENNGUYENLIEU,NGUYENLIEU.MANL
from LOAISANPHAM,CHITIETSANPHAM,NGUYENLIEU
where LOAISANPHAM.MALOAISP=CHITIETSANPHAM.MALOAISP and TENLOAISP=N'Kẹo' and NGUYENLIEU.MANL=CHITIETSANPHAM.MANL
set dateformat dmy go
select  sum(SOLUONG*DONGIA) as N'Tổng tiền là'
from PHIEUNHAP,CHITIETPN
where PHIEUNHAP.MAPN=CHITIETPN.MAPN and NGAYNHAP between '1/1/2020' and '30/6/2020' and CHITIETPN.MANL in (select NGUYENLIEU.MANL
from LOAISANPHAM,CHITIETSANPHAM,NGUYENLIEU
where LOAISANPHAM.MALOAISP=CHITIETSANPHAM.MALOAISP and TENLOAISP=N'Kẹo' and NGUYENLIEU.MANL=CHITIETSANPHAM.MANL)
go
-- Câu 27 Hãy cho biết địa chỉ của nhà cung cấp nhập hàng từ tháng 3-5 có số lượng nhiều nhất .
--Xuất ra tên dạng nguyên liệu địa chỉ nhà cung cấp và số lần nhập
select DIACHINCC,Dangnguyenlieu ,count(PHIEUNHAP.MAPN) as N'Số lần nhập',Sum(Soluong) as N'Tổng lượng'
from NHACUNGCAPNL,PHIEUNHAP,CHITIETPN,NGUYENLIEU
where MONTH(ngaynhap)>='3' and month(ngaynhap)<= '5' and NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MAPN=CHITIETPN.MAPN and NGUYENLIEU.MANL=CHITIETPN.MANL 
group by DIACHINCC,Dangnguyenlieu
having Sum(SOLUONG) >= all(select top 1 Sum(Soluong)
						from NHACUNGCAPNL,PHIEUNHAP,CHITIETPN,NGUYENLIEU
						where  MONTH(ngaynhap)>='3' and month(ngaynhap)<= '5' and NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MAPN=CHITIETPN.MAPN and NGUYENLIEU.MANL=CHITIETPN.MANL 
						group by DIACHINCC,Dangnguyenlieu
						Order by Sum(Soluong) desc)
-- Câu 28 Cho biết  nhân viên đến tuổi nghỉ hưu và chưa nghỉ hưu
select TENNV,N'Nghỉ hưu' =case 
							when DATEDIFF(yy,Ngaysinh,getdate()) >=60 then  N'được Nghỉ hưu'
							else N'Chưa được nghỉ hưu'
							end
from NHANVIEN
go

-- Câu 29
--Hết suy nghĩ ra câu tiếp theo rồi cô 
----------------------------------------------------
----------------------------------------------------
-- Phần Chuyển tải dữ liệu
---Bỏ qua các phương pháp xài tool
--1.
create table test
(
	char1 char(20) not null primary key,
	char2 char(30),
	char3 char(40),
)
go
drop table test
go
--add data from txt
bulk insert check
from 'E:\fileSQL\file.txt'
with 
(
	rowterminator ='\n',
	fieldterminator=',',
	firstrow=2
)
select * from test
--2 . add data from excel --Error
bulk insert test
from 'C:\fileinsert\file1.xlsx'
with 
(
	rowterminator ='\n',
	fieldterminator='  ',
	firstrow=2
)
go
--------------------

--Tạo bảng ảo
--1.Tạo 1 bảng ảo với danh sách nhân viên làm ca 3
go
create view v1
as
select nhanvien.MANV,tennv
from NHANVIEN,Lichlamviec
where NHANVIEN.MANV=lichlamviec.MANV and calam='3' 
select * from v1
--2.Tạo bảng ảo với nhân viên làm ca 2 từ ngày 16-23/5 làm ca 2 ,tai co so 2
go
create view v2
as
select NHANVIEN.MANV,tennv,ngaylam
from NHANVIEN,PHANCONG,lichlamviec
where NHANVIEN.MANV=PHANCONG.MANV and NHANVIEN.MANV=lichlamviec.manv and ngaylam >='16/05/2021' and ngaylam<='23/05/2021' and COSOLAMVIEC='Co so 2' 
go
--3.Tạo bảng ảo Tổng tiền từng nguyên liệu
create view v3
as
select TENNGUYENLIEU ,(SOLUONG*DONGIA) as N'Tổng tiền'
from nguyenlieu,CHITIETPN
where NGUYENLIEU.MANL=CHITIETPN.MANL 
go
--4.Tạo bảng ảo lấy các sản phẩm dễ bảo quản nhất (Nhiệt độ bảo quản dễ 25-30)
create view v4
as 
select TENNGUYENLIEU
from NGUYENLIEU
where NhietdoBaoQuan >=20  and NhietdoBaoQuan<35
go
alter view v4	
as
select tennguyenlieu
from NGUYENLIEU
where NhietdoBaoQuan >24 and NhietdoBaoQuan <31 
--Tạo bảng ảo tên các sản phẩm được sản xuất tại kho 2
create view v5
as
select TENSP
from CHITIETSANPHAM,PHANCONG,LOAISANPHAM
where CHITIETSANPHAM.MALOAISP=LOAISANPHAM.MALOAISP and LOAISANPHAM.MALOAISP=PHANCONG.MALOAISP and COSOLAMVIEC='co so 1'
go
----------------------------------------------------
--Phần cấu trúc điều khiển 
--Phần cấu trúc
go
-- 1. Khai báo e biến để lưu trữ mã nhân viên (@manv), tên nhân viên (@tennv), tổng số nhân viên (@tong_sonv)
declare @manv char(5),@tennv nvarchar(25),@tong_sonv int
go
-- 2.Dùng lệnh set để gán tên phòng ban, số nhân viên tối đa của phòng ban PH0001
declare @tenph nvarchar(50),@maxnv int
set @tenph=(select TENPH from PHONGBAN where MAPH='ph0001')
set @maxnv=(select count(*) from NHANVIEN where maph='ph0001' )
print N'Tên phòng ban là : ' + @tenph + N'Số nhân viên phòng này là : ' + convert(char(10),@maxnv)
go
--3.  dùng select
declare @tenph nvarchar(50),@maxnv int
select @tenph=(select TENPH from PHONGBAN where MAPH='ph0001'), @maxnv=(select count(*) from NHANVIEN where maph='ph0001' )
select @tenph as N'Tên phòng ban' ,@maxnv as N'Tổng số nhân viên'
go
--4.Lấy tên người có lương  cao nhất phòng ph0003
declare @tennv nvarchar(50)
set @tennv=(select  TENNV
			from NHANVIEN,PHONGBAN
			WHERE PHONGBAN.MAPH=NHANVIEN.MAPH and PHONGBAN.MAPH='ph0003'  and LUONGNV>= ALL(SELECT LUONGNV FROM NHANVIEN,PHONGBAN where PHONGBAN.MAPH=NHANVIEN.MAPH and PHONGBAN.MAPH='ph0003')
			GROUP BY TENNV)
print N'Nhân viên lương cao nhất PH0003 :' + @tennv
go
--5.Tên nhà cung cấp với hóa đơn cao nhất
declare @tenncc nvarchar(50)
set @tenncc=(select TENNHACC from NHACUNGCAPNL ,PHIEUNHAP
						where PHIEUNHAP.MANCC=NHACUNGCAPNL.MANCC and TONGTIEN=(select max(tongtien) from PHIEUNHAP))
print N'Nhà cung cấp : ' +@tenncc
go
--Câu 5.Gán tổng số nhân viênn làm ở kho 1 và tổng nhân viên làm ở kho 2 : @sumkho1 ,@sumkho2
--So sánh kho nào có nhiều nhân viên hơn
declare @tongkho1 int,@tongkho2 int
set @tongkho1=(Select COUNT(*) from NHANVIEN,PHANCONG where NHANVIEN.MANV=PHANCONG.MANV and COSOLAMVIEC='Co so 1')
set @tongkho2=(Select COUNT(*) from NHANVIEN,PHANCONG where NHANVIEN.MANV=PHANCONG.MANV and COSOLAMVIEC='Co so 2')
--print N'Tổng số nhân viên làm việc ở kho 1 :' +convert(char(5),@tongkho1)
--print N'Tổng số nhân viên làm việc ở kho 2 :' +convert(char(5),@tongkho2)
if( @tongkho1>@tongkho2)
	print N'Tổng số nhân viên ở kho 1 nhiều hơn tổng số nhân viên kho 2'
if (@tongkho1<@tongkho2)
	print N'Tổng số nhân viên ở kho 2 nhiều hơn tổng số nhân viên kho 1'
else
	print N'Hai kho có tổng số nhân viên bằng nhau là : ' +convert(char(5),@tongkho1) +N'nhân viên'
go
--6. Khai báo biến @sonv_chuapc và gán giá trị cho biến như sau : @sosv_chuadk= số
--nhân viên tối đa (@sonv_toida) - số sinh đã được phân công (@sosv_dcpc) in ra cả 3 số liệu trên
declare @sonv_chuapc int ,@sonv_dcpc int ,@sonv_cty int
set @sonv_cty=(select count(*) from NHANVIEN)
set @sonv_dcpc=(select count(*) from NHANVIEN where   NHANVIEN.MANV in (select distinct MANV from LICHLAMVIEC) )
print N'Số nhân viên của công ty                : ' +convert(char(5),@sonv_cty)
print N'Số nhân viên được phân công             : '+convert(char(5),@sonv_dcpc)
print '------------------------------------------------------------------------'
set @sonv_chuapc=@sonv_cty-@sonv_dcpc
print N'Số nhân viên chưa được phân công đi làm : ' + convert(char(5),@sonv_chuapc)
go
-- 7.Đề như câu 6 làm kiểu khác
declare @sonv int
set @sonv=(select  count(*) from NHANVIEN where manv not in (select manv from LICHLAMVIEC))
print N'Số của nhân viên không được đi : ' + convert(char(5),@sonv)
go
--8.  In ra tên nhân viên sau đó :
	--Dùng biến nhân viên chưa được phân công đi làm xài lệnh if lương >15 triệu in ra 'Sếp' 
	--if lương <1.5tr and >=1tr 'Nghỉ dịch'
	--else lương <0.5tr  'Thất tình không muốn đi làm'
	--Điều kiện thực hiện : Chỉ duy nhất 1 nhân viên kkhông được phân công đi làm
go
declare @tennv nvarchar(50),@luong int
select @tennv=(select TENNV from NHANVIEN where MANV not in (select manv from LICHLAMVIEC)),
@luong =(select LUONGNV from NHANVIEN where MANV not in (select manv from LICHLAMVIEC))
print N'Tên của nhân viên                 : ' + @tennv

print ''
if(@luong>1500000)
	 print N'Lí do không được phân công đi làm :' + N'Sếp'
	else if(@luong>=500000)
		print N'Lí do không được phân công đi làm :' + N'Nghỉ dịch'
		else
			print N'Lí do không được phân công đi làm :' + N'Thất tình nên không muốn đi làm'
go
-- 9. In ra thời gian ngày nhập hàng gần nhất từ tháng 4-8
declare @ngaymax date
set @ngaymax=(select NGAYNHAP from PHIEUNHAP where NGAYNHAP=(select max(ngaynhap) from PHIEUNHAP where MONTH(ngaynhap)>=4 and MONTH(ngaynhap)<=8))
print N'Ngày nhập lớn nhất trong quý 2  :' + convert(char(10) ,@ngaymax)
go
-- 10 . Ta thấy đơn vị tính : Hộp cái lát viên bịch
--Lần lượt gán các giá trị Hộp =10,cái=3,lát =1,viên=5, bịch=7
--Hãy cho biết tên loại sản phẩm có giá trị lớn nhất
declare @hop int,@cai int ,@lat int ,@vien int,@bich int,@max int ,@a nchar(10),@b nchar(10),@c nchar(10),@d nchar(10),@e nchar(10),@namemax nchar(10)
set @hop=((select count(*) from CHITIETSANPHAM where DVT=N'Hộp')*10)
set @cai=((select count(*) from CHITIETSANPHAM where DVT=N'Cái')*3)
set @lat=((select count(*) from CHITIETSANPHAM where DVT=N'Lát')*1)
set @vien=((select count(*) from CHITIETSANPHAM where DVT=N'Viên')*5)
set @bich=((select count(*) from CHITIETSANPHAM where DVT=N'Bịch')*7)
set @a=N'Hộp' set @b=N'Cái' set @c=N'Lát'  set @d=N'Viên' set @e=N'Bịch' 
--print convert(char(10),@hop)
--print convert(char(10),@cai)
--print convert(char(10),@lat)
--print convert(char(10),@vien)
--print convert(char(10),@bich)
set @max=@lat set @namemax=@a
if(@cai>@max)
	 set @max=@cai set @namemax=@b
	if(@vien>@max)
		set @max=@vien set @namemax=@c
		if(@bich>@max)
			set @max=@bich set @namemax=@d
			if(@hop>@max)
				set @max=@hop set @namemax=@e
select @namemax as N'Tên đơn vị tính có giá trị lớn nhẩt'   ,@max as N'Gía trị : '
go
--Câu 11: 
--Các nguyên liệu sau khi được nhập vào sẽ chuyển đến 3 kho :(Các nguyên liệu phải được bảo quan kho chênh lệch so với yêu cầu trung bình của nó là 5 độ 
--Kho A có nhiệt độ bảo quản là : 0 độ C
--Kho B có nhiệt độ bảo quản là : 10 độ C
--Kho C có nhiệt độ bảo quản là : 20 độ C
declare @khoa int,@khob int,@khoc int ,@nhietdonl int
select @khoa=10 ,@khob=20 ,@khoc=30
set @nhietdonl=(select NhietdoBaoQuan from NGUYENLIEU where MANL='nl01')
if (@nhietdonl<=@khoa)
	print N'Nhập kho A'
	else if (@nhietdonl<=@khob or @nhietdonl>= @khob)
		print N'Nhập kho B'
		else
			print N'Nhập kho C'
select * from NGUYENLIEU where MANL='nl03'
go
--Câu 12 : Xem có nhà cung cấp nào có địa chỉ ở Việt Nam kO ? có thì in ra tên
declare @tenncc nchar(20)
set @tenncc =(select TENNHACC from NHACUNGCAPNL where QUOCGIA = 'Viet Nam')
if not exists (select * from NHACUNGCAPNL where QUOCGIA = N'Viet Nam')
	print N'Không tồn tại'
else
	print N'Tên nhà cung cấp là : ' + @tenncc + N'Là công ty tư nhân Việt Nam'
go
--Cái ở dưới chưa chạy đc
declare @tenncc nchar(20)
set @tenncc =(select TENNHACC from NHACUNGCAPNL where QUOCGIA like N'%Nam')
if not exists (select * from NHACUNGCAPNL where QUOCGIA like N'%Nam')
	print N'Không tồn tại'
else
	print N'Tên nhà cung cấp là : ' + @tenncc + N'Là công ty tư nhân Việt Nam'
go
--Câu 13: Đưa vào nhà cung cấp ,kiểm tra xem các nguyên liệu : Ca cao xí muội dứa có phải nhà cung cấp đó bàn giao hay kô?
--Nếu có thì in ra "Thông báo ! Đây là nguyên liệu được bàn giao từ nhà cung cấp này" và ngược lại
declare @manncc char(10),@tennl nvarchar(50)
set @manncc=(select mancc from NHACUNGCAPNL where MANCC='ncc04' )
set @tennl=(select tennguyenlieu from NGUYENLIEU,CHITIETPN,PHIEUNHAP where NGUYENLIEU.MANL=CHITIETPN.MANL and CHITIETPN.MAPN=PHIEUNHAP.MAPN and PHIEUNHAP.MAPN=@manncc )
if(@tennl=N'Cao cao' and @tennl=N'Xí muội' and @tennl=N'Dứa')
	print N'Thông báo ! Đây là nguyên liệu được bàn giao từ nhà cung cấp này !'
else
	print N'Đây không phải những nguyên liệu được cung cấp từ nhà cung cấp này '
go
print @@connections
print @@version
print @@rowcount
print @@Servicename
go
print 1+3-5*4 +150
go
---
---------
---------------
---------------------
----------------------------
-----------------------------------
-------------------------------------------
-------------------------------------------------
--------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------------
--------------------------------------------------------------------------------    --
--------------------------------------------------------------------------------   -----
--------------------------------------------------------------------------------    ---
--------------------------------------------------------------------------------
--Phần thủ tục 
--Câu 1 .Truyền vào tham số in ra toàn bộ thông tin của nhân viên đó
go
create proc proc_in_nv @manv char(10)
as
if not exists (select * from NHANVIEN where MANV=@manv)
	print 'not exists Employer'
else
	select * FROM NHANVIEN
	where MANV=@manv
go 
exec proc_in_nv 'nv001'
go
drop proc proc_in_nv
go
alter table phongban
add trungbinhluong money
go
update PHONGBAN
set trungbinhluong=null
go
--Câu 2. thêm cột trung bình lương trong bảng phòng ban
--Viết hàm cập nhật
alter table phongban
add avg_Luong money
go
create view TablehaveAvg_money
as
select TENPH ,avg(LUONGNV) as N'AVG_Luong'
from PHONGBAN,NHANVIEN
where PHONGBAN.MAPH=NHANVIEN.MAPH
group by TENPH
go
create proc proc_update_avg
as
if not exists (select * from PHONGBAN )
	return 0
else 
	return 1
go
declare @kq int
exec @kq=proc_update_avg 
if(@kq=0)
	print 'not exists instance '
else
	update PHONGBAN
	set avg_Luong=(select AVG(LUONGNV)
	from NHANVIEN
	where PHONGBAN.MAPH=NHANVIEN.MAPH )
go
drop proc proc_update_avg
go
select * from PHONGBAN
go
--Câu 3. Truyền vào mã nhà cung cấp in ra địa chỉ 
create proc proc_output_address @mancc char(10)
as
if not exists (select * from NHACUNGCAPNL where MANCC=@mancc)
	print 'Have not exists code producer in here ! '
else
	select DIACHINCC
	from NHACUNGCAPNL
	where MANCC=@mancc
go
exec proc_output_address 'ncc01'
go
--Câu 4.Truyền  vào mã ncc in ra tổng tiền (không xài out put)
create proc proc_summoney @mancc char(10)
as
if not exists (select * from NHACUNGCAPNL where MANCC=@mancc)
	print 'Have not exists code producer in here ! '
else
	select sum(TONGTIEN ) as N'Tổng tiền'
	from NHACUNGCAPNL,PHIEUNHAP
	where NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MANCC=@mancc
go
exec proc_summoney  'ncc05'
go
drop proc proc_summoney
go
--Câu 5. như câu 4 mà xài thêm out put
create proc proc_summoney_out @mancc char(10) ,@tongtien money output
as
if not exists (select * from NHACUNGCAPNL where MANCC=@mancc)
	print 'Have not exists code producer in here ! '
else
	 set @tongtien= (select sum(TONGTIEN )
	from NHACUNGCAPNL,PHIEUNHAP
	where NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MANCC=@mancc)
go
declare @tongtien1 money 
exec proc_summoney_out 'ncc02' ,@tongtien1 output
--print 'Sum Money producer : ' + convert(char(15),@tongtien1)
select @tongtien1 as N'Sum money'
--select @tongtien1 as 'Sum Money'
go
create proc proc_tongtienout @mancc char(10) ,@tongtien money output
as
if not exists (Select * from NHACUNGCAPNL where MANCC=@mancc)
	print 'not exists mancc'
else
	set @tongtien=( select sum(TONGTIEN) 
	from PHIEUNHAP,CHITIETPN
	where phieunhap.mapn =CHITIETPN.MAPN and PHIEUNHAP.MANCC=@mancc)
go
declare @mancc char(10),@tongtien money
exec proc_tongtienout 'ncc02',@tongtien output
print N'Tổng số tiền' +convert(char(20), @tongtien)
go
drop proc proc_summoney_out
go
select * from PHIEUNHAP
go
-- Câu 6.Viết thủ tục thêm dữ liệu vào bảng
create proc proc_addvalue_ncc @mancc char(15) ,@tenncc varchar(50),@diachi varchar(50) ,@quocgia varchar(40)
as
insert into NHACUNGCAPNL
Values
(@mancc,@tenncc,@diachi,@quocgia)
go 
proc_addvalue_ncc 'NCC09' ,'BMW','Tan Thuan Quan 7 TPHCM','German'
go
-- Câu 7.Viết hàm cập nhật tên phòng ban
create proc proc_updatetenpb @mapb varchar(20)
as
if not exists(select * from phongban where maph=@mapb)
	print 'Have not exist this maph !'
else
	
	update PHONGBAN
	set TENPH=N'Phòng thông tin'
	where MAPH=@mapb
go
declare @kq int,@mapb varchar
exec @kq =proc_updatetenpb 'PH0007' 
if(@kq<0)
	
	print N'Update Failed'
	
else
	print N'Đã được cập nhật'
go
drop proc proc_updatetenpb
-- Câu 8.Kiểm tra trong ngày nhập hàng mới nhất có phải là tháng 5 không nếu nhỏ hơn 5 thì tạo mới (ncc08)
-- thêm 1 phiếu nhập cung cấp các nguyên liệu : bột mì . bơ lạc Kiểm tra các nguyên liệu này đã có trong list chưa nếu chưa thì tạo mới
create proc proc_addnewPN
@mapn char(10),
@ngaynhap date,
@tongtien money,
@mancc char(20)
as
	declare @idpn int,@count int,@countnl int ,@idnl int,@manl char(10), @nguyenlieu Nvarchar(50),@Nhietdo int,@dangnguyenlieu nvarchar(50)
	begin
		set @count=(select COUNT(*) from PHIEUNHAP)
		set @countnl=(Select COUNT(*) from NGUYENLIEU)
		set @idpn=@idpn+@count+1
		set @idnl=@countnl+1
		set @manl='NL'+convert(varchar,@idnl)
		set @mapn='PN' +CONVERT(varchar,@idpn)
		if exists (Select * from phieunhap where Mapn=@mapn)
			if (Select MONTH(Ngaynhap) from PHIEUNHAP where MAPN=@mapn)<5
				begin
					insert into PHIEUNHAP
					values (@mapn,@ngaynhap,@tongtien,@mancc)
					set @nguyenlieu=(Select tennguyenlieu from NGUYENLIEU)
					if(@nguyenlieu=N'Bột mì' and @nguyenlieu=N'Bơ lạc')
						insert into nguyenlieu
						values
						(@manl,@nguyenlieu,@Nhietdo,@dangnguyenlieu)					
					else
						print N'Đã tồn tại nguyên liệu trong danh sách '				
				end
			else
				print N'Đã tồn tại'
		else
			print N'Không tồn tại mã phiếu nhập này'
	end
go
--Làm lại
-- Câu 8.Kiểm tra trong ngày nhập hàng mới nhất có phải là tháng 5 không nếu nhỏ hơn 5 thì tạo mới (ncc08)
-- thêm 1 phiếu nhập cung cấp các nguyên liệu : bột mì . bơ lạc Kiểm tra các nguyên liệu này đã có trong list chưa nếu chưa thì tạo mới
create proc proc_addnewPN1
@mapn char(10),@ngaynhap date,@tongtien money,@mancc char(20)
as
declare @manl char(10), @nguyenlieu Nvarchar(50),@Nhietdo int,@dangnguyenlieu nvarchar(50)
	if exists(Select* from PHIEUNHAP where MAPN=@mapn)
		begin
		declare @max int
		set @max=(Select max(month(ngaynhap)) from PHIEUNHAP)
			if @max<5
				print N'Phiếu nhập đã tồn tại và nhỏ hơn tháng 5'
			else
				update PHIEUNHAP
				set NGAYNHAP=@ngaynhap,TONGTIEN=@tongtien,MANCC=@mancc
				where MAPN=@mapn 
				print N'Đã cập nhật'
		end
	else
		begin
					insert into PHIEUNHAP
					values (@mapn,@ngaynhap,@tongtien,@mancc)
					set @nguyenlieu=(Select tennguyenlieu from NGUYENLIEU)
					print N'Đã thêm dữ liệu thành công '
					if N'Bột mì' in (Select tennguyenlieu from NGUYENLIEU) and N'Bơ lạc'in (Select tennguyenlieu from NGUYENLIEU)
						insert into nguyenlieu
						values
						(@manl,@nguyenlieu,@Nhietdo,@dangnguyenlieu);								
					else
						print N'Đã tồn tại nguyên liệu trong danh sách '				
				end
go
set dateformat dmy
exec proc_addnewPN1 'PN18','1/05/2021',null,'NCC08'
select * from PHIEUNHAP
declare @test varchar(15),@sum varchar(15),@c varchar(20)
set @test='PN05'
set @sum=right(@test,2)
set @c='Phieunhap' +@sum
print @c
--
if((select month(ngaynhap) from PHIEUNHAP where MAPN='PN05')<5)
	print N'Nhỏ hơn 5'
else
	print N'nhỏ hơn 4'
go
select max(ngaynhap) from PHIEUNHAP
go
DECLARE @Number INT = 1 ;
DECLARE @Total INT = 0 ;

WHILE @Number < = 10
BEGIN
	IF @NUMBER = 5
		BREAK;
	ELSE
		SET @Total = @Total + @Number;
		SET @Number = @Number + 1 ;
	CONTINUE;
END;
PRINT @Total;
GO
--Câu 9 Viết hàm cập nhật tổng tiền trên bảng phiếu nhập
create proc proc_update_summoney 
as
begin
	if not exists (Select * from PHIEUNHAP)
		print N'Have not exists this mancc'
	else
		begin
			update PHIEUNHAP
			set TONGTIEN=(Select dongia*soluong from CHITIETPN WHERE PHIEUNHAP.MAPN=CHITIETPN.MAPN)
			FROM CHITIETPN
			where PHIEUNHAP.MAPN=CHITIETPN.MAPN
		end
end
select * from chitietpn
select * from phieunhap
go
declare @kq int
exec @kq=proc_update_summoney 
if(@kq<0)
	print N'Update failed'
else
	print N'Update Succelly'
go
drop proc proc_update_summoney
go
--Câu 10 Truyền vào mã nhà cung cấp xét tổng tiền
--Nếu lớn hơn 10tr thì xếp vào VIP
--Lớn hơn 5tr thì khách hàng thân thiết
--Khách hàng quen 2-5tr
--Nhỏ hơn 2tr khách hàng mới thân
---------------------Edit : đổi từ khách hàng thành nhà cung cấp-------------------------------

create proc proc_xeploai @mancc char(20),@LoaiKH nvarchar(20) out
as
begin
	declare @tongtien money
	set @tongtien=(Select tongtien from PHIEUNHAP where MANCC=@mancc)
	if not exists (Select * from PHIEUNHAP where MANCC=@mancc)
		print N'Have not exists this mancc'
	else
		begin
			if(@tongtien>10000000)
				set @LoaiKH=N'VIP'
			else if (@tongtien>5000000)
				set @LoaiKH=N'Khách hàng thân thiết'
			else if(@tongtien >2000000)
				set @LoaiKH=N'Khách hàng quen'
			else
				set @LoaiKH=N'Khách hàng mới'
		end
end
go
declare @typekh nvarchar(50)
exec proc_xeploai 'NCC05' ,@typekh out
print N'Loại khách hàng :' + @typekh
go
drop  proc proc_xeploai
go
--Câu 11.Viết thủ tục nhập vào một mã sản phẩm bất kỳ và in ra ngày hết hạn của nó
create proc proc_ngayhethan @tensp nvarchar(50),@ngayhethan date output
as
begin
	if exists (select * from CHITIETSANPHAM where TENSP=@tensp)	
		begin		
			set @ngayhethan=(select dateadd(day,HANSUDUNG,NGAYSX) from CHITIETSANPHAM where TENSP=@tensp )
			return 1
		end
	else 
		return 0
end
go
declare @kq int,@hsd date
exec @kq= proc_ngayhethan N'Bánh gạo',@hsd output
if @kq=0
	print N'Không tồn tại sản phẩm này'
else
	select @hsd as N'Ngày hết hạn'
go
drop proc proc_ngayhethan
select * from CHITIETSANPHAM
go
-- Câu 12.Viết thủ tục cập nhật lương trung bình của phòng ban và cập nhật sỉ số
create proc proc_update_avg
as
begin
	if not exists (select * from PHONGBAN)
		return 0
	else
		update PHONGBAN
		set avg_Luong=(select AVG(LUONGNV) from NHANVIEN where NHANVIEN.MAPH=PHONGBAN.MAPH)
		from NHANVIEN
		where NHANVIEN.MAPH=PHONGBAN.MAPH
		return 1
end
go
select * from PHONGBAN
select * from NHANVIEN where MAPH='ph0007'
select 5300000/2
go
declare @kq int
exec @kq=proc_update_avg
if (@kq<=0)
	print N'Update Failed'
else
	print N'Update Succelly'
go
drop proc proc_update_avg
go
------Cập nhật sỉ số
create proc proc_update_siso
as
begin
	if not exists (select * from PHONGBAN)
		return 0
	else
		update PHONGBAN
		set siso=(select count(*) from NHANVIEN where NHANVIEN.MAPH=PHONGBAN.MAPH)
		from NHANVIEN
		where NHANVIEN.MAPH=PHONGBAN.MAPH
end
go
declare @kq int
exec @kq=proc_update_siso
if (@kq<=0)
	print N'Update Failed'
else
	print N'Update Succelly'
go
create proc proc_capnhatsiso 
as
if not exists (select * from PHONGBAN)
	return 0
else
	update phongban
	set siso=(Select count(*) from NHANVIEN where NHANVIEN.MAPH= PHONGBAN.MAPH)
	from NHANVIEN
	where NHANVIEN.MAPH=PHONGBAN.MAPH
go
declare @kq int
exec @kq =proc_capnhatsiso
if @kq =0
	print 'Update Failed'
else
	print 'Update Succelly'
----------
---------------
--------------------
-----------------------------
-------------------------------------
-------------------------------------------
-----------------------------------------------
--Hàm do người dùng định nghĩa Function
--Câu 1.Viết hàm trả về danh sách các nhà cung cấp(mã ,tên)--Không truyền pararmeter
create function fc_dsncc()
returns table
as
return (select mancc,TENNHACC from dbo.NHACUNGCAPNL) 
go
select * from dbo.fc_dsncc()
drop function dbo.fc_dsncc
--Câu 2.Viết hàm thống kê số lượng các nhân viên không đăng ký đi làm
go
create function fc_countsl()
returns table
as
	return (select  count(*)  as N'Số nv ko đki đi làm' from NHANVIEN where manv not in (select manv from LICHLAMVIEC))
go
select * from dbo.fc_countsl()
drop function fc_countsl
go
create function fc_countkodilamint()
returns int
as
begin
	return (select COUNT(*) from NHANVIEN where MANV not in (select manv from lichlamviec))
end
go
declare @sl int
set @sl = dbo.fc_countkodilamint() 
print N'Số lượng không đi làm là :'  + convert(char(10),@sl)
go
--Câu 3.Viết hàm cập nhật đơn giá một sản phẩm bất kỳ +25000(mapn,manl)
create function fc_update(@mapn varchar(10),@manl varchar(10))
returns money
as 
begin
	declare @dongia money
	set @dongia=(select dongia+25000 from chitietpn where MAPN=@mapn and MANL=@manl)
	return @dongia
end
go
declare @tien money
set @tien=dbo.fc_update('pn01','nl05')
print N'Số tiền sau khi cập nhập :' +convert(nvarchar(10),@tien)
select * from chitietpn where mapn='pn01' and manl='nl05'
drop function fc_update
go
--Câu 4. Đưa vào ngày của một sản phẩm bất kì xem đó là ngày thứ mấy trong tuần
create function fc_dw_sp(@maloaisp nvarchar(10),@ma_nl nvarchar(15))
returns nvarchar(20)
as
begin
	declare @day nvarchar(20)
	set @day=case DATEPART(dw,(select ngaysx from CHITIETSANPHAM where MANL=@ma_nl and MALOAISP=@maloaisp))
	when 1 then N'Ngày Chủ Nhật'
	when 2 then N'Ngày Thứ Hai'
	when 3 then N'Ngày Thứ Ba'
	when 4 then N'Ngày Thứ Tư'
	when 5 then N'Ngày Thứ Năm'
	when 6 then N'Ngày Thứ Sáu'
	when 7 then N'Ngày Thứ Bảy'
	end
	return @day
end
go
declare @ngaythu nvarchar(20)
set @ngaythu=dbo.fc_dw_sp('BANH','NL11')
print N'Ngày sản phẩm được sản xuất là :' + @ngaythu
drop function fc_dw_sp
go
--Câu 5.Viết hàm xem danh sách các sản phẩm được làm ở kho 2
create function fc_listsp_k2(@tencoso varchar(20))
returns @tablelist table(tensp nvarchar(20),tennguyenlieu nvarchar(50))
as
begin
if(@tencoso='co so 1')
	insert into @tablelist
	select tensp ,TENNGUYENLIEU
	from phancong,loaisanpham,chitietsanpham,nguyenlieu
	where PHANCONG.MALOAISP=LOAISANPHAM.MALOAISP and LOAISANPHAM.MALOAISP=CHITIETSANPHAM.MALOAISP and CHITIETSANPHAM.MANL=NGUYENLIEU.MANL and COSOLAMVIEC=@tencoso
	group by CHITIETSANPHAM.TENSP,TENNGUYENLIEU
else
	insert into @tablelist
	select tensp ,TENNGUYENLIEU
	from phancong,loaisanpham,chitietsanpham,nguyenlieu
	where PHANCONG.MALOAISP=LOAISANPHAM.MALOAISP and LOAISANPHAM.MALOAISP=CHITIETSANPHAM.MALOAISP and CHITIETSANPHAM.MANL=NGUYENLIEU.MANL and COSOLAMVIEC=@tencoso
	group by CHITIETSANPHAM.TENSP,TENNGUYENLIEU
	return 
end
go
select * from dbo.fc_listsp_k2('co so 2')
drop function fc_listsp_k2
go
--Câu 6.Viết hàm danh sách thống kê của một nguyên liệu (ngày nhập ,ngày sản xuất sớm nhất) và khoảng cách của nó
create function fc_hsd()
returns @table table (manl nvarchar(20),ngaynhap date,ngayxuat date,tongngay  int)
as
begin
		insert into @table
		select  distinct (tennguyenlieu), (min(NGAYNHAP)), max(NGAYSX),datediff(day,ngaynhap,ngaysx)
		from NGUYENLIEU,PHIEUNHAP,CHITIETPN,CHITIETSANPHAM
		where PHIEUNHAP.MAPN=CHITIETPN.MAPN and CHITIETPN.MANL=NGUYENLIEU.MANL and NGUYENLIEU.MANL=CHITIETSANPHAM.MANL 
		group by NGUYENLIEU.MANL,TENNGUYENLIEU,NGAYNHAP,NGAYSX
	return
end
go
--Câu này nên tận dụng thêm vào cursor
while(select tongngay from dbo.fc_hsd())>0
	select * from dbo.fc_hsd()
	go
drop function fc_hsd
go
--Câu 7.Viết hàm thống kê danh sách số lượng các nguyên liệu của từng nhà cung cấp
create function  fc_nl_ncc()
returns @table table (tennhacungcap nvarchar(50),tongsoluong int)
as
begin
	insert into @table
	select TENNHACC,sum(SOLUONG)
	from nhacungcapnl,phieunhap,CHITIETPN
	where NHACUNGCAPNL.MANCC=PHIEUNHAP.MANCC and PHIEUNHAP.MAPN=CHITIETPN.MAPN
	group by TENNHACC
	return
end
go
select * from dbo.fc_nl_ncc()
go
--Câu 8. Viết hàm nhập vào mã phòng ban ,in ra mã nhân viên có lương cao nhất phòng ban đó
create function fc_timmanv(@maph char(10))
returns char(10)
as
begin
	declare @manv char(10)
	set @manv=(select manv from NHANVIEN ,phongban where nhanvien.MAPH = PHONGBAN.MAPH and NHANVIEN.MAPH=@maph and 
						LUONGNV>=all(select LUONGNV from NHANVIEN where maph=@maph ))
	return @manv
end
go
declare @ma_nv char(10)
set @ma_nv = dbo.fc_timmanv('ph0006')
print @ma_nv
go
--Câu 9.Giả sử rằng tất cả các sản phẩm phải hoàn thành trước ngày 20/4 để kịp xuất kho
--Thống kê danh sách các sản phẩm đúng kì hạn và trễ kì hạn 
go
create function fc_daykihan()
returns @table table (tensanpham nvarchar(50),
					  Check_kì_hạn nvarchar(50))
as
begin
	declare @kihan nvarchar(50)
	if(select ngaysx from CHITIETSANPHAM)<='20/4/2021'
		begin
			set @kihan=N'Đúng kì hạn'
		end
	else
		begin
			set @kihan=N'Trễ kì hạn'
		end
	insert into @table
	select TENSP,@kihan
	from CHITIETSANPHAM
	return 
end
go
select * from dbo.fc_daykihan()
go
drop function dbo.fc_daykihan
go
--Làm lại Succelly
--Câu 9.Giả sử rằng tất cả các sản phẩm phải hoàn thành trước ngày 20/4 để kịp xuất kho
--Thống kê danh sách các sản phẩm đúng kì hạn và trễ kì hạn 
go 
create function fc_daykihan()
returns @table table (Tên_sản_phẩm nvarchar(50),
						Mã_nguyên_liệu char(10),
						Mã_Loại_SP CHAR(10),
					  Check_kì_hạn nvarchar(50))
as
begin
	declare @kihantrue nvarchar(50),@kihanfalse nvarchar(50)
	set @kihantrue=N'Đúng kì hạn'
	set @kihanfalse=N'Trễ kì hạn'
	insert into @table
	select TENSP,manl,MALOAISP,@kihantrue
	from CHITIETSANPHAM
	where NGAYSX<='20/4/2021'
	
	insert into @table
	select TENSP,MANL,MALOAISP,@kihanfalse
	from CHITIETSANPHAM
	where NGAYSX>'20/4/2021'
	return
end
go
drop function dbo.fc_daykihan
go
set dateformat dmy
select * from dbo.fc_daykihan()
go
--Câu 10.Tận dụng dữ liệu table từ câu 9.
--Nhập vào cơ sở làm việc kiểm tra xem phòng đó có đáp ứng đúng hạn ko 
go
create function fc_laydata(@cosolamviec nvarchar(10))
returns nvarchar(50)
as
begin 	
	declare @checkihan nvarchar(50)
	set @checkihan=(select distinct check_kì_hạn from dbo.fc_daykihan() ,PHANCONG,LOAISANPHAM
					where PHANCONG.MALOAISP=LOAISANPHAM.MALOAISP and Mã_loại_sp = LOAISANPHAM.MALOAISP and COSOLAMVIEC='co so 2')
	return @checkihan
end
go
declare @kihan nvarchar(50)
set @kihan= dbo.fc_laydata('Co so 1')
if @kihan=null
	print N'Vui lòng kiểm tra lại thông tin đã nhập'
else
print @kihan
go
drop function dbo.fc_laydata
go
---------------
------------------------
----------------------------
---------------------------------------
-------------------------------------------------
--TRIGGER
go
--Câu 1.Viết trigger cập nhật sỉ số nhân viên mỗi khi thêm xóa sửa nhân viên
create trigger trg_themnv on nhanvien
for insert
as
begin
	update PHONGBAN
	set siso=siso+1
	where MAPH=(select MAPH from inserted)
end
go
set dateformat dmy
insert into NHANVIEN
values
('NV021','Romario','Germany','47571264','420000','PH0001',null)
go
create trigger trg_xoanv on nhanvien
for delete
as
begin
	update PHONGBAN
	set siso=siso-1
	where MAPH=(select MAPH from deleted)
end
go 
select * from NHANVIEN where MANV='nv021'
select * from PHONGBAN 
delete from NHANVIEN where MANV='nv021' 
go
create trigger trg_update_siso on nhanvien
for update
as
begin
	if update(maph)
	begin
		update PHONGBAN
		set siso=siso-1
		where MAPH=(select MAPH from deleted)

		update PHONGBAN
		set siso=siso+1
		where MAPH=(select MAPH from inserted)
	end
end
go
update NHANVIEN
set TENNV='Nguyen Van A'
where manv='nv021'
drop trigger trg_update_siso
drop trigger trg_themnv
drop trigger trg_xoanv
go
--Câu 2.Mỗi nhân viên chỉ được đăng kí tối đa 2 ca /ngày lớn hơn thì đưa ra thông báo
create trigger trg_checkcalam on lichlamviec
for insert,update
as
begin
	declare @soca int ,@ngaylam date
	set @soca=(select count(*) from lichlamviec where ngaylam=(select ngaylam from inserted) and manv=(select manv from inserted))
	if(@soca<=2)
		commit tran
	else
		begin
			print N'Một ngày chỉ được đăng kí tối đa 2 ca'
			rollback
		end
end
go
set dateformat dmy
insert into Lichlamviec
values
('NV018','2','19/05/2021')
delete from lichlamviec where manv='nv018' and calam='2' and ngaylam='19/05/2021'
select * from lichlamviec
drop trigger trg_checkcalam
go
--Câu 3. Viết trigger mỗi khi thêm,xóa,sửa nhân viên vào thì cập nhật vào bảng avg lương
create trigger trg_insert_avg on nhanvien
for insert 
as
begin
	declare @soluong_themvao int
	set @soluong_themvao=(select count(*) from inserted)
	update phongban
	set avg_luong=((select sum(luongnv) from nhanvien )+(select sum( LUONGNV) from inserted))/(select count(*)+@soluong_themvao from NHANVIEN )
	where MAPH=(select MAPH from inserted)
end
go
set dateformat dmy
insert into nhanvien
values
('NV021','Romario','Germany','47571264','200000','PH0003',null)
go 
select * from PHONGBAN
go 
delete from NHANVIEN where MANV='nv021'
drop trigger trg_insert_avg 
go
create trigger trg_delete_avg on nhanvien
for delete
as
begin
	declare @soluong_themvao int
	set @soluong_themvao=(select count(*) from deleted)
	update phongban
	set avg_luong=((select sum(luongnv) from nhanvien where 
	NHANVIEN.MANV=(select manv from deleted))+(select LUONGNV from deleted))/(select count(*)-1 from NHANVIEN )
	where MAPH=(select MAPH from deleted)
end
go
delete from NHANVIEN where MANV='nv021'
go
drop trigger trg_delete_avg 
go
create trigger trg_update_avg on nhanvien
for update
as
begin
	declare @soluong_themvao int
	set @soluong_themvao=(select count(*) from deleted)
	update phongban
	set avg_luong=((select sum(luongnv) from nhanvien where 
	NHANVIEN.MANV=(select manv from deleted))+(select LUONGNV from deleted))/(select count(*)-@soluong_themvao from NHANVIEN )
	where MAPH=(select MAPH from deleted)

	update phongban
	set avg_luong=((select sum(luongnv) from nhanvien where 
	NHANVIEN.MANV=(select manv from inserted))+(select LUONGNV from inserted))/(select count(*)+@soluong_themvao from NHANVIEN )
	where MAPH=(select MAPH from inserted)
end
go
update nhanvien
set luongnv ='600000'
where MANV='nv021'
go
drop trigger trg_update_avg
go
--Câu 4.Viết trigger khi thêm một phiếu nhập kiểm tra nhà cung cấp đã có chưa nếu chưa thì cập nhật mới nhà cung cấp
--Chưa được
create trigger trg_add_pn on phieunhap
for insert
as
begin
	declare @mancc varchar(10)
	set @mancc=(select mancc from inserted)
	if  exists(select * from NHACUNGCAPNL where MANCC=@mancc)
		begin
			commit tran
		end
	else
		insert into nhacungcapnl(mancc)
		values (@mancc)
		 
end
go
set dateformat dmy
insert into PHIEUNHAP
values
('PN20','20/1/2021',null,'NCC10')
go 
drop trigger trg_add_pn
go
--Câu 5.Viết trigger mỗi khi thêm /sửa trên bảng chi tiết sản phẩm thì phải nằm trong các loại sản phẩm 'BANH',KEO,SR,MUT
go
create trigger trg_checkloai on chitietsanpham
for insert 
as
begin
	declare @maloaisp varchar(10)
	set @maloaisp=(select maloaisp from inserted)
	if(@maloaisp='BANH' or @maloaisp='KEO' or @maloaisp='MUT' or @maloaisp='SR' or @maloaisp='KM' )
		begin
			commit tran
		end
	else
		begin	
		print N'Loại sản phẩm thêm vào phải nằm trong danh sách cho phép'
		rollback
		end
end
go select * from CHITIETSANPHAM
set dateformat dmy
insert into CHITIETSANPHAM
values
('MUTe',N'Mứt vỏ quýt','200','NL01' ,N'Hộp','03/01/2021',null)
go
delete from CHITIETSANPHAM where MALOAISP='MUT' and TENSP=N'Mứt vỏ quýt'
go
drop trigger trg_checkloai
--
------------
----------------------------
--------------------------------------
-----------------------------------------------
--PHẦN CURSOR-------------------------------
go
alter table chitietsanpham
add Ma_Tung_SP char(20)
go
--Câu 1.Viết cursor cập nhật mới mã từng loại sản phẩm
--MÃ mới = Tên loại sản phẩm + Mã nguyên liệu
go
declare cs_matungloai cursor
for
	select MALOAISP,MANL
	from CHITIETSANPHAM
for update of maloaisp,manl
open cs_matungloai
declare @maloaisp varchar(10),@manguyenlieu varchar(10)
fetch next from cs_matungloai into @maloaisp ,@manguyenlieu
while(@@FETCH_STATUS=0)
begin
	update CHITIETSANPHAM
	set Ma_Tung_SP=@maloaisp+@manguyenlieu
	where maloaisp =@maloaisp and manl=@manguyenlieu
	fetch next from cs_matungloai into @maloaisp ,@manguyenlieu
end
close cs_matungloai
deallocate cs_matungloai
go
select ma_tung_sp from chitietsanpham
--Cập nhật tên phòng ban thứ 6 thành Phòng công nghệ
go
declare cs_update_namepb cursor scroll
for
	select maph
	from PHONGBAN
for update of maph,tenph
open cs_update_namepb
declare @maph varchar(10),@tenphong nvarchar(50)
set @tenphong=N'Phòng Công nghệ'
fetch absolute 6 from cs_update_namepb into @maph
if(@@FETCH_STATUS=0)
begin
	update PHONGBAN
	set TENPH=@tenphong
	where MAPH=@maph
end
close cs_update_namepb
deallocate cs_update_namepb
go
select * from PHONGBAN
go
--Câu 3.Viết Cursor in ra danh sách nhà cung cấp nguyên liệu
go
declare cs_print_ncc cursor dynamic
for
	select MANCC,TENNHACC,DIACHINCC,QUOCGIA
	from NHACUNGCAPNL
for update of MANCC,TENNHACC,DIACHINCC,QUOCGIA
open cs_print_ncc
declare @mancc char(10),@tennhacc nvarchar(50),@diachi nvarchar(50),@quocgia nvarchar(50)
fetch next from cs_print_ncc into @mancc,@tennhacc ,@diachi,@quocgia
while(@@FETCH_STATUS=0)
begin
	print @mancc + @tennhacc+'  '+@diachi+@quocgia
	fetch next from cs_print_ncc into @mancc,@tennhacc ,@diachi,@quocgia
end
close cs_print_ncc
deallocate cs_print_ncc
go
create table Quanlynguyenlieu
(	
	manl char(4) not null,
	soluongda_sudung int,
	tongsoluong int,
	tinhtrang_nhap nvarchar(50),
	tinhtrang_Nguyenlieu nvarchar(50)
)
go
alter table quanlynguyenlieu
add constraint pk primary key (manl)
delete from Quanlynguyenlieu
alter table quanlynguyenlieu
add constraint fk_qlnl_manl foreign key(manl) references nguyenlieu(manl)
go
declare cs_update_manl cursor
for
	select  manl
	from NGUYENLIEU
for update of manl
open cs_update_manl
declare @manl varchar(10)
fetch next from cs_update_manl into @manl
while(@@FETCH_STATUS=0)
begin
	insert into Quanlynguyenlieu
	values (@manl,null,null,null,null)
	fetch next from cs_update_manl into @manl
end
close cs_update_manl
deallocate cs_update_manl
go
--Cập nhật tổng số lượng =tổng Số lượng của từng loại nguyên liệu nhập vào
declare cs_update_tongsoluongnl cursor
for
	select  manl
	from NGUYENLIEU
for update of manl
open cs_update_tongsoluongnl
declare @manl varchar(10),@tongsoluongnl int
fetch next from cs_update_tongsoluongnl into @manl
while(@@FETCH_STATUS=0)
begin
	set @tongsoluongnl=(select sum(soluong) from CHITIETPN where manl=@manl group by MANL)
	update Quanlynguyenlieu
	set tongsoluong=@tongsoluongnl
	where manl=@manl
	fetch next from cs_update_tongsoluongnl into @manl
end
close cs_update_tongsoluongnl
deallocate cs_update_tongsoluongnl
go

select MANL,sum(soluong) from CHITIETPN group by MANL
--Câu 5.Viết Curor cộng cho nguyên liệu 3 số lượng 50
go
declare cs_insert_manl cursor scroll
for
	select manl 
	from Quanlynguyenlieu
for update of manl
open cs_insert_manl
declare @manl varchar(10)
fetch absolute 3 from cs_insert_manl into @manl
if(@@FETCH_STATUS=0)
begin
	update Quanlynguyenlieu
	set tongsoluong=+10
	where manl=@manl
end
close cs_insert_manl
deallocate cs_insert_manl
go
select * from Quanlynguyenlieu where manl='nl07'
select * from Quanlynguyenlieu
go
select round( RAND()*100,0)
--Câu 6
--Viết cursor tạo ngẫu nhiên cơ số cho số lượng đã dùng
--Đồn thời số lượng đã dùng phải nhỏ hơn hoặc bằng tổng lượng tối đa
go
declare cs_capnhat_sldadung cursor
for
	select manl
	from Quanlynguyenlieu
for update of manl
open cs_capnhat_sldadung
declare @manl varchar(10),@rand int,@number int,@rand1 int
set @number=0
fetch next from cs_capnhat_sldadung into @manl
while(@@FETCH_STATUS=0)
begin
	set @rand=(select round( RAND()*100,0))

	if(@rand<=(select tongsoluong from Quanlynguyenlieu where manl=@manl))
		begin
			update Quanlynguyenlieu
			set soluongda_sudung=@rand
			where manl=@manl
			fetch next from cs_capnhat_sldadung into @manl
		end
	else
		begin
			while(@number<5)
			set @rand1=(select round( RAND()*100,0))
			begin				
				if(@rand1<=(select tongsoluong from Quanlynguyenlieu where manl=@manl))
					begin
						update Quanlynguyenlieu
						set soluongda_sudung=@rand1
						where manl=@manl
						fetch next from cs_capnhat_sldadung into @manl
						break;
					end
				else
					begin
						set @number=@number+1;
						continue;
					end
			end
		end
end
close cs_capnhat_sldadung
deallocate cs_capnhat_sldadung
go
--KHUYẾN NGHỊ NÊN CHẠY TRÊN MÁY MẠNH 
--VỚI CÁC DÒNG MÁY RAM TỪ 4GB TRỞ LẠI KO CÓ SSD SẼ XỬ LÝ CỰC KỲ CHẬM 
--Câu 7.Viết Cursor cập nhật tình trạng nhập trong bảng quanlynguyenlieu
--Nếu số lượng đã sử dung lớn hơn 10 thì set :Không cần nhập và ngược lại 'Cần nhập'
go
declare cs_update_status_in cursor
for
	select manl,soluongda_sudung,tongsoluong
	from Quanlynguyenlieu
for update of manl
open cs_update_status_in 
declare @manl varchar(10),@sl_sudung int ,@slmax int
fetch next from cs_update_status_in into @manl,@sl_sudung,@slmax
while(@@FETCH_STATUS=0)
begin
	if(@sl_sudung>10)
		begin
			update Quanlynguyenlieu
			set tinhtrang_nhap=N'Không cần nhập'
			where manl=@manl
			fetch next from cs_update_status_in into @manl,@sl_sudung,@slmax
		end
	else
			update Quanlynguyenlieu
			set tinhtrang_nhap=N'Cần nhập'
			where manl=@manl
			fetch next from cs_update_status_in into @manl,@sl_sudung,@slmax
end
close cs_update_status_in
deallocate cs_update_status_in
go 
select * from quanlynguyenlieu
go
--Câu8.Viết Cursor kết hợp hàm trả về số ca đăng kí của nhân viên bất kì nhập vào
go
create function fc_relative_to_cursor(@manv varchar(10))
returns int
as
begin
	declare cs_count_manv cursor
	for
		select manv
		from lichlamviec 
	for update of manv
	open cs_count_manv
	declare @maofnv varchar(10),@tongsl int 
	fetch next from cs_count_manv into @maofnv
	while(@@FETCH_STATUS=0)
	begin
		if(@maofnv=@manv)
			begin
				set @tongsl=(select count(*) from lichlamviec where manv=@manv)
				fetch next from cs_count_manv into @maofnv
			end
		else
			fetch next from cs_count_manv into @maofnv
	end
	close cs_count_manv
	deallocate cs_count_manv
	return @tongsl
end
go
declare @soluong int
set @soluong=dbo.fc_relative_to_cursor('nv001')
print N'Tổng số ca mà nhân viên này đăng ký là : ' +convert(char(10),@soluong)
go
--Câu 9.Viết thủ tục kết hợp cusor cập nhật sỉ số nhân viên các phòng ban
create proc proc_update_siso_cursor
as
begin
	declare cs_update_siso_pr cursor
	for
		select maph
		from NHANVIEN
	for update of maph
	open cs_update_siso_pr
	declare @maph varchar(10)
	fetch next from cs_update_siso_pr into @maph
	while(@@FETCH_STATUS=0)
	begin
		update PHONGBAN
		set siso=0
		where MAPH=@maph
		fetch next from cs_update_siso_pr into @maph
	end
	close cs_update_siso_pr
	deallocate cs_update_siso_pr
end
go
exec proc_update_siso_cursor
SELECT * FROM PHONGBAN
drop proc proc_update_siso_cursor
go
--Câu 10 .Viết cursor kết hợp thủ tục cộng cho số lượng nhập vào trên chi tiết phiếu nhập thhêm 10
--Nhập từ vị trí dưới cùng lên 5
create proc proc_cs_update
as
begin
	declare @vitri int ,@dem int
	set @dem=(select count(*) from CHITIETPN)
	set @vitri=@dem-5
	declare cs_congthem_proc cursor scroll
	for
		select mapn,manl
		from chitietpn
	for	update of mapn
	open cs_congthem_proc 
	declare @mapn varchar(10) ,@manl varchar(10)
	fetch absolute @vitri from cs_congthem_proc into @mapn ,@manl
	if(@@FETCH_STATUS=0)
	begin
		update CHITIETPN
		set SOLUONG=SOLUONG+10
		where MAPN=@mapn and MANL=@manl
	end
	close cs_congthem_proc
	deallocate cs_congthem_proc
end
go
exec proc_cs_update

--Phần ứng dụng thực tế java:
create table NguoiDung--1
(
	ND_ID int not null,
	tendangnhap varchar(20) not null,
	matkhau varchar(45),
	hoten nvarchar(50),
	email varchar(60),
	diachi nvarchar(60),
	namsinh int,
	gioitinh nchar(5)
	primary key(ND_ID)
)

insert into NguoiDung
values
('1','duchuu','123',N'Nguyễn Hữu Đức','kidkender@gmail.com',N'Bình Chánh TP.Hồ Chí Minh','2001',N'Nam')
go
select * from nguyenlieu where manl='nl01'
select * from nguoidung
--where tendangnhap='vietnam123' and matkhau='123'
insert into NguoiDung
values
('2','nguyenvana','123',N'Nguyễn Văn A','a@gmail.com',N'Tam Kỳ Tỉnh Quảng Nam','2001',N'Nam')
go
update nguoidung
set matkhau='456'
where ND_ID='1'
SELECT * FROM NGUYENLIEU WHERE TENNGUYENLIEU='táo'
go
create table lichsudangnhap--1
(
	tendangnhap varchar(20) not null,
	matkhau varchar(45),
	hoten nvarchar(50),
	email varchar(60),
	diachi nvarchar(60),
	namsinh int,
	gioitinh nchar(5)
	primary key(tendangnhap)
)
go
insert into lichsudangnhap
Select tendangnhap,matkhau,hoten,email,diachi,namsinh,gioitinh
from NguoiDung
where tendangnhap ='%s'
go
select * from lichsudangnhap
delete from lichsudangnhap where tendangnhap='nguyenvana'
delete  from lichsudangnhap
go
--Tiến hành full back up lần đầu
Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_fullbackup.bak'
go
INSERT INTO NHACUNGCAPNL
VALUES
('NCC10',N'Gucci' ,'Thanh Xuan Ha Noi',N'Germany'),
('NCC11',N'Chanel' ,'Quan 4 ,TP HCM',N'Ukraina')
go
--Diff lần 1
Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff1.bak'  with differential
go
Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_fullbackup.bak'
--Tiến hành sao lưu trn
USE [master] ;  
ALTER DATABASE [QL_CTSXBanhkeo_Duc] SET RECOVERY FULL ;
Select * from nguyenlieu
Backup log QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_trn_lan1.trn'
go
--Thử xóa toàn bộ DB
use master
drop database QL_CTSXBanhkeo_Duc
go
--Bắt đầu phục hồi từ file full
restore database QL_CTSXBanhkeo_Duc from disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_fullbackup.bak' with norecovery
Restore database QL_CTSXBanhkeo_Duc from disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff1.bak' with norecovery
Restore log qlbh_backup from disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_trn_lan1.trn' with recovery
--Nên phục sao lưu định kỳ dữ liệu vào các ngày cố định hàng tuần hoặc có thể sao lưu
--ngay sau khi đã làm việc với cơ sở dữ liệu
--Hiện tại dữ liệu sao lưu vào ngày 9/8/2021 sẽ sao lưu với file diff2
Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff1.bak'  with differential
--Có thể sao lưu file diff thành nhiều file khác nhau sau khi đã full backup lần đầu .
--Hoàn toàn có thể sao lưu trọn vẹn duy nhất 1 sao lưu với file diff1
--Khi cài đặt khuyến nghị sao lưu ngay sau khi tạo các bảng và nhập liệu hoàn tất nhằm đảm bảo
--tính toàn vẹn của dữ liệu
--Sau đó khi đến các truy vấn function ,cursor nhập xuất dữ liệu sẽ sao lưu thành các file difference
go
--Lịch sao lưu định kỳ
--Thứ 3 5 7 sao lưu lúc 20h
Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff2.bak'  with differential
--Đồng thời sao lưu ngay sau khi làm việc với Database
--Lưu ý chỉ nên sao lưu duy nhất 1 file diff để tránh gây nhầm lẫn
-----------Thứ 2-----------Thứ 3-------Thứ 4--------Thứ 5---------Thứ 6---------Thứ 7--------Chủ Nhật---------
------
------   Sao lưu trn-----------------Sao lưu trn----------------Sao lưu trn-----------------Sao lưu trn-------
------
--20h--Sao lưu full-----Sao lưu diff-------------Sao lưu diff----------------Sao lưu diff--------Sao lưu------
------
------
Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff1.bak'  with differential
------
-----
-----
go
--Cấp quyền (Permission)
--Tạo tài khoản login
use master
--Cách 1
sp_addlogin 'taikhoan1' ,'123','QL_CTSXBanhkeo_Duc'
--Cách 2
create login taikhoan2
with password='123',
default_database=QL_CTSXBanhkeo_Duc
--Xóa tài khoản
--Cách 1
sp_droplogin 'taikhoan1'
--Cách 2
drop login taikhoan2
--Tạo tài khoản người dùng 
create login taikhoan1
with password='123',
default_database=QL_CTSXBanhkeo_Duc
go
create login taikhoan2
with password='123',
default_database=QL_CTSXBanhkeo_Duc
go
create login taikhoan3
with password='123',
default_database=QL_CTSXBanhkeo_Duc
go
--Cách 1
sp_grantdbaccess 'taikhoan1',N'Nguyễn Lê Văn Một'
go
--Cách 2
sp_adduser 'taikhoan2',N'Lê Đinh Nhật Hai'
go
--Cách 3
create user NamecuaUser3
for login taikhoan3
go
--Xóa User
--Cách 1
sp_dropuser NamecuaUser3
sp_dropuser N'Lê Đinh Nhật Hai'
sp_dropuser N'Nguyễn Lê Văn Một'
go
 --Để xem các fixed server roles
sp_helpsrvrole
-- Để xem chi tiết quyền của mỗi role
sp_srvrolepermission
--Cấp quyền tạo Database,chỉnh sửa Database xóa DB cho taikhoan1
sp_addlogin 'taikhoan1' ,'123'
go
 sp_addsrvrolemember taikhoan1, dbcreator
 go
 --Cấp quyền quản lý đăng nhập cho tài khoan2
 sp_addsrvrolemember taikhoan2,securityadmin
 go
 --Để xem các fixed database role:
sp_helpdbfixedrole
go
--Để xem các quyền của mỗi fixed database role:
sp_dbfixedrolepermission
go
--Gán người dùng 3 
sp_addlogin 'taikhoan3' ,'123'
sp_addrolemember 'database role' ,taikhoan3
go
sp_addlogin 'taikhoana' ,'123'
create user NameNVA
for login taikhoana
--Phân nhóm quyền
--Khởi tạo nhóm quyền
sp_addrole 'BophanNhapHang' 
--Phân quyền cho bộ phân nhập hàng là delete,update,insert
grant delete,update,insert on PhieuNhap to BophanNhapHang
--Chặn quyền xem của nhóm quyền bộ phận nhập hàng
deny select on phieunhap to bophannhaphang
--Thu hồi quyền của nhóm quyền
revoke all on phieunhap to bophannhaphang
--Thêm Tài khoản nhân viên A vào Bộ phận nhập hàng
sp_addrolemember 'Bophannhaphang','NameNVA'
--Xóa user ra khỏi nhóm quyền
sp_droprolemember 'Bophannhaphang','NameNVA'
--Xóa nhóm quyền
sp_droprole bophannhaphang

go
--Sao lưu lại những gì làm được
Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff1.bak'  with differential
--Cấp quyền xem cho tài khoản b và chặn quyền xóa sửa
sp_addlogin 'taikhoanb' ,'123'
sp_adduser 'taikhoanb','NameUserB'
grant select on nhanvien  to NameUserB
deny delete,update on nhanvien to NameUserB
--Thu hồi quyền 
revoke all on nhanvien to NameUserB
--Cấp quyền xem cho tài khoản c chuyển tiếp quyền xem cho tài khoản d
sp_addlogin 'taikhoanc' ,'123'
sp_adduser 'taikhoanc','NameUserC'
sp_addlogin 'taikhoand' ,'123'
sp_adduser 'taikhoand','NameUserD'
--Cấp quyền
grant select on nhanvien to NameUserC with grant option
grant select on nhanvien to NameUserD
--Thu hồi quyền
revoke select on nhanvien to NameUserC 
--Cấp quyền restore cho tài khoản restore1
sp_addlogin 'restore1' ,'123'
sp_adduser 'restore1','PhucHoi'
sp_addsrvrolemember restore1,dbcreator
sp_droplogin 'restore1'
sp_addsrvrolemember 'restore1', db_backupoperator 

sp_addrole 'test'
sp_addsrvrolemember restore1,db_backupOperator
--Succelly
sp_addrolemember 'db_backupOperator',Phuchoi
--Tạo tài khoản duchuu trao quyền sysadmin nhằm truy cập client java
sp_addlogin 'duchuu' ,'123'
sp_adduser 'duchuu','DuchuuSyS'
sp_addrole 'TruyCapTruyXuat'
 sp_addsrvrolemember duchuu ,sysadmin
 --Sao lưu lần cuối 
 Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff1.bak'  with differential
 --Cấp quyền lại cho Duchuu
 sp_addlogin 'duchuu','123' ,'QL_CTSXBanhkeo_Duc'
 sp_adduser 'Duchuu',N'Đức_nè'
 sp_addrolemember 'db_datareader' ,N'Đức_nè'
 sp_addrolemember 'db_DataWriter',N'Đức_nè'
 sp_dropuser N'Đức_Nè'
 sp_droplogin 'duchuu'
 select * from nhanvien
 select * from nguyenlieu
  Backup database QL_CTSXBanhkeo_Duc to disk ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\qlbk_backup_diff1.bak'  with differential