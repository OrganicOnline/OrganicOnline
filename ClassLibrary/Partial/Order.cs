using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public partial class Order
    {

    }

    public partial class GgDBEntities
    {
        public Order AddOrder(int CustomerId, int ProductId, int StatusId, int PaymentTypeId, float Quantity, string DeliveryAddress, string DeliveryNote, int OrderCode)
        {
            Order o = new Order();
            o.CustomerId = CustomerId;
            o.ProductId = ProductId;
            o.StatusId = StatusId;
            o.PaymentTypeId = PaymentTypeId;
            o.Quantity = Quantity;
            o.DeliveryAddress = DeliveryAddress;
            o.DeliveryNote = DeliveryNote;
            o.OrderCode = OrderCode;
            o.OrderDate = DateTime.Now;
            o.LastOperationDate = DateTime.Now;
            AddToOrder(o);
            return o;
        }
        public List<Order> GetOrderByCustomerId(int customerId)
        {
            return Order.Where(i => i.CustomerId == customerId && !i.Deleted).ToList();
        }
        public List<Order> GetOrderBySupplierId(int supplierId)
        {
            return Order.Where(i => i.Product.SupplierID == supplierId && !i.Deleted).ToList();
        }
        public Order GetOrderByObjectId(int id)
        {
            return Order.FirstOrDefault(i => i.ObjectId == id);
        }
    }

}
