using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public partial class Product
    {

        public static Product UrunOlustur(int categoryID, string productName, int quantity, decimal price, string photoPath)
        {
            Product p = new Product();
            p.CategoryID = categoryID;
            p.ProductName = productName;
            p.Quantity = quantity;
            p.Price = price;
            p.PhotoPath = photoPath;
            return p;
        }
        //public static Product UrunOlusturByID(int ID)
        //{
        //    int id = Gg
        //    return p;
        //}
    }

    public partial class GgDBEntities
    {
        public List<Product> GetProductList()
        {
            return Product.Where(i => i.Deleted == false).ToList();
        }

        public void AddProduct(int supplierID, int categoryID, string productName, int quantity, decimal price, string photoPath)
        {
            Product p = new Product();
            p.Quantity = quantity;
            p.ProductName = productName;
            p.PhotoPath = photoPath;
            p.CategoryID = categoryID;
            p.SupplierID = supplierID;
            p.Price = price;      
        }

        public void AddProduct(int supplierID, Product p)
        {
            p.SupplierID = supplierID;
            AddToProduct(p);
        }

    }
}
