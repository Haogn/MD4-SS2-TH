create database nhacungcap_nvl;
use nhacungcap_nvl;
create table nhacungcap(
    id_ncc int not null auto_increment primary key ,
    ten_ncc varchar(50),
    phone_ncc varchar(10),
    diachi_ncc varchar(100)
);

create table dondathanh (
    so_DH int not null primary key auto_increment,
    ngaydat datetime,
    id_ncc int ,
    foreign key (id_ncc) references nhacungcap(id_ncc)
);

create table vattu (
    ma_vattu int auto_increment primary key ,
    ten_vattu varchar(50)
);

create table phieu_xuat(
    so_PX int auto_increment primary key ,
    ngayxuat datetime
);

create table phieu_nhap(
    so_PN int auto_increment primary key ,
    ngaynhap datetime
);

create table phieunhap_vatlieu (
    ma_vatlieu int ,
    so_PN int ,
    DG_Nhap float,
    SL_Nhap int ,
    primary key (ma_vatlieu , so_PN),
    foreign key (ma_vatlieu) references nhacungcap(id_ncc),
    foreign key (so_PN) references phieu_nhap(so_PN)
) ;

create table phieuxuat_vatlieu(
    ma_vattu int ,
    so_PX int ,
    DG_Xuat float,
    SL_xuat int ,
    primary key (ma_vattu, so_PX),
    foreign key (ma_vattu) references vattu(ma_vattu),
    foreign key (so_PX) references phieu_xuat(so_PX)
) ;

create table donhang_vattu (
    so_DH int ,
    ma_VT int ,
    primary key (so_DH, ma_VT),
    foreign key (so_DH) references dondathanh(so_DH),
    foreign key (ma_VT) references vattu(ma_vattu)
);


