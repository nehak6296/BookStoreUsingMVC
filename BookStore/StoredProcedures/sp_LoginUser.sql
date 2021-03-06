USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUser]    Script Date: 09-06-2021 04:56:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_LoginUser]
(
        @Email varchar(255),
        @Password varchar(50)
)
as
begin
	begin try
		declare @status int
		if exists(select * from [User] where @Email=@Email and @Password=@Password)
			return 1			
		else
			set @status=0
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
