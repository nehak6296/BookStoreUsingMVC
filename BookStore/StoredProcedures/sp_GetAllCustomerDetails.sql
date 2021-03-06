USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomerDetails]    Script Date: 07-06-2021 05:28:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[sp_GetAllCustomerDetails]  (
	@UserId int
)
as  
begin  
   begin try
		if exists (select UserId from Customer where UserId = @UserId)
	begin
		--select [User].UserId, FirstName, LastName,Email,Password
		--from [User] inner join Customer on [User].UserId = Customer.CustomerId 
		--where [User].UserId = @UserId
		select * from Customer where UserId=@UserId
	end
	end try
	begin catch
			 SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
	end catch 
End
