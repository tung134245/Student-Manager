create table sinh_vien_tinh_nguyen.dia_chi (
	idDia_chi int primary key,
    huyen varchar(20),
    tinh varchar(20)
);

create table  sinh_vien_tinh_nguyen.thanh_vien(
	idThanh_vien int primary key,
    ho varchar(20) not null,
    ten varchar(20) not null,
    gioi_tinh varchar(10),
    ngay_sinh date,
    idDia_chi int,
    email varchar(45) default "N/A",
    sdt varchar(20) default "N/A",
    cpa decimal(3,2),
    vien varchar(30),
    so_thich varchar(45),
    foreign key(idDia_chi) references dia_chi(idDia_chi)
);

create table  sinh_vien_tinh_nguyen.mang(
	idMang int primary key,
    ten_mang varchar(20),
    idMang_truong int,
    foreign key(idMang_truong) references thanh_vien(idThanh_vien)
);

create table sinh_vien_tinh_nguyen.hoat_dong(
	idHoat_dong int primary key,
    ten_hoat_dong varchar(45),
    dia_diem varchar(45),
    ngay date,
    idNguoi_phu_trach int,
    foreign key(idNguoi_phu_trach) references thanh_vien(idThanh_vien)
);

create table sinh_vien_tinh_nguyen.thanh_vien_hoat_dong(
	idThanh_vien int,
    idHoat_dong int,
    y_thuc varchar(20),
    foreign key(idThanh_vien) references thanh_vien(idThanh_vien),
    foreign key(idHoat_dong) references hoat_dong(idHoat_dong)
);

create table sinh_vien_tinh_nguyen.thanh_vien_mang(
	idThanh_vien int, 
    idMang int,
    chuyen_mon varchar(20),
    foreign key(idThanh_vien) references thanh_vien(idThanh_vien),
    foreign key(idMang) references mang(idMang)
);