USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCustomerDetails]    Script Date: 07-06-2021 09:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AddCustomerDetails]
(
@UserId int,
@Name varchar(50),
	@PhoneNumber int ,
	@Address varchar(255),
	@Locality varchar(50),
	@Landmark varchar(50),
	@Pincode int,
	@City varchar(50),
	@Type varchar(50))
as
begin
	begin try
	 Insert into [Customer] values(@UserId,@Name,@PhoneNumber,@Address,@Locality,@Landmark,@Pincode,@City,@Type)  
	end try
	begin catch
		 SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
	end catch
end

