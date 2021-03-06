USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 27-05-2021 01:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_RegisterUser]  
(  
   @FirstName varchar (50), 
   @LastName varchar (50), 
   @Email varchar (255),  
   @Password varchar (50)  
)  
as  
begin 
begin try
	if not exists(select Email from [User] where Email = @Email)
	begin	
	 Insert into [User] values(@FirstName,@LastName,@Email,@Password)  
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
