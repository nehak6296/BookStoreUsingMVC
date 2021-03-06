USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomerDetails]    Script Date: 07-06-2021 10:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_UpdateCustomerDetails](
	@CustomerId int,
	@Name varchar(50),
	@PhoneNumber int ,
	@Address varchar(255),
	@Locality varchar(50),
	@Landmark varchar(50),
	@Pincode int,
	@City varchar(50),
	@Type varchar(50)
)
as
begin	
	begin try
		if exists(select CustomerId from [Customer] where CustomerId=@CustomerId)
		Update [Customer] 
		set Name=@Name ,
			PhoneNumber=@PhoneNumber,
			Address=@Address,
			Locality=@Locality,
			Landmark=@Landmark,
			Pincode=@Pincode,
			City=@City,
			Type=@Type 
		where CustomerId=@CustomerId
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