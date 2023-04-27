/*User Details*/

CREATE TABLE [SpotifyERP].[dbo].[userdetails] (
	id uniqueidentifier not null primary key default newid(),
	authid uniqueidentifier not null foreign key references auth(id),
	emailaddress varchar(255) not null,
	dateofbirth date,
	gendre varchar(10) not null check (gendre in ('Male','Female','Others')),
	profilename varchar(255) not null,
	firstname varchar(255) not null,
);

/*PasswordDetails_Secured*/
CREATE TABLE [SpotifyERP].[dbo].auth (
	id uniqueidentifier not null primary key default newid(),	
	password varchar(25) not null,
);

CREATE TABLE [SpotifyERP].[dbo].[paymentdetails] (
	id uniqueidentifier not null primary key default newid(),	
	userid uniqueidentifier not null foreign key references userdetails(id),
	paymentmethod varchar(255) not null,
	cardname varchar(255) not null,
	cardtype varchar(255) not null,
	cardnumber varchar(255) not null,
	cardexpiry date not null,
	paiddate varchar(255) not null,
	paidtime varchar(255) not null,
	amountpaid float(53) not null,
);

CREATE TABLE [SpotifyERP].[dbo].[subscription] (
	id uniqueidentifier not null primary key default newid(),	
	userid uniqueidentifier not null foreign key references userdetails(id),
	paymentid uniqueidentifier not null foreign key references paymentdetails(id),
	subscription_plan varchar(255) not null,
	subscriptionexpiry date not  null,
);

/*Music Details*/

CREATE TABLE [SpotifyERP].[dbo].[storagedetails] (
	id uniqueidentifier not null primary key default newid(),
	fileurl varchar(255) not null,
	itemname varchar(255) not null,
	filesize varchar(255) not null,
	createdon varchar(255) not null,
	createdby varchar(255) not null,
);

CREATE TABLE [SpotifyERP].[dbo].[Musicdetails] (
	id uniqueidentifier not null primary key default newid(),	
	storageid uniqueidentifier not null foreign key references storagedetails(id),
	songname varchar(255) not null,
	songprofileimage image,
	singername varchar(255) not null,
	artist image,
	albumname varchar(255) not null,
	albumimage image,
	writer varchar(255) not null,
	yearof varchar(255) not null,
	lang varchar(255) not null,
	dateofrelease date not null,
	timeofrelease time,
	movie varchar(50),
	actor_actress varchar(50),
	musictype varchar(50),
	otherdetail varchar(255),
);

CREATE TABLE [SpotifyERP].[dbo].[playlist] (
	id uniqueidentifier not null primary key default newid(),
	userid uniqueidentifier not null foreign key references userdetails(id),
	playlistname varchar(255),
	numberofsongs float(53),
	createdby varchar(255),
);

CREATE TABLE [SpotifyERP].[dbo].[playlistsongs] (
	id uniqueidentifier not null primary key default newid(),	
	playlistid uniqueidentifier not null foreign key references playlist(id),
	musicid uniqueidentifier not null foreign key references Musicdetails(id),
);

CREATE TABLE [SpotifyERP].[dbo].[blend] (
	id uniqueidentifier not null primary key default newid(),	
	playlistsongsid uniqueidentifier not null foreign key references playlistsongs(id),
);


SELECT * FROM [SpotifyERP].[dbo].[userdetails]
SELECT * FROM [SpotifyERP].[dbo].auth
SELECT * FROM [SpotifyERP].[dbo].[paymentdetails]
SELECT * FROM [SpotifyERP].[dbo].[subscription]
SELECT * FROM [SpotifyERP].[dbo].[subscription_user]
SELECT * FROM [SpotifyERP].[dbo].[storagedetails]
SELECT * FROM [SpotifyERP].[dbo].[Musicdetails]
SELECT * FROM [SpotifyERP].[dbo].[playlist]
SELECT * FROM [SpotifyERP].[dbo].[playlistsongs]
SELECT * FROM [SpotifyERP].[dbo].[blend]


DROP TABLE [SpotifyERP].[dbo].[userdetails]
DROP TABLE [SpotifyERP].[dbo].auth
DROP TABLE [SpotifyERP].[dbo].[paymentdetails]
DROP TABLE [SpotifyERP].[dbo].[subscription]
DROP TABLE [SpotifyERP].[dbo].[storagedetails]
DROP TABLE [SpotifyERP].[dbo].[Musicdetails]
DROP TABLE [SpotifyERP].[dbo].[playlist]
DROP TABLE [SpotifyERP].[dbo].[playlistsongs]
DROP TABLE [SpotifyERP].[dbo].[blend]