using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public partial class Supplier
    {

    }
    public partial class GgDBEntities
    {
        public List<Supplier> GetSupplierList()
        {
            return Supplier.Where(i => i.Deleted == false).ToList();
        }

        public void AddSupplier(int userID, int districtID, string companyName, string adress, string phone, string photoPath)
        {
            Supplier s = new Supplier();
            s.Adress = adress;
            s.CompanyName = companyName;
            s.CompanyPhoto = photoPath;
            s.DistrictID = districtID;
            s.UserID = userID;
            s.Phone = phone;
            AddToSupplier(s);
            SaveChanges();
        }
    }
}
