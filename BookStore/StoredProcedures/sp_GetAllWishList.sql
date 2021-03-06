USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllWishList]    Script Date: 11-06-2021 02:47:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[sp_GetAllWishList]  (
	@UserId int
)
as  
begin  
   begin try
		if exists (select UserId from WishList where UserId = @UserId)
	begin
		select Book.BookId, BookName, Author,Details, Price,Image,WishList.WishListQuantity,WishList.WishListId
		from Book inner join WishList on Book.BookId = WishList.BookId 
		where UserId = @UserId
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
