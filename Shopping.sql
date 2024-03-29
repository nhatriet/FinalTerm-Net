﻿create database Shopping

use Shopping
go

create table [About] (
	[about_id] int not null,
	[about_title] nvarchar(255),
	[about_sub] text,
	[about_topic] nvarchar(255),
	[about_img] nvarchar(64),
	[about_name] nvarchar(255)
	constraint pk_about primary key (about_id)
)
go

create table [Event] (
	[event_id] int not null,
	[event_name] nvarchar(255),
	[event_topic] nvarchar(255),
	[event_img] nvarchar(64),
	[list_product_id] nvarchar(255),
	constraint pk_event primary key (event_id)
)
go

create table [Contact] (
	[contact_id] int not null,
	[address] nvarchar(255),
	[phone] nvarchar(64),
	[email] nvarchar(64)
	constraint pk_contact primary key (contact_id)
)
go

create table [Role] (
	[role_id] int not null,
	[role_name] nvarchar(50),
	constraint pk_role primary key (role_id)
)
go

create table [Account] (
	[account_id] int not null,
	[username] nvarchar(50) not null unique,
	[password] nvarchar(50) not null,
	[role_id] int not null,
	[verification_code] nvarchar(255),
	[reset_passcode] nvarchar(255),
	constraint pk_account primary key (account_id)
)
go

create table [Category] (
	[category_id] int not null,
	[category_name] nvarchar(255), 
	[category_img] nvarchar(255), 
	constraint pk_category primary key (category_id)
)
go

create table [Customer] (
	[customer_id] int not null,
	[account_id] int not null,
	[first_name] nvarchar(255),
	[last_name] nvarchar(255),
	[birthday] date,
	[email] nvarchar(255),
	[phone] nvarchar(255),
	[address] nvarchar(255),
	constraint pk_customer primary key (customer_id)
)
go

create table [Employee] (
	[employee_id] int not null,
	[account_id] int not null,
	[first_name] nvarchar(255),
	[last_name] nvarchar(255),
	[birthday] date,
	[email] nvarchar(255),
	[phone] nvarchar(255),
	[address] nvarchar(255),
	constraint pk_employee primary key (employee_id)
)
go

create table [Product] (
	[product_id] int not null,
	[category_id] int not null,
	[product_name] nvarchar(255) not null,
	[product_img_preview] nvarchar(64),
	[short_description] text,
	[description] text,
	[quantity] int,
	[price_preview] float,
	[weight] float,
	[dimensions] nvarchar(64),
	[materials] nvarchar(64),
	constraint pk_product primary key (product_id)
)
go

create table [ProductImage] (
	[productimg_id] int not null,
	[product_id] int not null,
	[productimg_url] nvarchar(64),
	constraint pk_productimg primary key (productimg_id)
)
go

create table [Order] (
	[order_id] int not null,
	[customer_id] int not null,
	[first_name] nvarchar(255),
	[last_name] nvarchar(255),
	[phone] nvarchar(255),
	[address] nvarchar(255),
	[total] float not null,
	[payment] nvarchar(255),
	constraint pk_order primary key (order_id)
)
go

create table [ProductOrder] (
	[productorder_id] int not null,
	[order_id] int not null,
	[product_id] int not null,
	[quantity] int,
	[price] float not null,
	constraint pk_productorder primary key (productorder_id)
)
go

create table [Size] (
	[size_id] int not null,
	[size_name] nvarchar(255),
	constraint pk_size primary key (size_id)
)
go

create table [ProductSize] (
	[productsize_id] int not null,
	[product_id] int not null,
	[size_id] int not null,
	[quantity] int,
	[price] float not null,
	constraint pk_productsize primary key (productsize_id)
)
go

-- alter table =========================================================================
alter table [Account] add
	constraint fk_Acc foreign key (role_id) references [Role](role_id)
go

alter table [Customer] add
	constraint fk_Cus foreign key (account_id) references [Account](account_id)
go

alter table [Employee] add
	constraint fk_Emp foreign key (account_id) references [Account](account_id)
go

alter table [Product] add
	constraint fk_Prod foreign key (category_id) references [Category](category_id)
go

alter table [ProductImage] add
	constraint fk_ProImage foreign key (product_id) references [Product](product_id)
go

alter table [Order] add
	constraint fk_Order foreign key (customer_id) references [Customer](customer_id)
go

alter table [ProductOrder] add
	constraint fk_ProdO foreign key (order_id) references [Order](order_id),
	constraint fk_ProdOrder foreign key (product_id) references [Product](product_id)
go

alter table [ProductSize] add
	constraint fk_ProdSize foreign key (product_id) references [Product](product_id)
go

-- insert into =========================================================================
insert into [About] values
	('1', 'Our Mission', 'Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.', 'Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they do not really do it, they just saw something. It seemed obvious to them after a while.', '/images/about-02.jpg', 'Steve Job'),
	('2', 'Our Mission', 'Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.', 'Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they do not really do it, they just saw something. It seemed obvious to them after a while.', '/images/about-03.jpg', 'Steve Job')
go

insert into [Event] values
	(1, 'Women', 'Spring 2024','/images/banner-01.jpg', '1,2,3,4'),
	(2, 'Sale 10%', 'For Christmas','/images/banner-02.jpg', '5,6,7,8,9,10,11,12'),
	(3, 'HOT!', 'New Trend','/images/banner-03.jpg', '9,10,11'),
	(4, 'Men', 'Spring 2024','/images/banner-04.jpg', '5,6,7,8')
go

insert into [Contact] values
	(1, N'280 An Duong Vuong, Ward 4, District 5, Ho Chi Minh City', '+84 111 111 999', 'euphoria@gmail.com')
go

insert into [Role] values
	(1, 'admin'),
	(2, 'user')
go

insert into [Account] values
	(1, 'ad_nhatriet', '123456', '1', '', ''),
	(2, 'ad_ngoctran', '123456', '1', '', ''),
	(3, 'test', '123456', '2', '', ''),
	(4, 'ad_thienan', '123456', '1', '', ''),
	(5, 'ad_anhdang', '123456', '1', '', ''),
	(6, 'ad_thuhang', '123456', '1', '', ''),
	(7, 'user_dnnt', '123456', '2', '', ''),
	(8, 'user123', '123456', '2', '', '')
go

insert into [Category] values
	(1, 'Jacket', '../images/categories/cat-1.jpg'),
	(2, 'Sweater', '../images/categories/cat-2.jpg'),
	(3, 'Men_T-Shirt', '../images/categories/cat-3.jpg'),
	(4, 'Men_Jeans', '../images/categories/cat-4.jpg'),
	(5, 'Women_Jeans', '../images/categories/cat-5.jpg'),
	(6, 'Women_Croptop', '../images/categories/cat-6.jpg')
go

insert into [Customer] values
	(1, 7, N'Đoàn Ngọc Nhã', N'Triết', '2003-12-24', 'nhatriet2311@gmail.com', '0797278779', N'Âu Cơ'),
	(2, 2, N'Nguyễn Ngọc', N'Trân', '2003-12-24', 'ngoctran@gmail.com', '01234598761', N'Trường Sa'),
	(3, 3, N'Thiên', N'Nhi', '2003-12-24', 'nhi123@gmail.com', '0123456723', N'Bình Tân'),
	(4, 4, N'Bùi Tá Thiên', N'Ấn', '2003-12-24', 'thienan@gmail.com', '09173517489', N'Tân Bình'),
	(5, 5, N'Lai Thị Ánh', N'Đăng', '2003-12-24', 'anhdang@gmail.com', '09873561278', N'Quận 12'),
	(6, 6, N'Nguyễn Thị Thu', N'Hằng', '2003-12-24', 'thuhang@gmail.com', '0835482418', N'Quận 5'),
	(7, 1, N'Nhã', N'Triết', '2003-12-24', 'ntriet@gmail.com', '012345678', N'Tân Phú'),
	(8, 8, N'Ngọc', N'Trân', '2003-12-24', 'ntran@gmail.com', '09999999', N'Tân Bình')
go 

insert into [Employee] values
	(1, 1, N'Đoàn Ngọc Nhã', N'Triết', null, 'nhatriet2311@gmail.com', null, null),
	(2, 7, N'Nhã', N'Triết', null, 'admin@gmail.com', null, null)
go

insert into [Product] values
	(1, 1, 'White Slyteam Jacket', '/images/product/1/White-Slyteam-Jacket-Front-1000x1250.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 50, 220000, 79, '110 x 33 x 100 cm', 'Micro'),
	(2, 1, 'Black Slyteam Jacket', '/images/product/2/Black-Slyteam-Jacket-Back-1000x1250.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 90, 300000, 69, '110 x 33 x 100 cm', 'Micro'),
	(3, 1, 'Doncare Prom Jacket', '/images/product/3/doncare-PROM-COLLAGE-JACKET-01.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 30, 450000, 99, '95 x 35 x 100 cm', '60% cotton'),
	
	(4, 2, 'Sweater Champion White', '/images/product/4/EE1A0D20-A1E4-4A8D-A532-840BB9D6DFF0.png', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 25, 450000, 79, '110 x 33 x 100 cm', '60% cotton'),
	(5, 2, 'Sweater Champion Red', '/images/product/5/83FD173B-87AC-4087-92C1-8E8F0AF0242A.png', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 50, 500000, 79, '110 x 33 x 100 cm', '80% cotton'),
	(6, 2, 'Sweater Champion Black', '/images/product/6/3ce9e4f9462ca1a80f9bae7462d2a591.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 70, 480000, 79, '110 x 33 x 100 cm', '90% cotton'),

	(7, 3, 'T-shirt Skate', '/images/product/7/161682917869c354f27b7fc10c9eafec.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 30, 300000, 79, '110 x 33 x 100 cm', 'Micro'),
	(8, 3, 'Re:values', '/images/product/8/4fdbae083275462f9a67224b74ff65ff.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 100, 320000, 79, '110 x 33 x 100 cm', 'Micro'),
	(9, 3, 'Trust In Our Lord', '/images/product/9/Layer-1.png', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 90, 380000, 79, '110 x 33 x 100 cm', 'Micro'),

	(10, 4, 'H&M Pants', '/images/product/10/hmgoepprod.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 40, 550000, 79, '110 x 33 x 100 cm', 'Micro'),
	(11, 4, 'Dark Jeans for Men', '/images/product/11/0052041802_1_1_1.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 80, 580000, 79, '110 x 33 x 100 cm', 'Micro'),
	(12, 4, 'Brown Jeans', '/images/product/12/3349484c7665963da157549482999e2e.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 200, 500000, 79, '110 x 33 x 100 cm', 'Micro'),
	
	(13, 5, 'Jeans New Trendy', '/images/product/13/2cb8fba5b7af8b2f937f46dc732738b6.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 30, 480000, 79, '110 x 33 x 100 cm', 'Micro'),
	(14, 5, 'Jeans Star Fire', '/images/product/14/619f250fa706ba5d84534515c4d02659.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 150, 580000, 79, '110 x 33 x 100 cm', 'Micro'),
	(15, 5, 'Jeans 2023SS Girls', '/images/product/15/c8d59bbc2249a50b8db92e2c2cbc137f.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 85, 600000, 79, '110 x 33 x 100 cm', 'Micro'),
	
	(16, 6, 'Heaven Sent Cropped top', '/images/product/16/d45d5314e64cb425f9489b1300bfa472.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 99, 150000, 79, '70 x 33 x 100 cm', '70% cotton'),
	(17, 6, 'Blue Cropped top', '/images/product/17/a7c2edd53365a95455113e9745f133aa.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 30, 220000, 79, '700 x 33 x 100 cm', '50% cotton'),
	(18, 6, 'Brown Cropped top', '/images/product/18/061148dfa1fb2ba3b777de1c5140859e.jpg', 'Nulla eget sem vitae eros pharetra viverra. Mauris consequat ornare feugiat', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 20, 180000, 79, '700 x 33 x 100 cm', '75% cotton')
go

insert into [ProductImage] values
	(1, 1,'/images/product/1/White-Slyteam-Jacket-Front-1000x1250.jpg'),
	(2, 2, '/images/product/2/Black-Slyteam-Jacket-Back-1000x1250.jpg'),
	(3, 3, '/images/product/3/doncare-PROM-COLLAGE-JACKET-01.jpg'),
	(4, 4, '/images/product/4/EE1A0D20-A1E4-4A8D-A532-840BB9D6DFF0.png'), 
	(5, 5, '/images/product/5/83FD173B-87AC-4087-92C1-8E8F0AF0242A.png'), 
	(6, 6, '/images/product/6/3ce9e4f9462ca1a80f9bae7462d2a591.jpg'), 
	(7, 7, '/images/product/7/161682917869c354f27b7fc10c9eafec.jpg'), 
	(8, 8, '/images/product/8/4fdbae083275462f9a67224b74ff65ff.jpg'), 
	(9, 9, '/images/product/9/Layer-1.png'), 
	(10, 10, '/images/product/10/hmgoepprod.jpg'), 
	(11, 11, '/images/product/11/0052041802_1_1_1.jpg'), 
	(12, 12, '/images/product/12/3349484c7665963da157549482999e2e.jpg'), 
	(13, 13, '/images/product/13/2cb8fba5b7af8b2f937f46dc732738b6.jpg'), 
	(14, 14, '/images/product/14/619f250fa706ba5d84534515c4d02659.jpg'), 
	(15, 15, '/images/product/15/c8d59bbc2249a50b8db92e2c2cbc137f.jpg'), 
	(16, 16, '/images/product/16/d45d5314e64cb425f9489b1300bfa472.jpg'), 
	(17, 17, '/images/product/17/a7c2edd53365a95455113e9745f133aa.jpg'), 
	(18, 18, '/images/product/18/061148dfa1fb2ba3b777de1c5140859e.jpg')
go

insert into [Order] values
	(1, 7, N'Nhã', N'Triết', '0797278779', N'Tân Phú', 220000, '')
go

insert into [ProductOrder] values
	(1, 1, 1, 1, 220000)
go 

insert into [Size] values
	(1, 'Size S'),
	(2, 'Size M'),
	(3, 'Size L'),
	(4, 'Size XL'),
	(5, 'Oversize')
go 

insert into [ProductSize] values
	(1, 1, 1, 20, 220000),
	(2, 1, 2, 10, 220000),
	(3, 1, 3, 20, 220000),
	(4, 1, 4, 0, 0),

	(5, 2, 1, 10, 300000),
	(6, 2, 2, 50, 300000),
	(7, 2, 3, 10, 300000),
	(8, 2, 4, 20, 300000),

	(9, 3, 1, 0, 0),
	(10, 3, 2, 10, 450000),
	(11, 3, 3, 10, 450000),
	(12, 3, 4, 10, 450000),

	(13, 4, 5, 25, 450000),
	(14, 5, 5, 50, 500000),
	(15, 6, 5, 70, 480000),

	(16, 7, 1, 10, 300000),
	(17, 7, 2, 10, 300000),
	(18, 7, 3, 10, 300000),
	(19, 7, 4, 0, 0),

	(20, 8, 1, 10, 320000),
	(21, 8, 2, 10, 320000),
	(22, 8, 3, 10, 320000),
	(23, 8, 4, 0, 0),

	(24, 9, 1, 10, 380000),
	(25, 9, 2, 10, 380000),
	(26, 9, 3, 20, 380000),
	(27, 9, 4, 50, 380000),

	(28, 10, 1, 10, 500000),
	(29, 10, 2, 10, 500000),
	(30, 10, 3, 10, 500000),
	(31, 10, 4, 10, 500000),

	(32, 11, 1, 20, 580000),
	(33, 11, 2, 20, 580000),
	(34, 11, 3, 20, 580000),
	(35, 11, 4, 20, 580000),

	(36, 12, 1, 50, 500000),
	(37, 12, 2, 50, 500000),
	(38, 12, 3, 50, 500000),
	(39, 12, 4, 50, 500000),

	(40, 13, 1, 10, 500000),
	(41, 13, 2, 10, 500000),
	(42, 13, 3, 10, 480000),
	(43, 13, 4, 0, 0),

	(44, 14, 1, 0, 0),
	(45, 14, 2, 50, 580000),
	(46, 14, 3, 50, 580000),
	(47, 14, 4, 50, 580000),

	(48, 15, 1, 20, 600000),
	(49, 15, 2, 25, 600000),
	(50, 15, 3, 20, 600000),
	(51, 15, 4, 20, 600000),

	(52, 16, 5, 99, 150000),
	(53, 17, 5, 30, 220000),
	(54, 18, 5, 20, 180000)
go 



-- ================================================================================================================================================================
-- Jacket (1) has 3 items 
		-- quantity:	50,			 90,		 30
		-- price:	220.000,	300.000,	450.000	

-- Sweater (2) has 3 items ( oversize )
		-- quantity:	25,			 50,		 70
		-- price:	450.000,	500.000,	480.000
		
-- Men
		-- T-Shirt (3) has 3 items 
					-- quantity:	30,			 100,		 90
					-- price:	300.000,	320.000,	380.000	

		-- Jeans (4) has 3 items 
						-- quantity:	40,			 80,		200
						-- price:	550.000,	580.000,	500.000	
-- Women
		-- Jeans (5) has 3 items
						-- quantity:	30,			 150,		85
						-- price:	480.000,	580.000,	600.000	

		-- Croptop (6) has 3 items ( oversize )
						-- quantity:	99,			 30,		20
						-- price:	150.000,	220.000,	180.000	
