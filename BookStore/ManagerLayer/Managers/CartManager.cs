﻿using ManagerLayer.Interfaces;
using ModelsLayer;
using RepositoryLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManagerLayer.Managers
{
    public class CartManager : ICartManager
    {
        private readonly ICartRepo cartRepo;
        public CartManager(ICartRepo cartRepo)
        {
            this.cartRepo = cartRepo;
        }
        public Cart AddToCart(Cart cartModel)
        {
            return this.cartRepo.AddToCart(cartModel);
        }

        public List<Cart> GetAllCart()
        {
            return this.cartRepo.GetAllCart();
        }

        public bool RemoveFromCart(int cartId, int userId)
        {
            return this.cartRepo.RemoveFromCart(cartId,userId);
        }

    }
}